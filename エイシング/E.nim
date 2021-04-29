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
    s = read()
  for goal in 'a'..'z':
    var c = s
    var ops = 0
    while c.toSet.len != 1:
      var t = c[0..<c.len-1]
      ops+=1
      for idx in 0..<s.len-1:
        if t[idx] == goal or c[idx-1]==goal:
          t[idx] = goal
        else:
          t[idx]=t[idx]

    
  
echo solve()