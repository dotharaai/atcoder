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


proc isInt(ax,ay,bx,by,cx,cy:int):bool=
  var
    a1 = ax-cx
    a2 = ay-cy
    b1 = bx-cx
    b2 = by-cy
  return abs(a1*b2-a2*b1).mod(2)==0 and abs(a1*b2-a2*b1)>0



proc solve():int=
  var
    n = scan()
    x = newseqwith(n,0)
    y = newseqwith(n,0)
  for i in 0..<n:
    (x[i],y[i])=(scan(),scan())


  for i in 0..<n-2:
    for j in i+1..<n-1:
      for k in j+1..<n:
        if isInt(x[i],y[i],x[j],y[j],x[k],y[k]):
          result+=1

  
echo solve()