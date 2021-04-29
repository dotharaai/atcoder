import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    x = scan()
    seven = 7
    history = initSet[int]()
  result = 1
  while seven.mod(x) != 0 and seven.mod(x) notin history:
    history.incl(seven.mod(x))
    seven = seven.mod(x)
    result+=1
    seven*=10
    seven+=7
  if seven.mod(x) == 0:
    return result
  else:
    return -1
  
  

  

echo solve()