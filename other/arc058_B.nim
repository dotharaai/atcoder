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
    cf = newseqwith(26,0)
  for c in s:
    cf[c.int-'a'.int]+=1
  var odds = cf.filterIt(it mod 2 == 1).len
  if odds == 0:
    return s.len
  else:
    return 2*((s.len-odds) div (2*odds))+1


  

  

  
  
    

    
  
echo solve()