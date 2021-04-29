import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var 
    (n,m)=(scan(),scan())
    s = newseqwith(n,read())
    even = 0
    odd = 0
  for i in 0..<n:
    if s[i].count('1').mod(2)==0:
      even+=1
    else:
      odd+=1
  echo even*odd
solve()