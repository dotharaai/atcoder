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
    (r,c) = (scan(),scan())
    (sy,sx) =  (scan()-1,scan()-1)
    (gy,gx) =  (scan()-1,scan()-1)
    stage = newseqwith(r,read())
    step = newseqwith(r,newseqwith(c,int.high div 4))
    pos = initDeque[(int,int)]()
  return 
  
7
100 130 130 130 115 115 150

    
  
echo solve()