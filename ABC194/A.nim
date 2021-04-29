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



proc solve()=
  var 
    (a,b)=(scan(),scan())
  if a+b>=15 and b>=8:
    echo 1
  elif a+b >= 10 and b>=3:
    echo 2
  elif a+b>=3:
    echo 3
  else:
    echo 4
  
  

  
solve()