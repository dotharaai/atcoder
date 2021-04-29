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

proc modPow*(n, p, m: int): int =
  var (n, p) = (n, p)
  result = 1
  while p != 0:
    if (p and 1) == 1: result = result * n mod m
    n = n * n mod m
    p = p shr 1

proc solve():int=
  var
    N = scan()
    M = scan()
  return modPow(10,N,M*M) div M mod M
    

  
  
    

    
  
echo solve()