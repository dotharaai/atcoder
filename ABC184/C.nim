import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')




proc solve():int=
  var 
    (x1,y1)=(scan(),scan())
    (x2,y2)=(scan(),scan())
  result = 1000
  for dx in -3..3:
    for dy in -3..3:
      var d = abs(dx)+abs(dy)
      if d > 3:
        continue
      else:
        var (dx2,dy2) = (x2+dx,y2+dy)
        if dx2==x1 and dy2==y1:
          if d==0:
            result.min=0
          else:
            result.min=1
        elif dx2-x1 == dy2-y1 or dx2-x1 == - (dy2-y1) or abs(dx2-x1)+abs(dy2-y1)<=3:
          if d==0:
            result.min=1
          else:
            result.min=2
        else:
          if (dx2+dy2).mod(2)==(x1+y1).mod(2):
            if d==0:
              result.min=2
            else:
              result.min=3
          else:
            if d==0:
              result.min=3
            else:
              result.min=4


  
  




  


  

    
  

  

echo  solve()