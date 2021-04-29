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
    (n,k) = (scan(),scan())
    a = newseqwith(n,scan())
    b = newseqwith(n-k+1,0)
  b[0] = a[0..<k].sum()
  for i in k..<n:
    b[i-k+1]=b[i-k]-a[i-k]+a[i]
  return b.sum()
  
    

    
  
echo solve()