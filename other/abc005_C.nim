import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


type Buy = object
  buy:bool
  time:int

proc `>`(a,b:Buy):bool=
  a.time > b.time

proc solve():string=
  var
    t = scan()
    timetable = newseqwith(101+t,0)
    n = scan()
    a = newseqwith(n,scan())
    m = scan()
    b = newseqwith(m,scan())
  for av in a:
    timetable[av]+=1
  for bv in b:
    block c:
      for ti in max(0,bv-t)..bv:
        if timetable[ti]>0:
          timetable[ti]-=1
          break c
      return "no"
  return "yes"
  
  

  
  
  

  
  
  
    

    
  
echo solve()