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
    N = scan()*2
    n = 1
  while n^2<=N:
    
    if N.mod(n)==0:
      if (N.div(n) + 1 - n).mod(2)==0:
        result+=1
      if n^2!=N:
        if (n+1-N.div(n)).mod(2)==0:
          result+=1
    n+=1

  


    
echo solve()