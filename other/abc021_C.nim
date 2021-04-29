import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques,heapqueue
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





type Node2 = object
  node:int
  cost: int
  

proc `<`(a,b:Node2): bool = a.cost < b.cost





proc solve():int=
  var
    n = scan()
    (a,b)=(scan()-1,scan()-1)
    m = scan()
    adj = newseqwith(n,newseqwith(n,0))
    dist=newseqwith(n,newseqwith(n,int.high.div(4)))
  
  for i in 0..<n:
    dist[i][i]=0


  proc dijkstra(start:int)=
    var q = initHeapQueue[Node2]()
    
    for t in 0..<n:
      if adj[start][t]>0:
        q.push(Node2(cost:adj[start][t], node:t))
        dist[start][t]=adj[start][t]
    while q.len>0:
      var node2 = q.pop()
      for t in 0..<n:
        if adj[node2.node][t]>0:
          if dist[start][node2.node]+adj[node2.node][t] < dist[start][t]:
            dist[start][t]=dist[start][node2.node]+adj[node2.node][t]
            q.push(Node2(cost:dist[start][node2.node]+adj[node2.node][t],node:t))

  proc removeEdges()=
    for f in 0..<n:
      for t in 0..<n:
        if adj[f][t]>0:
          if dist[a][b]-(dist[a][f]+dist[t][b])!=1:
            adj[f][t]=0




  for i in 0..<m:
    var (f,t)=(scan()-1,scan()-1)
    adj[f][t]=1
    adj[t][f]=1
  for i in 0..<n:
    dijkstra(i)
  #for d in dist:
    #echo d
  #echo ""
  removeEdges()
  #for ad in adj:
    #echo ad
  var dp = newseqwith(dist[a][b]+1,newseqwith(n,0))
  dp[0][a]=1
  for i in 1..dist[a][b]:
    for f in 0..<n:
      for t in 0..<n:
        if adj[f][t]>0:
          dp[i][t]+=dp[i-1][f]
          dp[i][t].mod=(1E9.int+7)
  #echo ""
  #for dpp in dp:
    #echo dpp
  return dp[^1][b]
  

  
    

    
  
echo solve()