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
    (h,w)=(scan(),scan())
    table = newseqwith(h,newseqwith(w,scan()))
    history = newseqwith(0,newseq[int]())
  for y in 0..<h:
    for x in 0..<w-1:
      if table[y][x].mod(2)==1:
        table[y][x]-=1
        table[y][x+1]+=1
        history.add(@[y+1,x+1,y+1,x+2])
  for y in 0..<h-1:
    if table[y][w-1].mod(2)==1:
      table[y][w-1]-=1
      table[y+1][w-1]+=1
      history.add(@[y+1,w,y+2,w])
  echo history.len
  for record in history:
    echo record.join(" ")
  
    

    
  
solve()