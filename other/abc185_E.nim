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



proc solve():int=
  var
    (n,m)=(scan(),scan())
    a = newseqwith(n,scan())
    b = newseqwith(m,scan())
    dp = newseqwith(n+1,newseqwith(m+1,int.high.div(2)))
  dp[0][0]=0
  for ai in 1..n:
    dp[ai][0]=dp[ai-1][0]+1
  for bi in 1..m:
    dp[0][bi]=dp[0][bi-1]+1
  
  for ai in 1..n:
    for bi in 1..m:
      dp[ai][bi]=min(@[
        dp[ai-1][bi]+1,
        dp[ai][bi-1]+1,
        dp[ai-1][bi-1]+int(a[ai-1]!=b[bi-1])
      ])
  return dp[n][m]


      

  
  
echo solve()