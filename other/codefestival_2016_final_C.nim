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



proc solve():string=
  var
    (n,m) = (scan(),scan())
    nodes = newseqwith(n+m,newseq[int]())
    r = newseqwith(n+m,0)
  for i in 0..<n+m:
    r[i] = i
  for i in 0..<n:
    var k = scan()
    for j in 0..<k:
      var t = scan()-1+n
      nodes[i].add(t)
      nodes[t].add(i)

  #for no in nodes:
    #echo no
  
  proc find(x:int):int=
    if r[x]==x:
      result = x
    else:
      result = find(r[x])
      r[x] = result


  proc unite(x,y:int)=
    var
      rx = find(x)
      ry = find(y)
    if rx == ry:
      return 
    elif rx<ry:
      r[ry] = rx
    else:
      r[rx] = ry
  
  for lang in n..<n+m:
    for x in 1..<nodes[lang].len:
      unite(nodes[lang][0],nodes[lang][x])
  for i in 0..<n:
    discard find(i)
  #echo r
  if r[0..<n].allIt(it==r[0]):
    return "YES"
  else:
    return "NO"
  


    

    
echo solve()