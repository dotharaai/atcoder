import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
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



proc solve():int=
  var
    inf = 2^30
    (n,m)=(scan(),scan())
    (s,t)=(scan()-1,scan()-1)
    edges = newseqwith(n,newseq[int]())
    costs = newseqwith(n,newseq[int]())
  for i in 0..<m:
    var (f,t,c)=(scan()-1,scan()-1,scan())
    edges[f].add(t)
    edges[t].add(f)
    costs[t].add(c)
    costs[f].add(c)
  proc bellman_ford(s:int,dist: var seq[int]):bool=
    for i in 0..<n:
      dist[i]=inf
    dist[s]=0
    for i in 0..<n:
      for v in 0..<n:
        for nextIdx in 0..<len(edges[v]):
          var
            next=edges[v][nextIdx]
            cost = costs[v][nextIdx]

          if dist[v]!=inf and dist[next]>dist[v]+cost:
            dist[next]=dist[v]+cost
            if i==n-1:
              return true
    return false
  var
    distFromS = newseq[int](n)
    distFromT = newseq[int](n)
    sres = bellman_ford(s,distFromS)
    tres = bellman_ford(t,distFromT)
  result  = -1
  for u in 0..<n:
    if distFromS[u]==distFromT[u] and distFromS[u]!=inf:
      result=u+1

    



  
  return
  
    

    
  
echo solve()