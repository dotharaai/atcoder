import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc can(a:var seq[int], k,mid:int):bool=
  var lest = k
  for i,v in a:
    lest -= (v.float/mid.float).ceil().int - 1
    if lest<0:
      return false
  return true




proc solve():int=
  var
    (n, k) = (scan(), scan())
    a = newseqwith(n,scan())
    ub = int.high.div(4)
    lb = 1
    mid:int
  while ub-lb > 1:
    mid = (ub+lb).div(2)
    #echo lb, ", ", mid, ", ",ub, " => ",can(a,k,mid)
    if can(a,k,mid):
      ub = mid
    else:
      lb = mid
  for i in mid-1..mid+1:
    if can(a,k,i):
      return i

  
  
  
    

    
  
echo solve()