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
    (a,b,c,d)=(scan(),scan(),scan(),scan())
  if a+b == c+d or a+c == b+d or a+d == b+c:
    return "Yes"
  elif a==b+c+d or b==a+c+d or c == a+b+d or d == a+b+c:
    return "Yes"
  else:
    return "No"
  

echo solve()