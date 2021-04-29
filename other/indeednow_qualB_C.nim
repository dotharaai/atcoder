import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    n = scan()
    e = newseqwith(n,newseq[int](0))
    u = initHashSet[int](2^6)
    r = newseq[int](0)
  for i in 0..<n-1:
    var (a,b)=(scan()-1,scan()-1)
    e[a].add(b)
    e[b].add(a)
  var q = initHeapQueue[int]()
  q.push(0)
  while q.len>0:
    var now = q.pop()
    r.add(now)
    u.incl(now)
    for next in e[now]:
      if next notin u:
        q.push(next)
  return r.mapit(it+1).join(" ")


    

    
  
echo solve()