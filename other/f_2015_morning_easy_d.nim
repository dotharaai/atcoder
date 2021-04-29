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

proc lcs(a,b:string):int=
  var dp = newseqwith(a.len+1,newseqwith(b.len+1,0))
  for ai in 1..a.len:
    for bi in 1..b.len:
      if a[ai-1]==b[bi-1]:
        dp[ai][bi]=dp[ai-1][bi-1]+1
      else:
        dp[ai][bi]=max(dp[ai-1][bi],dp[ai][bi-1])
  return dp.mapIt(it.max).max()
  


proc solve():int=
  var
    n = scan()
    s = read()
  # 部分文字列で一番長い平方との差が操作回数のやつな
  # n-1箇所で切断してそれぞれLCSする
  for i in 1..<n:
    var (a,b)=(s[0..<i],s[i..<n])
    #echo a,", ",b, ", ",lcs(a,b)
    result.max=lcs(a,b)
  return n-result*2
    

    
  
echo solve()