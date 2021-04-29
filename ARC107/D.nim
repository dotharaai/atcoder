import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')






proc solve():int=
  var 
    d = 998244353
    (n,k) = (scan(),scan())
    dp:seq[seq[int]]
  # 多分いくつ以下は考えなくてもいいというのがある
  var one = 1
  while n>one*k:
    one*=2
  one*=2
  
  echo "one:", one
  dp = newseqwith(n+1,newseqwith(one*k+1,0))
  dp[0][0]=1
  var step=one
  while step >= 1:
    echo step,", ", max(0,one*k-n*step),", ",one*k-step
    for w in 1..n:
      for v in max(0,one*k-n*step)..one*k-step:
        
        dp[w][v+step]+=dp[w-1][v]
        dp[w][v+step] = dp[w][v+step].mod(d)
     
    #echo "step:", step
    for dpp in dp:
      echo dpp
    step=step.div(2)
    #echo ""
  return dp[n][one*k]


  

echo solve()