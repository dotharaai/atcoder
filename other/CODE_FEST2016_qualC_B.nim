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
    (k,t) = (scan(),scan())
    a = newseqwith(t,scan())
    v = a.sum()
    mv = a.max()

  
  return max(0,2*mv-v-1)
  
    

    
  
echo solve()