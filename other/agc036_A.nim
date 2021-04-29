import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


const maxc = 1E9.int



proc solve()=
  var
    s = scan()
    (x1,y1) = (0,0)
    (x2,y2) = (0,0)
    (x3,y3) = (0,0)
    left = 0
    right = maxc
  while right-left>1:
    var mid = left+(right-left) div 2
    if mid^2>=s:
      right=mid
    else:
      left=mid
  #echo left,", ",right
  y2=right
  x3=right
  y3=1
  x2=right^2-s
  #echo abs(x2*y3-x3*y2)
  #echo @[x1,x2,x3,y1,y2,y3].allIt(it<=maxc)
  echo x1," ",y1 ," ",x2 ," ",y2 ," ",x3 ," ", y3
  
  
  
  return 
  
    

    
  
solve()