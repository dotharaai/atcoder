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
    (s,p)=(scan(),scan())
    n:int
    m:int
  n = 1
  while n^2<=p:
    if p.mod(n)==0:
      m = p.div(n)
      if m+n==s:
        return "Yes"
    n+=1
  return "No"
  

echo solve()