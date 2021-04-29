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
    md = 998244353
    (n,k)=(scan(),scan())
    a = newseqwith(n,newseqwith(n,scan()))
    rroot = newseqwith(n,0)
    lroot = newseqwith(n,0)
  for i in 0..<n:
    rroot[i] = i
    lroot[i] = i


  proc lfind(x:int):int=
    if lroot[x]==x:
      return x
    else:
      lroot[x] = lfind(lroot[x])
      return lroot[x]
  proc lunite(x,y:int)=
    var
      rx = lfind(x)
      ry = lfind(y)
    if rx < ry:
      lroot[ry] = rx
    else:
      lroot[rx] = ry
    
  proc rfind(x:int):int=
    
    if rroot[x]==x:
      return x
    else:
      rroot[x] = rfind(rroot[x])
      return rroot[x]

  proc runite(x,y:int)=
    var
      rx = rfind(x)
      ry = rfind(y)
    if rx < ry:
      rroot[ry] = rx
    else:
      rroot[rx] = ry
    
  #echo a.join("\n")

  for x in 0..<n-1:
    for y in x+1..<n:
      var
        r = true
        c = true
      for i in 0..<n:
        if a[x][i]+a[y][i]>k:
          c=false
        if a[i][x]+a[i][y]>k:
          r=false
      if r:
        runite(x,y)
      if c:
        lunite(x,y)
  for i in 0..<n:
    discard lfind(i)
    discard rfind(i)
  #echo rroot
  #echo lroot
  var
    c = lroot.toCountTable()
    r = rroot.toCountTable()
  result = 1
  for key,val in c.pairs:
    #echo key,", ",val
    for v in 1..val:
      result*=v
      result.mod=md
  
  for key,val in r.pairs:
    #echo key,", ",val
    for v in 1..val:
      result*=v
      result.mod=md



echo solve()