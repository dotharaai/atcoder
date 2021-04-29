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



proc solve()=
  var
    n = scan()
    term = -1
    dist = 0
  for i in 2..n:
    echo fmt"? {1} {i}"
    var t = scan()
    if t>dist:
      term=i
      dist = t
  var
    term2 = 0
    dist2 = 0
  for i in 1..n:
    if term!=i:
      echo fmt"? {term} {i}"
      var t = scan()
      if dist2<t:
        dist2=t
        term2 = i
  echo fmt"! {dist2}"

    

    
  
solve()