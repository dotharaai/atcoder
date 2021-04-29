import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')

proc solve():int=
  var 
    (n,m)=(scan(),scan())
    roots = newseqwith(n,0)
  for i in 0..<n:roots[i]=i


  proc find(x:int):int=
    if roots[x]==x:
      return x
    else:
      roots[x] = find(roots[x])
      return roots[x]

  proc unite(x,y:int)=
    var
      rx = find(x)
      ry = find(y)
    if rx<ry:
      roots[ry]=rx
    else:
      roots[rx]=ry
    


  for e in 0..<m:
    var (a,b)=(scan()-1,scan()-1)
    unite(a,b)
  var
    k = scan()
    c = newseqwith(k,scan()-1)
  for i in 0..<n:
    discard find(i)
  var r = find(c[0])
  if c.allIt(find(it)==r):
    return roots.count(r) + 1
  else:
    return -1
  

  

echo solve()