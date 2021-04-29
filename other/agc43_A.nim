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
    (h,w) = (scan(),scan())
    stage = newseqwith(h, read())
    fp = newseqwith(h, newseqwith(w,false))
    cost = newseqwith(h, newseqwith(w,int.high div 4))
  var pos = initDeque[(int,int)]()
  pos.addLast((0,0))
  if stage[0][0] == '#':
    cost[0][0]=1
  else:
    cost[0][0] = 0
  fp[0][0] = true
  for y in 0..<h:
    for x in 0..<w:
      if x == 0 and y == 0:
        continue
      elif x == 0:
        if stage[y-1][x] == '.' and stage[y][x] == '#':
          cost[y][x] = cost[y-1][x]+1
        else:
          cost[y][x] = cost[y-1][x]
      elif y == 0:
        if stage[y][x-1] == '.' and stage[y][x] == '#':
          cost[y][x] = cost[y][x-1]+1
        else:
          cost[y][x] = cost[y][x-1]
      else:
        var tate = 0
        var yoko = 0
        if stage[y-1][x] == '.' and stage[y][x] == '#':
          tate=1
        else:
          tate=0
        if stage[y][x-1] == '.' and stage[y][x] == '#':
          yoko=1
        else:
          yoko=0
        cost[y][x] = min(cost[y-1][x]+tate, cost[y][x-1]+yoko)
  
  return cost[h-1][w-1]
        

    

    


    






  

echo solve()