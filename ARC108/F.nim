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

proc solve()=
  var
    (n,q)=(scan(),scan())
    class = newseqwith(n,scan())
  par = newseqwith(n,0)

  # 親の初期化

  for i in 0..<n:
    par[i]=i
  



  
  
  

solve()