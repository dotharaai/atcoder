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



proc solve():float=
  var
    (a,b,c)=(scanf(),scanf(),scanf())
  proc f(t:float):float=
    return a*t+b*sin(c*t*PI)

  
  var
    lw:float = 0
    hi:float = 200
  for i in 0..<100:
    var mid = (lw+hi)/2
    if(f(mid)<100):lw = mid
    else: hi = mid
  return lw
  

  
    
  

  
echo solve()