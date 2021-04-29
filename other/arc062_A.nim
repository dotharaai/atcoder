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

proc ceil(a,b:int):int=
  if a.mod(b)==0:
    return a.div(b)
  else:
    return a.div(b)+1


proc solve():int=
  var
    n = scan()
    (t,a)=(scan(),scan())
  for i in 1..<n:
    var (nt,na)=(scan(),scan())

    var n = max(ceil(t,nt),ceil(a,na))
    t = n*nt
    a = n*na
  return (t+a).int


    

    
  
echo solve()