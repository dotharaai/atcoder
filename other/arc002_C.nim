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
    (d,g) = (scan(),scan())
    p = newseq[int](d)
    c = newseq[int](d)
  for i in 0..<d:
    (p[i],c[i]) = (scan(),scan())
  result = int.high
  for i in 0..<2^d:
    var
      use = i.tobin(d)
      value = 0
      solved = 0
      usable:seq[int] = @[]
    #echo use
    for prb in 0..<d:
      if use[prb] == '1':
        solved+=p[prb]
        value += p[prb]*(prb+1)*100+c[prb]
      else:
        for i in 0..<p[prb]-1:
          usable.add((prb+1)*100)
    var idx = usable.len-1
    #echo value,", ",solved, ", ", usable
    while value < g and idx>=0:
      value+=usable[idx]
      solved+=1
      idx-=1
    if value>=g:
      result.min=(solved)

      
      
      
    


  


echo solve()