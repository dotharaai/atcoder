import algorithm, macros, math, sequtils, strutils, tables
# import bitops, lenientops, deques,
#   heapqueue, sets, sugar


let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt



proc notBanned(n:int):int=
  var dp = newseqwith(len($n)+1,newseqwith(2,0))
  dp[0][0] = 1
  var s = $n
  for idx, c in s:
    var t = ($c).parseInt
    if t==9:
      dp[idx+1][0] = 0
      dp[idx+1][1] += (dp[idx][0] * 8) + (dp[idx][1] * 8)
    elif 9 > t  and t > 4:
      dp[idx+1][0] = dp[idx][0]
      dp[idx+1][1] += (dp[idx][0] * (t-1)) + (dp[idx][1] * 8)
    elif t == 4:
      dp[idx+1][0] = 0
      dp[idx+1][1] += (dp[idx][0] * 4) + (dp[idx][1] * 8)
    else:
      dp[idx+1][0] = dp[idx][0]
      dp[idx+1][1] += (dp[idx][0] * (t)) + (dp[idx][1] * 8)
  #for d in dp:
    #echo d
  return dp[s.len][0]+dp[s.len][1]
    




proc solve(a,b:int):int=
  var na = a - notBanned(a-1)
  var nb = b - notBanned(b) + 1
  #echo nb, " - ", na
  return nb - na

var a,b = read()

echo solve(a,b)