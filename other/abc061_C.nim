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
    (n,k)=(scan(),scan())
    ct = newseqwith(10^5+1,0)
  for i in 0..<n:
    var (a ,b ) = (scan(),scan())
    ct[a]+=b
  var c = 0
  for i in 1..10^5:
    c+=ct[i]
    if c>=k:
      return i
    

    

    
  
echo solve()