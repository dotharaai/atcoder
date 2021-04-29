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

proc froma(c:char): int =
    return int(c) - int('a')


proc solve():int=
  var
    a = read()
    n = a.len
    c = newseqwith(26,0)
  for idx,v in a:
    c[v.froma]+=1
  result=1
  for i in 0..<25:
    for j in i+1..<26:
      result+=c[i]*c[j]



  

    

    
  
echo solve()