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



proc solve():string=
  var
    (h,w)=(scan(),scan())
    stage = @[".".repeat(w+2)] &  newseqwith(h,"." & read() & ".") & @[".".repeat(w+2)]
  for y in 1..w:
    for x in 1..h:
      if stage[x][y]=='#':
        if stage[x-1][y]=='.' and stage[x+1][y]=='.' and stage[x][y-1]=='.' and stage[x][y+1]=='.':
          return "No"
  return "Yes"


    

    
  
echo solve()