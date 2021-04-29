import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc f():seq[int]=
  result = newseqwith(1E4.int+1,0)
  for x in 1..100:
    for y in 1..100:
      for z in 1..100:
        var t = x^2+y^2+z^2+x*y+y*z+z*x
        if t<=1E4.int:
          result[t]+=1
          
    
const preCalc:seq[int] = f()



proc solve()=
  var
    n = scan()
  for i in 1..n:
    echo precalc[i]

solve()