import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc solve():int=
  var 
    a = scan()
    b = scan()
  for g in 1..b:
    if b.div(g) - (a-1).div(g) >= 2:
      result.max=g
  
  

echo  solve()