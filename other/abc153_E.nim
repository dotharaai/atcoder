import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (h,n) = (scan(),scan())
    a = newseq[int](n)
    b = newseq[int](n)
    dp = newseqwith(h+1,int.high div 2)
  dp[0] = 0
  
  for i in 0..<n:
    (a[i],b[i]) = (scan(),scan())
  for i in 1..h:
    for magic in 0..<n:
      dp[i] = min(dp[i],dp[max(0,i-a[magic])]+b[magic])
  return dp[h]
  


echo solve()