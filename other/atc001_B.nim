import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')




var r:seq[int]



proc find(x:int):int=
  if r[x] == x:
    return x
  else:
    var t = find(r[x])
    r[x] = t
    return t


proc unite(x,y:int)=
  var
    rx = find(x)
    ry = find(y)
  if rx == ry:
    return
  elif rx > ry:
    r[ry] = rx
  else:
    r[rx] = ry


proc solve()=
  var
    (n,q) = (scan(),scan())
  r = newseq[int](n)
  for i in 0..<n:
    r[i] = i

  for i in 0..<q:
    var (p,a,b) = (scan(),scan(),scan())
    if p == 0:
      unite(a,b)
    else:
      if find(a) == find(b):
        echo "Yes"
      else:
        echo "No"
  
  
    
  
  
solve()