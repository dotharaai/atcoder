
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


type Cap = int

type edge[Cap] = object
  dst, rev:int
  cap:Cap

type MFGraph*[Cap] = object
  n:int
  pos:seq[(int,int)]
  g:seq[seq[edge[Cap]]]

proc init_mf_graph*[Cap](n:int):auto = MFGraph[Cap](n:n, g:newSeq[seq[edge[Cap]]](n))

proc add_edge*[Cap](self: var MFGraph[Cap], src, dst:int, cap:Cap):int {.discardable.}=
  assert src in 0..<self.n
  assert dst in 0..<self.n
  assert 0.Cap <= cap
  let m = self.pos.len
  self.pos.add((src, self.g[src].len))
  var src_id = self.g[src].len
  var dst_id = self.g[dst].len
  if src == dst: dst_id.inc
  self.g[src].add(edge[Cap](dst:dst, rev:dst_id, cap:cap))
  self.g[dst].add(edge[Cap](dst:src, rev:src_id, cap:0))
  return m

type EdgeInfo*[Cap] = object
  src*, dst*:int
  cap*, flow*:Cap

proc get_edge*[Cap](self: MFGraph[Cap], i:int):EdgeInfo[Cap] =
  let m = self.pos.len
  assert i in 0..<m
  let e = self.g[self.pos[i][0]][self.pos[i][1]]
  let re = self.g[e.dst][e.rev]
  return EdgeInfo[Cap](src:self.pos[i][0], dst:e.dst, cap:e.cap + re.cap, flow:re.cap)

proc edges*[Cap](self: MFGraph[Cap]):seq[EdgeInfo[Cap]] =
  let m = self.pos.len
  result = newSeqOfCap[EdgeInfo[Cap]](m)
  for i in 0..<m:
    result.add(self.get_edge(i))

proc change_edge*[Cap](self: var MFGraph[Cap], i:int, new_cap, new_flow:Cap) =
  let m = self.pos.len
  assert i in 0..<m
  assert new_flow in 0..new_cap
  var e = self.g[self.pos[i][0]][self.pos[i][1]].addr
  var re = self.g[e[].dst][e[].rev].addr
  e[].cap = new_cap - new_flow
  re[].cap = new_flow


proc flow*[Cap](self: var MFGraph[Cap], s, t:int, flow_limit:Cap):Cap =
  assert s in 0..<self.n
  assert t in 0..<self.n
  assert s != t

  var level, iter = newSeq[int](self.n)
  var que = init_simple_queue[int]()
#    internal::simple_queue<int> que;

  proc bfs(self: MFGraph[Cap]) =
    level.fill(-1)
    level[s] = 0
    que.clear()
    que.push(s)
    while not que.empty():
      let v = que.front()
      que.pop()
      for e in self.g[v]:
        if e.cap == 0 or level[e.dst] >= 0: continue
        level[e.dst] = level[v] + 1
        if e.dst == t: return
        que.push(e.dst)
  proc dfs(self: var MFGraph[Cap], v:int, up:Cap):Cap =
    if v == s: return up
    result = Cap(0)
    let level_v = level[v]
    var i = iter[v].addr
    while i[] < self.g[v].len:
      let e = self.g[v][i[]].addr
      if level_v <= level[e[].dst] or self.g[e[].dst][e[].rev].cap == 0:
        i[].inc
        continue
      let d = self.dfs(e.dst, min(up - result, self.g[e[].dst][e[].rev].cap))
      if d <= 0:
        i[].inc
        continue
      self.g[v][i[]].cap += d
      self.g[e[].dst][e[].rev].cap -= d
      result += d
      if result == up: break
      i[].inc

  var flow = Cap(0)
  while flow < flow_limit:
    self.bfs()
    if level[t] == -1: break
    iter.fill(0)
    while flow < flow_limit:
      let f = self.dfs(t, flow_limit - flow)
      if f == Cap(0): break
      flow += f
  return flow

proc flow*[Cap](self: var MFGraph[Cap], s,t:int):auto = self.flow(s, t, Cap.high)

proc min_cut*[Cap](self:MFGraph[Cap], s:int):seq[bool] =
  var visited = newSeq[bool](self.n)
  var que = init_simple_queue[int]()
  que.push(s)
  while not que.empty():
    let p = que.front()
    que.pop()
    visited[p] = true
    for e in self.g[p]:
      if e.cap != Cap(0) and not visited[e.dst]:
        visited[e.dst] = true
        que.push(e.dst)
  return visited

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
    n = scan()
    cards =  200000# 高々いくつ
    values = 400000 # 高々いくつ
    N = 2 + cards+values
    graph = init_mf_graph[Cap](N)
 
  # sから各カードへのフロー
  for i in 1..n:
    discard add_edge[Cap](graph,0,i,1)

  # 各色からtへのフロー
  for color in 1..values:
    discard add_edge[Cap](graph,color+cards,N-1,Cap(1))
  
  for card in 1..n:
    var (a,b)=(scan(),scan())
    discard add_edge(graph,card,cards+a,1)
    discard add_edge(graph,card,cards+b,1)
  return flow(graph, 0,N-1)

echo solve()