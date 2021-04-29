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



proc solve():string=
  var
    s = read()
  if s.len==2:
    if s[0]==s[1]:
      return "1 2"
    else:
      return "-1 -1"
  else:
    for i in 0..<s.len-2:
      if s[i]==s[i+1] or s[i]==s[i+2] or s[i+1]==s[i+2]:
        return fmt"{i+1} {i+3}"
    return "-1 -1"
    
  
echo solve()