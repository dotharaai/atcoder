import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,c) = (scan(),scan())
    a = newseqwith(n,scan())
  result = int.high-50
  for i in 1..10:
    for j in 1..10:
      if i == j:
        continue
      else:
        var cost = 0
        for g in countup(0,n-1,2):
          if a[g] != i:
            cost += c
        for g in countup(1,n-1,2):
          if a[g] != j:
            cost += c
        result.min=cost


    
  return 
  
    

    
  
echo solve()