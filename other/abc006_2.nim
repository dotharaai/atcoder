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
    n = scan()
    t = newseqwith(n+4,0)
  t[1]=0
  t[2]=0
  t[3]=1
  for i in 4..n:
    t[i] = t[i-1]+t[i-2]+t[i-3]
    t[i].mod=10007
  return t[n]
  
  
  
    

    
  
echo solve()