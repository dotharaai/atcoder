import algorithm, sequtils, strutils, math,tables



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


const inf = high(int) div 4

const D = 1E9.int+7

proc solve():int=
  var
    n = stdin.readline.parseInt
    s1 = stdin.readline
    s2 = stdin.readline
    dp = newseqwith(n,newseqwith(2,0))
  if s1[0] == s2[0]:
    dp[0][0] = 3
    dp[0][1] = 3
  else:
    dp[0][0] = 3
    dp[0][1] = 6
  for i in 1..<n:
    if s1[i-1] == s1[i]:
      dp[i][0] = dp[i-1][0]
      dp[i][1] = dp[i-1][1]
    else:
      if s1[i-1] == s2[i-1]:
        dp[i][0] = (dp[i-1][0]*2) mod D
        dp[i][1] = dp[i][0]
      elif s1[i-1] != s2[i-1]:
        if s1[i] == s2[i]:
          dp[i][0] = dp[i-1][1]
          dp[i][1] = dp[i-1][1]
        elif s1[i] != s2[i]:
          dp[i][1] = (dp[i-1][1]*3) mod D
  return dp[n-1][1]


  

    


  

echo solve()