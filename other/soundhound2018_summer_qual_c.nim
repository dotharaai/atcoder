import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():float=
  var
    (n,m,d)=(scan(),scan(),scan())
  if d==0:
    return (m-1)/n
  else:
    return (m-1)*2*(n-d)/n^2


  
    

    
  
echo solve()