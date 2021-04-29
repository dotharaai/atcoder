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


proc cross(ax,ay,bx,by,cx,cy,dx,dy:float):bool=
  var
    s = (ax-bx)*(cy-ay)-(ay-by)*(cx-ax)
    t = (ax-bx)*(dy-ay)-(ay-by)*(dx-ax)
  if s*t>0:
    return false
  s = (cx-dx)*(ay-cy)-(cy-dy)*(ax-cx)
  t = (cx-dx)*(by-cy)-(cy-dy)*(bx-cx)
  if s*t>0:
    return false
  return true



proc solve():int=
  var
    (ax,ay,bx,by)=(scanf(),scanf(),scanf(),scanf())
    n = scan()
    x = newseqwith(n+1,0.0)
    y = newseqwith(n+1,0.0)
  for i in 0..<n:
    (x[i],y[i])=(scanf(),scanf())
  x[n]=x[0]
  y[n]=y[0]
  var t = 0
  for i in 0..<n:
    if cross(ax,ay,bx,by,x[i],y[i],x[i+1],y[i+1]):
      t+=1
  return t.div(2)+1
  

  
  
  
    

    
  
echo solve()