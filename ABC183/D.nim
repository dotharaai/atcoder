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






proc solve():string=
  var 
    (n,w)=(scan(),scan())
    maxs = 2E5.int
    timetable = newseqwith(maxs+1,0)
    clear = true
  for i in 0..<n:
    var (s,t,p)=(scan(),scan(),scan())
    timetable[s]+=p
    timetable[t]-=p
  if timetable[0]>w:
    clear=false
  for i in 1..maxs.int:
    timetable[i]+=timetable[i-1]
    if timetable[i]>w:
      clear=false
  if clear:
    return "Yes"
  else:
    return "No"
  


    
echo solve()