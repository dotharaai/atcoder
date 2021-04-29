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
    #a = newseqwith(n,scan()).sorted
    a = scan()
    b:int

  result+=a.div(2)
  a = a.mod(2)
  for idx in 1..<n:
    b = scan()
    if a == 1 and b>0:
      b-=1
      result+=1
    result+=b.div(2)
    a = b.mod(2)
    

  
  
    

    
  
echo solve()