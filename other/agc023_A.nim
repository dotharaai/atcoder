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
    a = newseqwith(n,scan())
    d = inittable[int,int]()
    c = 0
  d[0] = 1
  for v in a:
    c+=v
    if d.hasKeyOrPut(c,1):      
      result+=d[c]
      d[c]+=1
  return result

  
    

    
  
echo solve()