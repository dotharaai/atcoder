import algorithm, sequtils, strutils, math,tables


proc solve():int=
  var
    n = stdin.readline.parseInt
    dp = newseqwith(100001,int.high div 2)
  dp[0] = 0
  dp[1] = 1
  for i in 2..n:
    var t = 1
    dp[i] = dp[i-1]+1
    while 6^t <= i:
      dp[i] = min(dp[i],dp[i-6^t]+1)
      t+=1
    t = 1
    while 9^t <= i:
      dp[i] = min(dp[i],dp[i-9^t]+1)
      t+=1
  return dp[n]
  
  

echo solve()