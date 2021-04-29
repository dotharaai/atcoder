import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


# 2E5*10通り程度で行けるってこと？


const D = 998244353


proc solve():int=
  var 
    (n,k)=(scan(),scan())
    ls = newseq[int](k)
    rs = newseq[int](k)
    mn = n+2E5.int
    dp = newseqwith(mn,0)
  for i in 0..<k:
    (ls[i],rs[i])=(scan(),scan())
  dp[0]=1
  # DP+累積和的な

  for p in 1..<n:
    dp[p]+=dp[p-1]
    dp[p] = dp[p].mod(D)
    for kukan in 0..<k:
      dp[p+ls[kukan]]+=dp[p]
      dp[p+ls[kukan]] = dp[p+ls[kukan]].mod(D)
      dp[p+rs[kukan]+1]-=dp[p]
      dp[p+rs[kukan]+1]=(dp[p+rs[kukan]+1]+D).mod(D)
  return dp[n]


  

echo solve()