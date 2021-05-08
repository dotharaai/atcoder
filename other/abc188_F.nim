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




proc solve():int=
  var
    x = scan()
    yy = scan()
    memo = initTable[int,int]()

  proc recSolve(y:int):int=
    #echo y
    if memo.hasKey(y):
      return memo[y]
    elif y==x:
      return 0
    else:
      if y==1:
        result = abs(x-y)
      elif y.mod(2)==1:
        result = min(@[abs(x-y),recSolve((y+1) div 2)+2,recSolve((y-1) div 2)+2])
      else:
        result = min(@[abs(x-y),recSolve(y div 2)+1])
      memo[y]=result
  return recSolve(yy)
  
    

    
  
echo solve()