import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


const md = 998244353
  

proc solve():int=
  var
    s = scan()
  # 1. a,a,a,a,a,a
  # 2. a,a,a,a,a,b
  # 3. a,a,a,a,b,b
  # 4. a,a,a,b,b,b
  # 5. a,a,a,a,b,c
  # 5. a,a,a,b,b,c
  # 6. a,a,b,b,c,c


  


  
echo solve()

