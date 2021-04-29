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



proc solve(n:int)=
  echo fmt"n={n}"
  var v = initHashSet[int]()
  
  for i in 0..<n:
    v.incl(i)
  var now = times.now()
  for i in 0..<n:
    v.excl(i)

  var nxt = times.now()
  echo nxt-now
  


for i in 0..8:
  solve(10^i)
