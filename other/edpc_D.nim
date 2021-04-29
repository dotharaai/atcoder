import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n, maxw) = (scan(), scan())
    w = newseq[int](n)
    v = newseq[int](n)
    dp = newseqwith(n+1,newseqwith(maxw+1,0))
    dp2 = newseqwith(maxw+1,0)
  for i in 0..<n:
    (w[i], v[i])= (scan(),scan())
  #for idx in 1..n:
    #for weight in 0..maxw:
      #dp[idx][weight].max = dp[idx-1][weight]
      #if weight-w[idx-1]>=0:
        #dp[idx][weight].max = dp[idx-1][weight-w[idx-1]]+v[idx-1]
  for idx in 1..n:
    for weight in countdown(maxw,0):
      if weight-w[idx-1]>=0:
        dp2[weight].max = dp2[weight-w[idx-1]]+v[idx-1]
  return dp2.max()
  
    

    
  
echo solve()