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
    (a,b,c) = (scan(),scan(),scan())
  if c==0:
    if a<=b:
      echo "Aoki"
    else:
      echo "Takahashi"
  else:
    if a>=b:
      echo "Takahashi"
    else:
      echo "Aoki"
  

solve()