import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


var
  par:seq[int]


proc root(x:int):int=
  if par[x] == x:
    return x
  else:
    result = root(par[x])
    par[x] = result

proc unite(x,y:int)=
  var
    rx = root(x) 
    ry = root(y)
  #echo fmt"{x} => {rx}, {y} => {ry}"
  if rx != ry:
    par[ry] = rx



proc solve():int=
  var
    (n,m) = (scan(),scan())
    
  par = newseq[int](n)
  for i in 0..<n:
    
    par[i] = i
  for i in 0..<m:
    var (a,b) = (scan()-1,scan()-1)
    unite(a,b)
    #echo par
  return par.mapIt(root(it)).toSet().len-1

  

    

    
  
echo solve()