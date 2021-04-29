import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques,re
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




proc solve()=
  var
    L = scanf()
    x = scanf()
    y = scanf()
    s = scanf()
    d = scanf()
    clock = d-s
    anticlock = L-(d-s)
  


  if d>s:
    clock = d-s
    anticlock = L-(d-s)
  else:
    anticlock = s-d
    clock = L-(s-d)
  #echo clock
  #echo anticlock
  if y>x:
    echo min(clock/(y+x), anticlock/(y-x))
  else:
    echo clock/(y+x)

solve()