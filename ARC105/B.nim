import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc naiveSolve(a:seq[int]):int=
  var a = a
  while min(a) != max(a):
    var
      mina = min(a)
      maxa = max(a)
    for i in 0..<a.len:
      if a[i]==maxa:
        a[i]-=mina
  return min(a)

proc solve():int=
  var 
    n = scan()
    aseq = newseqwith(n,scan())
  return aseq.foldr(gcd(a,b))
  
  

echo solve()