import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc f(a,n:int):int=
  if a == -1:
    return 0
  else:
    return a.div(n)+1

proc solve():int=
  var
    (a,b,x) = (scan(),scan(),scan())
  return f(b,x)-f(a-1,x)

    
  
echo solve()