import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc pmod(x:int,m:int):int=
  return ((x.mod(m)+m)).mod(m)

proc solve():int=
  var
    n = scan()
    x = scan()
    a = @[0] & newseqwith(n,scan())
    dp:seq[seq[seq[int]]]
  result = int.high
  for k in 1..n:
    dp = newseqwith(n+1,newseqwith(k+1,newseqwith(k,-int.high.div(4))))
    dp[0][0][0] = 0
    for item in 1..n:
      for use in 1..k:
        for md in 0..<k:
          dp[item][use][md] = max(dp[item-1][use][md], dp[item-1][use-1][(md-a[item]).pmod(k)]+a[item])
    #echo k
    #echo dp.join("\n")
    for md in 0..<k:
      if  dp[n][k][md] >= 0 and (x - dp[n][k][md]).mod(k)==0:
        result.min=(x - dp[n][k][md]).div(k)
    


echo solve() 