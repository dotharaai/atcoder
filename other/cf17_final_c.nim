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



proc solve():int=
  var
    n = scan()
    d = newseqwith(n,scan())

  proc recSolve(idx:int, filled:HashSet[int]):int=
    #echo idx, ", ", filled, ", ", d[idx]
    if idx==n:
      var
        t = filled.toSeq
        d:int
      d = (24+t[1]-t[0]).mod(24)
      result = min(d,24-d)
      for x in 0..<n:
        for y in x+1..n:
          d = (24+t[y]-t[x]).mod(24)
          #echo t[x],", ", t[y], ", ", d
          result.min= min(d,24-d)
      return 
    else:
      if d[idx]==0 or d[idx]==12:
        if d[idx] in filled:
          return 0
        else:
          result.max=recSolve(idx+1, filled + [d[idx]].toHashSet())
      else:
        if d[idx] in filled and 24-d[idx] in filled:
          return 0
        else:
          if d[idx] notin filled:
            result.max=recSolve(idx+1, filled + [d[idx]].toHashSet())
          if 24-d[idx] notin filled:
            result.max=recSolve(idx+1, filled + [24-d[idx]].toHashSet())

  return recSolve(0,[0].toHashSet())


    
  
echo solve()