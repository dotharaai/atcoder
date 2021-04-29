import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc getLand(x,y:int, sea:var seq[string],kind:var seq[seq[int]],numoflands:int)=
  kind[y][x] = numoflands
  var q = initDeque[(int,int)]()
  q.addLast((x,y))
  while q.len>0:
    var (x,y) = q.popFirst()
    if sea[y-1][x] == 'o' and kind[y-1][x] == 0:
      kind[y-1][x] = numoflands
      q.addLast((x,y-1))
    if sea[y+1][x] == 'o' and kind[y+1][x] == 0:
      kind[y+1][x] = numoflands
      q.addLast((x,y+1))
    if sea[y][x-1] == 'o' and kind[y][x-1] == 0:
      kind[y][x-1] = numoflands
      q.addLast((x-1,y))
    if sea[y][x+1] == 'o' and kind[y][x+1] == 0:
      kind[y][x+1] = numoflands
      q.addLast((x+1,y))




proc solve():string=
  var
    sea = @["x".repeat(12)]&newseqwith(10,"x"&read()&"x") & @["x".repeat(12)]
    kind = newseqwith(12,newseqwith(12,0))
    numoflands = 0
  for y in 1..10:
    for x in 1..10:
      if sea[y][x] == 'o' and kind[y][x] == 0:
        #echo y,", ", x
        numoflands+=1
        getLand(x,y,sea,kind,numoflands)
  
  for y in 1..10:
    for x in 1..10:
      if sea[y][x] == 'x':
        var t = @[kind[y-1][x],kind[y+1][x],kind[y][x-1],kind[y][x+1]].deduplicate
        var ln = t.len
        if 0 in t:
          ln-=1
        if numoflands==ln:
          return "YES"
  return "NO"



  
    

    
  
echo solve()