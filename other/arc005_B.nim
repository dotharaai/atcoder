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
  result = "_".repeat(4)
  var
    (x, y, W) =  (scan(),scan(),read())
    c = newseq[string](25)
  for i in 0..<9:
    var t = read()
    var n = t.reversed().join()[0..7] & t & t.reversed().join()[1..8]
    c[8-i] = n
    c[8+i] = n
    c[24-i] = n
  x = x+8-1
  y = y+8-1
  if W == "R":
    for i in 0..<4:
      result[i] = c[y][x+i]
  elif W == "L":
    for i in 0..<4:
      result[i] = c[y][x-i]
  elif W == "U":
    for i in 0..<4:
      result[i] = c[y-i][x]
  elif W == "D":
    for i in 0..<4:
      result[i] = c[y+i][x]
  elif W == "RU":
    for i in 0..<4:
      result[i] = c[y-i][x+i]
  elif W == "RD":
    for i in 0..<4:
      result[i] = c[y+i][x+i]
  elif W == "LU":
    for i in 0..<4:
      result[i] = c[y-i][x-i]
  elif W == "LD":
    for i in 0..<4:
      result[i] = c[y+i][x-i]
  return result
  
    

    
  
echo solve()