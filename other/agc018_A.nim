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
    (n,k) = (scan(),scan())
    a = newseqwith(n,scan())
    d = a.foldr(gcd(a,b))
  for i in 0..<n:
    if a[i]-k >= 0 and (a[i]-k) mod d == 0:
      return "POSSIBLE"
  return "IMPOSSIBLE"

  
  
    

    
  
echo solve()