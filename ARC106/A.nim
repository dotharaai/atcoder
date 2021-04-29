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
    n = scan()
    a = 3
    ai = 1
  while a<=n:
    var
      b = 5
      bi=1
    while a+b<=n:
      if a+b == n:
        echo ai, " ", bi
        return
      bi+=1
      b*=5
    ai+=1
    a*=3


  echo -1
  return
  

solve()