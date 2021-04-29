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


var prims = inittable[int,int]()

proc getPrimes(n:int)=
  #echo n
  var d = 2
  var nd = n
  while d^2<=n:
    while nd.mod(d)==0:
      if prims.hasKeyOrPut(d,1):
        prims[d]+=1
      nd = nd.div(d)
    d+=1
  if nd!=1:
    if prims.hasKeyOrPut(nd,1):
      prims[nd]+=1



proc solve():int=
  var
    (a,b)=(scan(),scan())
    d = 1000000007
  if a==b:
    return 1
  else:
    for n in b+1..a:
      getPrimes(n)
  result = 1
  for (k,v) in prims.pairs:
    result*=(v+1)
    result.mod=d
  




  

  
echo solve()