import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    (a,b,c) = (scan(),scan(),scan())
    k = scan()
    ops = 0
  
  while a >= b:
    b*=2
    ops+=1
  while b>=c:
    c*=2
    ops+=1
  if ops<=k:
    return "Yes"
  else:
    return "No"
  
    

    
  
echo solve()