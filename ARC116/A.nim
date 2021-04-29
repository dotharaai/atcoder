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


proc answer(n:int):string=
  if n>=4 and n.mod(4)==0:
    return "Even"
  elif n>=2 and n.mod(2)==0:
    return "Same"
  return "Odd"

proc solve()=
  var 
    t = scan()
    c = newseqwith(t,scan()).mapIt(answer(it))

  echo c.join("\n")
  return 


  

solve()