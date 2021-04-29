import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    x = scan()
  if 400<=x and 599 >= x:
    echo 8
  elif 600<=x and 799 >= x:
      echo 7
  elif 800<=x and 999 >= x:
    echo 6
  elif 1000<=x and 1199 >= x:
    echo 5
  elif 1200<=x and 1399 >= x:
    echo 4
  elif 1400  <= x and 1599 >= x:
    echo 3
  elif 1600 <= x and 1799 >= x:
    echo 2
  elif 1800<=x:
    echo 1

  
    

    
  
solve()