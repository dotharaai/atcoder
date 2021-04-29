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
    (h, w) = (scan(),scan())
    stage = @["#".repeat(w+2)]&newseqwith(h,"#"&read()&"#")& @["#".repeat(w+2)]
    cost = newseqwith(h+2,newseqwith(w+2,h*w*2))
    p = initDeque[(int,int)]()
  for y in 1..h:
    for x in 1..w:
      if stage[y][x] == '#':
        p.addLast((y,x))
        cost[y][x]=0
  while p.len>0:
    var (py,px)=p.popFirst()
    if stage[py-1][px]=='.' and cost[py-1][px]>cost[py][px]+1:
      cost[py-1][px]=cost[py][px]+1
      p.addLast((py-1,px))
    if stage[py+1][px]=='.' and cost[py+1][px]>cost[py][px]+1:
      cost[py+1][px]=cost[py][px]+1
      p.addLast((py+1,px))
    if stage[py][px-1]=='.' and cost[py][px-1]>cost[py][px]+1:
      cost[py][px-1]=cost[py][px]+1
      p.addLast((py,px-1))
    if stage[py][px+1]=='.' and cost[py][px+1]>cost[py][px]+1:
      cost[py][px+1]=cost[py][px]+1
      p.addLast((py,px+1))
  #for c in cost:
    #echo c
  return max(cost[1..h].mapIt(it[1..w].max()))




        

    
  
echo solve()