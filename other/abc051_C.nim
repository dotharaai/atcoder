import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    (sx,sy,tx,ty) = (scan(),scan(),scan(),scan())
  result = "R".repeat(tx-sx) & "U".repeat(ty-sy) & "L".repeat(tx-sx) & "D".repeat(ty-sy) & "D" & "R".repeat(tx-sx+1) & "U".repeat(ty-sy+1) & "LU" & "L".repeat(tx-sx+1) & "D".repeat(ty-sy+1) & "R"

  return
  
    

    
  
echo solve()