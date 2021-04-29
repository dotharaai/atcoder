import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets, critbits, future, strformat
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,a,b) = (scan(),scan(),scan())
    x = newseqwith(n,scan())
    cumx = newseqwith(n+1,0)
  for i in 0..<n:
    cumx[i+1] = cumx[i]+x[i]
  for i in 1..<n:
    if b > (x[i]-x[i-1])*a:
      result+=(x[i]-x[i-1])*a
    else:
      result+=b




  

echo solve()