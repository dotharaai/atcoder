import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc divtwo(n:int):int=
  result = n
  while result mod 2 == 0:
    result = result div 2


proc solve():int=
  var
    n = scan()
    a = newseqwith(n,scan()).mapIt(it.divtwo).toHashSet
  #echo a
  return a.len
  
    

    
  
echo solve()