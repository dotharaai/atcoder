import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')


proc calcDist(xp,x1,x2,yp,y1,y2:float):float=
  result = 1E6
  var
    a = x2-x1
    b=y2-y1
    a2 = a^2
    b2 = b^2
    r2 = a2+b2
    tt = -(a*(x1-xp)+b*(y1-yp))
  if tt<=0:
    result=((x1-xp)^2+(y1-yp)^2).sqrt
  elif tt >= r2:
    result = ((x2-xp)^2+(y2-yp)^2).sqrt
  else:
    var f1 = a*(y1-yp)-b*(x1-xp)
    result = ((f1^2)/r2).sqrt



#echo calcDist(0,100,-100,0,100,100)

proc solve():float=
  var
    (ax,ay) = (scan(),scan())
    n = scan().int
    x = newseq[float](n)
    y = newseq[float](n)
  result = 1E9
  
  (x[0],y[0]) = (scan(),scan())
  for i in 1..<n:
    (x[i],y[i]) = (scan(),scan())
    result.min=calcDist(ax,x[i],x[i-1],ay,y[i],y[i-1])
  result.min=calcDist(ax,x[0],x[n-1],ay,y[0],y[n-1])


  
  
  
    

    
  
echo solve()