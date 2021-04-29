import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')




var
  amax:int
  cost_a_b:int
  bmax:int
  cost_b_a:int
  aidx = 0
  bidx = 0
  a:seq[int]
  b:seq[int]

proc AtoB(now:int,count:int=0):int



proc BtoA(now:int, count:int=0):int=
  for i in bidx..<bmax:
    if b[i]>=now:
      bidx = i
      return AtoB(b[i]+cost_b_a,count+1)
  return count

proc AtoB(now:int, count:int = 0):int=
  for i in aidx..<amax:
    if a[i]>=now:
      aidx = i
      return BtoA(a[i]+cost_a_b,count+1)
  return count
  


proc solve():int=
  (amax,bmax) = (scan(),scan())
  (cost_a_b,cost_b_a) = (scan(),scan())
  a = newseqwith(amax,scan())
  b = newseqwith(bmax,scan())
  return AtoB(0) div 2


    
  
echo solve()