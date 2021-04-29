import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')




proc solve():int=
  var 
    (n,k)=(scan(),scan())
    a = newseqwith(n,scanf())
    q = initHeapQueue[float]()
  echo a.sum()/(n.toFloat+k.toFloat)
  for v in a:
    q.push(-v)
  while q.len>0 and k > 0:
    #echo q
    k-=1
    var t = -q.pop()
    q.push(-t/2)
    q.push(-t/2)
  return (-q.pop).ceil.toInt
  

echo solve()