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


type Edge = ref object
  to:int
  rev:int
  cap:int




proc dinic():int=
  var
    n = scan()
    red = newseqwith(n,(scan(),scan()))
    blue = newseqwith(n,(scan(),scan()))
    nodes = newseqwith(2*n+2,newseq[Edge]())
    source = n*2
    term = n*2+1
    level = newseqwith(2*n+2,-1)


  proc addEdge(s,t:int,cap:int)=
    var
      norm = Edge(to:t,cap:cap,rev:nodes[t].len)
      inv = Edge(to:s,cap:0,rev:nodes[s].len)
    nodes[s].add(norm)
    nodes[t].add(inv)
    

  
  # red:node[0]~[n-1]
  # blue:node[n]~[2*n-1]
  # source:node[2*n]
  # terminal:node[2*n+1]
  for r in 0..<n:
    for b in 0..<n:
      if red[r][0]<blue[b][0] and red[r][1]<blue[b][1]:
        addEdge(r,n+b,1)
  for r in 0..<n:
    addEdge(source,r,1)
  for b in 0..<n:
    addEdge(n+b,term,1)

  proc dfs(p,t,flow:int):int=
    if p==t:
      return flow
    for edge in nodes[p]:
      if edge.cap>0 and level[p]<level[edge.to]:
        result = dfs(edge.to,t,min(edge.cap,flow))
        if result>0:
          edge.cap-=result
          nodes[edge.to][edge.rev].cap+=result
          return result
    return 0
      

  proc bfs(s,t:int)=
    var q = initDeque[int]()
    level.fill(-1)
    level[s]=0
    q.addLast(s)
    while q.len>0:
      var p = q.popFirst()
      for edge in nodes[p]:
        if level[edge.to]<0 and edge.cap>0:
          level[edge.to]=level[p]+1
          q.addLast(edge.to)

  proc maxFlow(ss,tt:int):int=
    result = 0
    while true:
      bfs(ss,tt)
      if level[tt]<0:return
      var t = dfs(ss,tt,int.high.div(2))
      while t>0:
        result+=t
        t = dfs(ss,tt,int.high.div(2))
  
  return maxFlow(source,term)
  

  

  
  

echo dinic()
