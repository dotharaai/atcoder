import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    s = read()
    c = 0
    el = s[0]
  for i in 1..<s.len:
    if s[i]==el:
      c+=1
    else:
      result += (c*(c+1)) div 2
      c=0
      el = s[i]
  result += (c*(c-1)) div 2
  
  
  
    
  
echo solve()