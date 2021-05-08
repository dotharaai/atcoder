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



proc solve()=
  var
    N = scan()
    level = newseqwith(N,-1)
    nodes = newseqwith(N,newseq[int]())
    edges = newseq[(int,int)]()
    cum = newseqwith(N,0)
    r=newseqwith(N,0)

  for i in 0..<N-1:
    var (a,b)=(scan()-1,scan()-1)
    edges.add((a,b))
    nodes[a].add(b)
    nodes[b].add(a)
  
  proc dfs(p:int)=
    for next in nodes[p]:
      if level[next] == -1:
        level[next]=level[p]+1
        dfs(next)
  level[0]=0
  dfs(0)
  var q = scan()
  for i in 0..<q:
    var (t,e,x)=(scan(),scan()-1,scan())
    var (a,b) = edges[e]
    if t==1:
      if level[a]>level[b]:
        cum[a]+=x
      elif level[a]<level[b]:
        cum[0]+=x
        cum[b]-=x
    if t==2:
      if level[a]<level[b]:
        cum[b]+=x
      elif level[a]>level[b]:
        cum[0]+=x
        cum[a]-=x
  proc dfs_solve(p:int,c:int)=
    r[p] = cum[p]+c
    for next in nodes[p]:
      if level[next]>level[p]:
        dfs_solve(next,r[p])

  dfs_solve(0,0)
  for i in 0..<N:
    echo r[i]




      





  
solve()