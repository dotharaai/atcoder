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


const md = 10^9+7
proc modPow(x,n:int):int=
  var
    x = x
    n = n
  result = 1
  while n>0:
    if (n and 1)>0:
      result*=x
      result =  result mod md
    x*=x
    x = x mod md
    n = n shr 1

    

proc solve():int=
  var
    n = scan()
    p = scan()
  result = ((p-1)*modPow((p-2),n-1)).mod(md)
echo solve()