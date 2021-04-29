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
    (h,w)=(scan(),scan())
  if (h,w)==(2,2):
    return 1
  result=h*w
  for x in 1..<w-1:
    var
      p1=h*x
      x2 = (w-x).div(2)+x
      p2 = (x2-x)*h
      p3 = h*w-(p1+p2)
      y= h div 2
    result.min=(max(@[p1,p2,p3])-min(@[p1,p2,p3]))
    p2 = (w-x)*y
    p3 = h*w-(p1+p2)
    result.min=(max(@[p1,p2,p3])-min(@[p1,p2,p3]))
      
  for y in 1..<h-1:
    var
      p1=w*y
      y2 = (h-y).div(2)+y
      p2 = (y2-y)*w
      p3 = h*w-(p1+p2)
      x = w div 2
    result.min=(max(@[p1,p2,p3])-min(@[p1,p2,p3]))
    p2 = (h-y)*x
    p3 = h*w-(p1+p2)
    result.min=(max(@[p1,p2,p3])-min(@[p1,p2,p3]))
      



  
    

    
  
echo solve()