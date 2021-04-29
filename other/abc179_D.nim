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
    md = 998244353
    (n,k)=(scan(),scan())
    dp = newseqwith(n+4E5.int,0)
    lr = newseqwith(k,(scan(),scan()+1))
  dp[0]=1
  #echo dp
  for i in 1..<n:
    dp[i] += dp[i-1]
    dp[i].mod=md
    for j in 0..<k:
      dp[i + lr[j][0]] += dp[i]
      dp[i + lr[j][0]].mod=md
      dp[i + lr[j][1]] -= dp[i]
      dp[i + lr[j][1]].mod=md
      dp[i + lr[j][1]]+=md
    #echo i ,", ", dp
      
  return dp[n] mod md




  
echo solve()