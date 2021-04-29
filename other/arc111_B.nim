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


type simple_queue[T] = object
  payload:seq[T]
  pos:int
proc init_simple_queue*[T]():auto = simple_queue[T](payload:newSeq[T](), pos:0)
# TODO
#      void reserve(int n) { payload.reserve(n); }
proc len*[T](self:simple_queue[T]):int = self.payload.len - self.pos
proc empty*[T](self:simple_queue[T]):bool = self.pos == self.payload.len
proc push*[T](self:var simple_queue[T], t:T) = self.payload.add(t)
proc front*[T](self:simple_queue[T]):T = self.payload[self.pos]
proc clear*[T](self:var simple_queue[T]) =
  self.payload.setLen(0)
  self.pos = 0;
proc pop*[T](self:var simple_queue[T]) = self.pos.inc


type edge = ref object
  to:int
  cap:int
  rev:int



proc solve():int=
  var
    n = scan()
    cards =  200000# 高々いくつ
    values = 400000 # 高々いくつ
    N = 2 + cards+values
    nodes = newseqwith(N,newseq[edge]())

  proc addEdge(s,t,cap:int)=
    var e = new edge
    e.to = t
    e.cap = cap
    e.rev = nodes[t].len
    var re = new edge
    re.to = s
    re.cap = 0
    re.rev = nodes[s].len
    
    nodes[s].add(e)
    nodes[t].add(re)
    



  proc maxFlow(s,t:int,flow_limit:int=int.high):int=
    var
      flow = 0
      s = s
      t = t
      que = init_simple_queue[int]()
      level = newseqwith(N,0)
      iter = newseqwith(N,0)

    proc bfs()=
      que.clear()
      que.push(s)
      level.fill(-1)
      level[s]=0
      while not que.empty:
        var
          p = que.front()
        que.pop()
        for m in 0..<nodes[p].len:
          var e = nodes[p][m]
          if level[e.to] < 0 and e.cap>0:
            level[e.to]=level[p]+1
            que.push(e.to)
    
    proc dfs(v:int,flow:int):int=
      if v == s:
        return flow
      let level_v = level[v]
      var i = iter[v].addr
      while i[] < nodes[v].len:
        let e = nodes[v][i[]].addr
        if level_v <= level[e[].to] or nodes[e[].to][e[].rev].cap == 0:
          i[].inc
          continue
        let d = dfs(e.to, min(flow-result,nodes[e[].to][e[].rev].cap))
        if d <= 0:
          i[].inc
          continue
        nodes[v][i[]].cap+=d
        nodes[e[].to][e[].rev].cap-=d
        result+=d
        if result == flow:
          break
        i[].inc
      
    

    while flow < flow_limit:
      bfs()
      if level[t]<0:break
      iter.fill(0)
      while flow < flow_limit:
        let f = dfs(t,flow_limit-flow)
        if f==0:break
        flow+=f
    return flow


  # sから各カードへのフロー
  for i in 1..n:
    addEdge(0,i,1)

  # 各色からtへのフロー
  for color in 1..values:
    addEdge(color+cards,N-1,1)
  
  for card in 1..n:
    var (a,b)=(scan(),scan())
    addEdge(card,cards+a,1)
    addEdge(card,cards+b,1)
  return maxFlow(0,N-1)




      



  

  
  
    
echo solve()