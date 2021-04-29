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
    r = scan()
    x = scan()
    y = scan()
    v = x^2+y^2
  if r^2>v:
    return 2
  for i in 1..<10^6:
    if (r*i)^2>=v:
      return i

  
  
  

echo  solve()