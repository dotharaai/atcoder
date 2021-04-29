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



proc solve()=
  var
    (t1,t2)=(scan(),scan())
    (a1,a2)=(scan(),scan())
    (b1,b2)=(scan(),scan())
  if a1*t1+a2*t2==b1*t1+b2*t2:
    echo "infinity"
    return


  if b1 > a1:
    (a1,b1)=(b1,a1)
    (a2,b2)=(b2,a2)


  # 一度も交わらない
  if a1*t1+a2*t2 > b1*t1+b2*t2:
    echo 0
    return


  var
    d1 = (a1-b1)*t1
    d2 = (b1-a1)*t1+(b2-a2)*t2
    t = 1
  t+=d1.div(d2)*2
  if d1.mod(d2)==0:
    t-=1
  echo t

  
  

  
solve()