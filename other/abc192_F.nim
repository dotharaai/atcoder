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
    (n,x)=(scan(),scan())
    dp:seq[seq[seq[int]]]
    a = @[0] & newseqwith(n,scan())
  result = x-a.max
  for  C in 1..n:
    dp = newseqwith(n+1,newseqwith(C+1,newseqwith(C, -int.high.div(4))))
    dp[0][0][0] = 0
    for i in 1..n:
      for j in 1..C:
        for k in 0..<C:
          #echo fmt"{i},{j},{k}"
          dp[i][j][k].max= max(dp[i-1][j-1][(k-a[i]).pmod(C)]+a[i], dp[i-1][j][k])
    
    for t in 0..<C:
      if (x - dp[n][C][t]) mod C == 0:
        result.min=(x-dp[n][C][t]).div(C)



echo solve() 