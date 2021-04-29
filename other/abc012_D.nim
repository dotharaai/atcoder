import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')




var
    (n, m) = (scan(), scan())
    a  = newseq[int](m)
    b  = newseq[int](m)
    c  = newseq[int](m)
    inf = int.high div 4
    edges = newseqwith(n,newseq[int](0))
    costs = newseqwith(n,newseq[int](0))
    dist  = newseqwith(n,newseqwith(n,inf))
    pred  = newseqwith(n,newseqwith(n,-1))



type Node2 = object
  node:int
  cost: int
  

proc `<`(a,b:Node2): bool = a.cost < b.cost


proc dijkstra(start:int)=
  var q = initHeapQueue[Node2]()
  for (edge,cost) in zip(edges[start],costs[start]):
    q.push(Node2(cost:cost,node:edge))
    dist[start][edge] = cost
  while q.len>0:
    var node2 = q.pop()
    for (edge,cost) in zip(edges[node2.node], costs[node2.node]):
      if dist[start][node2.node]+cost < dist[start][edge]:
        dist[start][edge] = dist[start][node2.node]+cost
        q.push(Node2(cost:dist[start][node2.node]+cost, node:edge))






proc solve():int=
  for i in 0..<m:
    (a[i],b[i],c[i]) = (scan()-1,scan()-1,scan())
    edges[a[i]].add(b[i])
    costs[a[i]].add(c[i])
    edges[b[i]].add(a[i])
    costs[b[i]].add(c[i])
  for i in 0..<n:
    dist[i][i] = 0
  for s in 0..<n:
    dijkstra(s)
  result = inf
  for t in dist:
    result.min=t.max
  return 
  
    

    
  
echo solve()