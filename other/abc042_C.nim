import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')

proc isNeed(n:int, d:var seq[char]):bool=
  true in d.mapIt(it in ($n).toSeq)

proc solve():int=
  var
    (n,k) = (scan(),scan())
    d:seq[char] = stdin.readline.split.mapIt(it[0])
  while n.isNeed(d):
    n+=1

  return n 
  
    

    
  
echo solve()