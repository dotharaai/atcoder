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
    (r,c,d) = (scan(),scan(),scan())
    a = newseqwith(r,newseqwith(c,scan()))
  for y in 0..<r:
    for x in 0..<c:
      if x+y <= d and ((x+y) mod 2) == (d mod 2):
        result.max=(a[y][x])


  return 
  
    

    
  
echo solve()