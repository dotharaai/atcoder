import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
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



var
  stg:array[3001,array[3001,int]]
  dp:array[3001,array[3001,array[4,int]]]

proc solve():int=
  var
    (h,w,k)=(scan(),scan(),scan())
  for y in 0..h:
    for x in 0..h:
      stg[y][x]=0
      for p in 0..3:
        dp[y][x][p]=0

  
  for i in 0..<k:
    var (y,x,v)=(scan(),scan(),scan())
    stg[y][x]=v

  dp[1][1][1]=stg[1][1] 

  
  for y in 1..h:
    for x in 1..w:
      dp[y][x][0].max=max(max(dp[y-1][x]), dp[y][x-1][0])
      dp[y][x][1].max=dp[y][x][0]+stg[y][x]
      for p in 1..3:
        dp[y][x][p].max=max(dp[y][x-1][p-1]+stg[y][x], dp[y][x-1][p])
      
  return max(dp[h][w])

  
echo solve()