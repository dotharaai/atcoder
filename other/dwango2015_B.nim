import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, re
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    s = read().replace("25","x")
  #echo s.findall(re"x+")
  for p in s.findall(re"x+"):
    result+=(p.len*(p.len-1)).div(2)+p.len

  return
  
    

    
  
echo solve()