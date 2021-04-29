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



proc solve():int=
  var
    (x,k,d) = (abs(scan()),scan(),scan())
  if k - (x div d)<0:
    return abs(abs(x)-abs(k*d))
  (x,k) = (x-d*(x div d), k - (x div d))
  
  
  if k mod 2==0:
    return abs(x)
  else:
    return abs(d-abs(x))



    
  
echo solve()