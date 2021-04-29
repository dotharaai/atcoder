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



proc solve():string=
  var
    n = scan()
    ng = newseqwith(3,scan())
    dp = newseqwith(n+3,int.high.div(4))
  dp[0]=0
  for i in 0..<n:
    if i+1 notin ng:
      dp[i+1].min=dp[i]+1
    if i+2 notin ng:
      dp[i+2].min=dp[i]+1
    if i+3 notin ng:
      dp[i+3].min=dp[i]+1
  if dp[n] > 100:
    return "NO"
  else:
    return "YES"
    
  
echo solve()