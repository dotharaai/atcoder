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
    s = read()
    r = true
  for i in 0..<s.len:
    if i.mod(2)==0 and s[i].isUpperAscii:
      r = false
    if i.mod(2)==1 and s[i].isLowerAscii:
      r = false
  if r:
    echo "Yes"
  else:
    echo "No"
  

solve()