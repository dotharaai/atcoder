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



proc solve():string=
  var
    s = read()
    a = s.count('a')
    b = s.count('b')
    c = s.count('c')
  
  #echo a
  #echo b
  #echo c
  if max(@[a,b,c])-min(@[a,b,c])<=1:
    return "YES"
  else:
    return "NO"

    
  
echo solve()