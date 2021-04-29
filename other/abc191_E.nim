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
    (n,m)=(scan(),scan())
    neib = newseqwith(n,newseqwith(n,int.high))
    edges = newseqwith(n,newseq[(int,int)]())
    iedges = newseqwith(n,newseq[(int,int)]())
    dist = newseqwith(n,newseqwith(n,int.high.div(4)))
    idist = newseqwith(n,newseqwith(n,int.high.div(4)))
    self = newseqwith(n,int.high.div(4))
  
  for i in 0..<m:
    var (a,b,c)=(scan()-1,scan()-1,scan())
    neib[a][b].min=c
    
  for i in 0..<n:
    dist[i][i]=0
    idist[i][i]=0
    for j in 0..<n:
      if neib[i][j]<int.high:
        if i==j:
          self[i]=neib[i][j]
        else:
          edges[i].add((j,neib[i][j]))
          iedges[j].add((i,neib[i][j]))

  proc dijk(s:int)=
    var q = initHeapQueue[(int,int)]()
    q.push((0,s))
    while q.len>0:
      var (cost, p) = q.pop()
      if cost > dist[s][p]:
        continue
      else:
        for (node,c) in edges[p]:
          if dist[s][node] > c + dist[s][p]:
            dist[s][node] = c + dist[s][p]
            q.push((dist[s][node],node))
      
  proc idijk(s:int)=
    var q = initHeapQueue[(int,int)]()
    q.push((0,s))
    while q.len>0:
      var (cost, p) = q.pop()
      if cost > idist[s][p]:
        continue
      else:
        for (node,c) in iedges[p]:
          if idist[s][node] > c + idist[s][p]:
            idist[s][node] = c + idist[s][p]
            q.push((idist[s][node],node))
  
  for i in 0..<n:
    dijk(i)
    idijk(i)
  #echo join(dist,"\n")
  for i in 0..<n:
    var v = self[i]
    for j in 0..<n:
      if i!=j:
        v.min=(dist[i][j]+idist[i][j])
    if v==int.high.div(4):
      v = -1
    echo v
  




    
    





    
  
solve()