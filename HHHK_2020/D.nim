import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


# 2E5*10通り程度で行けるってこと？


const D = 1000000007


proc solver():int=
  var
    (n,a,b)=(scan(),scan(),scan())
    
  return 

proc solve()=
  var 
    t = scan()
  for i in 0..<t:
    echo solver()

  

solve()