import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')

const D = 998244353
proc modpow(a,x:int):int=
  result = 1
  for i in 0..<x:
    result = (result*a).mod(D)

proc solve():int=
  var
    n = scan()
    d = newseqwith(n,scan())
    t = initTable[int,int]()
    maxd=0
  for i, v in d[1..<n]:
    if v == 0:
      return 0
    maxd.max=v
    if t.hasKeyOrPut(v,1):
      t[v]+=1
  var distance = 1
  result=1
  t[0]=1
  # isvalid
  if d[0] != 0:
    return 0
  for i in 0..maxd:
    if not t.haskey(i):
      return 0
  while t.hasKey(distance):
    result = (result*modpow(t[distance-1],t[distance])).mod(D)
    distance+=1



  
    

    
  
echo solve()