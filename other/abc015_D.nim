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



proc solve2():int=
  var
    mw = scan()
    (n,k) = (scan(),scan())
    mv = n*100
    wv = newseqwith(n,(scan(),scan()))
    inf = int.high.div(4)
    dp = newseqwith(n+1,newseqwith(k+1,newseqwith(mv+1, inf)))

  
  for idx in 0..n:
    dp[idx][0][0]=0
    
  for idx in 1..n:
    var item = idx-1
    for v in 1..mv:
      if v-wv[item][1]>=0:
        for take in 1..k:
          dp[idx][take][v]=min(dp[idx-1][take][v], dp[idx-1][take-1][v-wv[item][1]]+wv[item][0])
      else:
        for take in 0..k:
          dp[idx][take][v]=dp[idx-1][take][v]
  for take in 0..k:
    for v in 0..mv:
      if dp[n][take][v]<=mw:
        result.max=v



proc solve():int=
  var
    mw = scan()
    (n,k) = (scan(),scan())
    wv = newseqwith(n,(scan(),scan()))
    dp = newseqwith(n+1,newseqwith(k+1,newseqwith(mw+1,0)))
  for idx in 1..n:
    var item = idx-1
    for w in 1..mw:
      if w-wv[item][0]>=0:
        for take in 1..k:
          dp[idx][take][w]=max(dp[idx-1][take][w],dp[idx-1][take-1][w-wv[item][0]]+wv[item][1])
      else:
        for take in 1..k:
          dp[idx][take][w]=dp[idx-1][take][w]
  for take in 1..k:
    for w in 0..mw:
      result.max=dp[n][take][w]
        

    

  
    
  
echo solve2()