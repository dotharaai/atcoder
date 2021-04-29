import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    n = scan()
    ab = newseqwith(n,(scan(),scan()))
  result = ab.mapIt(it[0]+it[1]).min()
  for x in 0..<n-1:
    for y in x+1..<n:
      result.min=min(max(ab[x][0],ab[y][1]),max(ab[x][1],ab[y][0]))

echo solve()