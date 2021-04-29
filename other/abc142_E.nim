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
    (n,m)=(scan(),scan())
    a = newseqwith(m+1,0)
    b = newseqwith(m+1,0)
    c = newseqwith(m+1,0)
    dp = newseqwith(m+1,newseqwith(2^n,int.high.div(4)))
  dp[0][0]=0
  for i in 1..m:
    (a[i],b[i])=(scan(),scan())
    for j in 0..<b[i]:
      c[i]+=2^(scan()-1)
  
  
  for i in 1..m:
    for j in 0..<2^n:
      dp[i][j].min=dp[i-1][j]
      dp[i][j or c[i]].min=(dp[i-1][j]+a[i])
  if dp[m-1][2^n-1]==int.high.div(4):
    return -1
  else:
    return dp[m-1][2^n-1]


echo solve()