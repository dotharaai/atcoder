import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,m) = (scan(),scan())
    x = newseq[int](m)
    y = newseq[int](m)
    z = newseq[int](m)
    edges = newseqwith(n,newseq[int]())
    root = newseqwith(n,0)


  proc find(x:int):int=
    if root[x]==x:
      return x
    else:
      return find(root[x])

  proc unite(x,y:int)=
    var
      rx = find(x)
      ry = find(y)
    if rx==ry:
      return
    else:
      root[max(rx,ry)]=min(rx,ry)

  for i in 0..<n:
    root[i]=i
  for i in 0..<m:
    (x[i],y[i],z[i])=(scan()-1,scan()-1,scan())
    edges[x[i]].add(y[i])
    edges[y[i]].add(x[i])
    unite(x[i],y[i])
  return root.mapIt(it.find).toHashSet().len


    

echo solve()