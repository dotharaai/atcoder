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
    L = read()
    m = 10^9+7
    dp = newseqwith(L.len,newseqwith(2,0))
  dp[0][0]=2
  dp[0][1]=1
  for i in 1..<L.len:
    if L[i]=='1':
      dp[i][0] = dp[i-1][0]*2
      dp[i][1] = dp[i-1][0] + dp[i-1][1]*3
    else:
      dp[i][0] = dp[i-1][0]
      dp[i][1] = dp[i-1][1]*3
    dp[i][0].mod=m
    dp[i][1].mod=m
  return dp[L.len-1].sum().mod(m)


  

  
echo solve()