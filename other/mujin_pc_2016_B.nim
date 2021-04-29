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



proc solve():float=
  var
    (oa,ab,bc)=(scanf(),scanf(),scanf())
    lmin:float = float.high
  for theta1 in 0..3600:
    for theta2 in 0..3600:
      var x:float = oa + ab*cos(theta1.float/10)+bc*cos(theta2.float/10)
      var y:float = ab*sin(theta1.float/10)+bc*sin(theta2.float/10)
      lmin.min=x^2+y^2
  return ((oa+ab+bc)^2-lmin)*PI



  
  
    

    
  
echo solve()