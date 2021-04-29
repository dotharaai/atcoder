import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,m) = (scan(),scan())
    name = read()
    nametable = initTable[char,int]()
    kit=read()
    kittable = initTable[char,int]()
  for c in name:
    if nametable.hasKeyOrPut(c,1):
      nametable[c]+=1
  for c in kit:
    if kittable.hasKeyOrPut(c,1):
      kittable[c]+=1
  for c,v in nametable.pairs():
    if kittable.haskey(c):
      if v mod kittable[c] > 0:
        result.max=(v div kittable[c] + 1)
      else:
        result.max=(v div kittable[c])
    else:
      result = -1
      return 
    
  
  
    

    
  
echo solve()