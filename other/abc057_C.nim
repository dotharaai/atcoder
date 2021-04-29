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
    n = scan()
    a = 1
  result = ($n).len
  while a^2<=n:
    if n.mod(a) == 0:
      result.min=(max(len($a),len($(n.div(a)))))
    a+=1

  
  return 
  
    

    
  
echo solve()