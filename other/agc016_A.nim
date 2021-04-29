import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc simulationRec(s:string, c:char,count:int=0):int=
  if s.allIt(it==c):
    return count
  var ns = "_".repeat(s.len-1)
  for j in 0..<s.len-1:
    if c in s[j..j+1]:
      ns[j] = c
    else:
      ns[j] = s[j]
  return simulationRec(ns,c,count+1)


proc solve():int=
  result = 101
  var
    s = read()
  for c in 'a'..'z':
    result.min = simulationRec(s,c)
    

    
  
echo solve()