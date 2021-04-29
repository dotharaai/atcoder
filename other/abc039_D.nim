import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    (h,w) = (scan(),scan())
    aimage = @["#".repeat(w+2)] & newseqwith(h,"#"&read()&"#") & @["#".repeat(w+2)]
    bimage = newseqwith(h+2,".".repeat(w+2))
    rimage = newseqwith(h+2,"#".repeat(w+2))
  for y in 1..h:
    for x in 1..w:
      if @[aimage[y-1][x-1],aimage[y-1][x],aimage[y-1][x+1],aimage[y][x-1],aimage[y][x],aimage[y][x+1],aimage[y+1][x-1],aimage[y+1][x],aimage[y+1][x+1]].allIt(it=='#'):
        bimage[y][x] = '#'
  
  for y in 1..h:
    for x in 1..w:
      if @[bimage[y-1][x-1],bimage[y-1][x],bimage[y-1][x+1],bimage[y][x-1],bimage[y][x],bimage[y][x+1],bimage[y+1][x-1],bimage[y+1][x],bimage[y+1][x+1]].anyIt(it=='#'):
        rimage[y][x] = '#'
      else:
        rimage[y][x] = '.'
  
  if aimage == rimage:
    echo "possible"
    for line in bimage[1..h]:
      echo line[1..w]
  else:
    echo "impossible"
  
  
    

    
solve()