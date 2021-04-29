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
    n = scan()
    a = newseqwith(n,scan())
    vcount = newseqwith(1E5.int+1,0)
  for av in a:
    vcount[av]+=1
  var
    odds = 0
    evens = 0
  for vc in vcount:
    if vc > 0:
      if vc mod 2 == 0:
        evens+=1
      else:
        odds += 1
  result = odds + (evens div 2) * 2



    

    
  
echo solve()