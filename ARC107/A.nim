import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    d = 998244353
    (a,b,c)=(scan(),scan(),scan())
  result = ((a+1)*a).div(2).mod(d)
  result = (result*(((b+1)*b).div(2).mod(d))).mod(d)
  result = (result*(((c+1)*c).div(2).mod(d))).mod(d)
  return 
  

echo solve()