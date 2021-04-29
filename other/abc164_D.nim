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
    s = read().toSeq().map(toInt)
    #s = "7214".toSeq().map(toInt)
    d = 2019
    m = newseqwith(s.len+1,0)
  
  for i in 0..<s.len:
    m[i+1] = (m[i]*10+s[i]).mod(d)
  echo m
  
  
    

  
  
    

    
  
echo solve()