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
    (n,x,y) = (scan(),scan()-1,scan()-1)
    t= newseqwith(n,0)
  for s in 0..<n-1:
    for g in s+1..<n:
      var dest = min(@[
        g-s,
        abs(x-s)+abs(g-y)+1,
        abs(y-s)+abs(g-x)+1
      ]
      )
      #echo fmt"{s+1} => {g+1} : {dest}"
      t[dest]+=1
  for i in 1..<n:
    echo t[i]
  
  
  
    

    
  
discard solve()