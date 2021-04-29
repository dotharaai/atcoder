import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


var par:seq[int]  

proc root(par:var seq[int], x:int):int=
  if par[x] == x:
    return x
  else:
    par[x] = root(par, par[x])
    result = par[x]

proc unite(par:var seq[int], x,y :int)=
  var
    rx = root(par,x)
    ry = root(par,y)
  if rx == ry:
    return
  else:
    par[rx] = ry

proc same(par:var seq[int], x,y:int):bool=
  return root(par,x) == root(par,y)


proc solve():int=
  var
    (n,m) = (scan(),scan())
    usebridges = newseqwith(n,newseq[int](0))
    bridges = newseq[(int,int)](0)
  for i in 0..<m:
    bridges.add( (scan()-1,scan()-1))

  for i in 0..<m:
    par = newseq[int](n)
    for j in 0..<n:
      par[j] = j
    for j,b in bridges:
      if i!=j:
        par.unite(b[0],b[1])
    block check:
      for left in 0..<n:
        for right in 0..<n:
          if not par.same(left,right):
            result+=1
            break check
          


  
  
    

    
  
echo solve()