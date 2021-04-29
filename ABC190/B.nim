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



proc solve()=
  var 
    (n,s,d)=(scan(),scan(),scan())
    magic = newseqwith(n,(scan(),scan()))
  if magic.filterIt(it[0]<s and it[1]>d).len>0:
    echo "Yes"
  else:
    echo "No"

  

solve()