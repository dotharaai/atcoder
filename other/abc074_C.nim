import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    (a,b,c,d,e,f) = (scan(),scan(),scan(),scan(),scan(),scan())
    water = newseq[float](0)
    sugar = newseq[float](0)
    cr = e/100

  for av in countup(0,f,100*a):
    for bv in countup(0,f-av,100*b):
      water.add((av+bv).toFloat)
  for cv in countup(0,f,c):
    for dv in countup(0,f-cv,d):
      sugar.add((cv+dv).toFloat)
  var
    temp = 0.0
    temps:int = 0
    tempw:int = a*100
  
  for w in water:
    for s in sugar:
      if w+s<=f.toFloat and cr>=s/w and s/w > temp:
        temp = s/w
        temps = s.toInt
        tempw = w.toInt
  echo tempw+temps, " ", temps


  
  
    

    
  
solve()