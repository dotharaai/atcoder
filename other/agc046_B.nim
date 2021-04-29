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



var
  dp:array[3001,array[3001,int]]
  m = 998244353
 

proc solve():int=
  var
    (a,b,c,d)=(scan(),scan(),scan(),scan())
  dp[a][b]=1
  for y in a+1..c:
    dp[y][b] = (dp[y-1][b]*b) mod m
  for x in b+1..d:
    dp[a][x] = (dp[a][x-1]*a) mod m
  
  for y in a+1..c:
    for x in b+1..d:
      dp[y][x] = (
        -dp[y-1][x-1]*(y-1)*(x-1) + dp[y-1][x]*x + dp[y][x-1]*y
      ) mod m

  #for v in dp[a..c]:
    #echo v[b..d]
  return (3*m+dp[c][d]).mod(m)
  
  
  
      
      

  

  
echo solve()