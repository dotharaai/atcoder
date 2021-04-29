import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    n = scan()
    a = newseqwith(n,scan()).sorted(SortOrder.Ascending)
    ai = a.max()
    t = int.high
    aj = 0
  for i, v in a:
    if t > abs(ai-2*v):
      t = abs(ai-2*v)
      aj = v
  return fmt"{ai} {aj}"
  

    

    
  
echo solve()