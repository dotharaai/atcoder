import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc gen(s:string,i:string):bool=
  var idx = 0
  for c in s:
    if c == i[idx]:
      idx+=1
      if idx == 3:
        return true
  return false
    



proc solve():int=
  var
    n = scan()
    s = read()
  for i in 0..999:
    if gen(s,fmt"{i:03}"):
      result+=1


  return
  
    

    
  
echo solve()