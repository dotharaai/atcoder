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
    w = s.count('W')
    b = s.count('B')
    bit = newseqwith(3,0)
  for idx, c in s:
    if c=='W':
      result+=bit[2]-bit[0]
      bit[0]+=1
      bit[2]+=1
    else:
      result+=0
      bit[1]+=1
      bit[2]+=1
    
    

    
  
echo solve()