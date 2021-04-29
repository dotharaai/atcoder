import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    (n,x)=(scan(),scan())
    s = read()
  for i in 0..<n:
    if s[i]=='o':
      x+=1
    elif s[i]=='x':
      x = max(0,x-1)

  return x
  


  

echo solve()