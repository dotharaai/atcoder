import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


proc cmp(a,b:tuple[need,fin:int]):int=
  system.cmp[int](a.fin, b.fin)
const D = 1E9.int+7

var color:seq[int]

proc solve(n:int)=
  var color = newseqwith(n,-1)
  var odds = newseq[int](0)
  var evens = newseq[int](0)
  var edges  = newseq[seq[int]](n)
  var costs  = newseq[seq[int]](n)
  for i in 0..<n-1:
    var uvw = stdin.readLine.split.map(parseInt)
    var u = uvw[0]-1
    var v = uvw[1]-1
    var w = uvw[2] mod 2
    edges[u].safeadd(v)
    edges[v].safeadd(u)
    costs[u].safeadd(w)
    costs[v].safeadd(w)
  var q = initQueue[int]()
  #echo edges
  #echo costs
  q.enqueue(0)
  color[0] = 1
  while q.len > 0:
    var now = q.dequeue()
    var nowc = color[now]
    var nexts = edges[now]
    var nexts_len = costs[now]
    for idx, next in nexts:
      if color[next] == -1: # -1 means is not walked
        q.enqueue(next)
        if nexts_len[idx] == 1:
          color[next] = (nowc+1) mod 2
        else:
          color[next] = nowc
  for i in 0..<n:
    echo color[i]
        




  
  

var
  s = stdin.readLine.parseInt

solve(s)