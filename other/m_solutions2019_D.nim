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



proc solve()=
  var
    n = scan()
    e = newseqwith(n,newseq[int](0))
    c:seq[int]
    v = newseqwith(n,-1)
    q = initDeque[int]()
  for i in 0..<n-1:
    var (a,b)=(scan()-1,scan()-1)
    e[a].add(b)
    e[b].add(a)
  c = newseqwith(n,scan()).sorted(SortOrder.Descending)
  q.addLast(0)
  var idx = 0
  while q.len>0:
    var now = q.popFirst
    if v[now]>=0:
      continue
    v[now]=c[idx]
    idx+=1
    for next in e[now]:
      q.addLast(next)
  echo c[1..<c.len].sum()
  echo v.join(" ")




  
    

    
  
solve()