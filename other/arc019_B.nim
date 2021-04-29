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
    r = s.reversed().join()
    d = 0
  if s==r:
    return ((s.len) div 2) * 2 * 25
  else:
    for i in 0..<s.len:
      if s[i] != r[i]:
        d+=1
    if s.len==2:
      return 24*2
    elif s.len==3:
      return 73
    else:
      if d == 2:
        return s.len*25-2
      else:
        return s.len*25


    
  
echo solve()