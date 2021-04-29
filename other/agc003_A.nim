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



proc solve():string=
  var
    s = read()
  if(
    (s.contains('N') and s.contains('S')) or (not s.contains('N') and  not s.contains('S'))
    ) and (
      (s.contains('E') and s.contains('W')) or (not s.contains('E') and not s.contains('W'))
      ):
    return "Yes"
  else:
    return "No"
    

    
  
echo solve()