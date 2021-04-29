import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    (n,m) = (scan(),scan())
  for z in 0..(m-2*n) div 2:
    var
      y = m-2*n-2*z
      x = n - (y+z)
    if x >= 0 and y >= 0:
      echo fmt"{x} {y} {z}"
      return
  echo "-1 -1 -1"
  
      

    
  
solve()