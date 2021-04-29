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
    n = scan()
    s = newseqwith(n,read())
    dp = newseqwith(n+1,newseqwith(2,0))
  # dp[i][0] := i個目まで決定していてfalseになる数列
  # if s[i]=="AND":
  # dp[i][0] = dp[i-1][0]
  # dp[i][1] := i個目まで決定していてtrueになる数列
  dp[0][0]=1
  dp[0][1]=1
  for i in 1..n:
    if s[i-1]=="AND":
      dp[i][1]=dp[i-1][1]
      dp[i][0]=dp[i-1][1]+dp[i-1][0]*2
    else:
      dp[i][1]=dp[i-1][1]*2 + dp[i-1][0]
      dp[i][0]=dp[i-1][0]
  return dp[n][1]

  
  

  
echo solve()