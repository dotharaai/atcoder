import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    s = read()
    t = scan()
    x = 0
    y = 0
    free = s.count('?')
  x = abs(- s.count('L') + s.count('R'))
  y = abs(- s.count('D') + s.count('U'))
  if t == 1:
    result = x+y+free
  elif t == 2:
    result = max(x+y-free,(x+y-free).abs.mod(2))

  
echo solve()