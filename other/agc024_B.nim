import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    n = scan()
    p = newseqwith(n,scan()-1)
    q = newseqwith(n,0)
    dp = newseqwith(n,0)
  for idx, v in p:
    q[v]=idx
  for idx in 0..<n:
    if p[idx]>0 and q[p[idx]-1]<idx:
      dp[idx]=dp[q[p[idx]-1]]+1
    else:
      dp[idx]=0
  return n-dp.max()-1
  
  
    

    
  
echo solve()