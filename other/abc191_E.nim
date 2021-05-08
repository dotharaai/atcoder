import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques,random,heapqueue
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




proc solve()=
  var
    n = scan()
    m = scan()
    inf = int.high.div(2)
    es = newseqwith(n,newseq[int]())
    costs = newseqwith(n,newseq[int]())
    dist = newseqwith(n,newseqwith(n,inf))
    self = newseqwith(n,inf)
  for i in 0..<m:
    var (a,b,c) = (scan()-1,scan()-1,scan())
    if a==b:
      self[a].min=c
    else:
      es[a].add(b)
      costs[a].add(c)

  proc dijkstra(s:int)=
    dist[s][s] = 0
    var
      q = initHeapQueue[(int,int)]()
    q.push((0,s))
    while q.len>0:
      var
        (cost,p) = q.pop()
      if dist[s][p] < cost:
        continue
      for (nxt,c) in zip(es[p],costs[p]):
        if dist[s][nxt] > cost+c:
          dist[s][nxt] = cost+c
          q.push((cost+c,nxt))
  for i in 0..<n:
    dijkstra(i)
    #echo dist[i]
  for s in 0..<n:
    var res = inf
    for t in 0..<n:
      if s != t:
        res.min=dist[s][t]+dist[t][s]
      else:
        res.min=self[s]
    if res == inf:
      echo "-1"
    else:
      echo res


  
  
solve()