import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    n = scan()
    field = newseqwith(n,read())
  for y in 0..<n:
    var right = -1
    for x in 0..<n:
      if field[y][x] == '.':
        field[y][x]='o'
        right=x
    if right != -1:
      result+=1
      if y+1<n:
        for xx in right..<n:
          field[y+1][xx]='o'



  
    

    
  
echo solve()