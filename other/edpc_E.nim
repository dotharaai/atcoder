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
    inf = int.high.div(4)
    (n, mw) = (scan(),scan())
    w = newseqwith(n,0)
    v = newseqwith(n,0)
    mv = 1E3.int*n
    dp = newseqwith(mv+1,inf)

  for idx in 0..<n:
    (w[idx],v[idx])=(scan(),scan())
  dp[0]=0
  for idx in 0..<n:
    for tv in countdown(mv, 0):
      if tv-v[idx]>=0:
        dp[tv].min=(dp[tv-v[idx]]+w[idx])
  for value, weight in dp:
    if weight<=mw:
      result.max=value

  
    

    
  
echo solve()