import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var 
    n = scan()
    p = newseqwith(n,scan())
    u = newseqwith(200001,false)
    t = 0
  for idx, pv in p:
    u[pv]=true
    while u[t]:
      t+=1
    echo t


  

    
  

  

echo solve()