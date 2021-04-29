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
    n = read()
    l = n.len()
    dp = newseqwith(l,newseqwith(2,0))
  if n[0]=='1':
    dp[0][0] = 1
  elif n[0].toInt>1:
    dp[0][1]=1
  for i in 1..<l:
    for v in 0..9:
      if v < n[i].toInt:
        if v == 1:
          dp[i][1] += dp[i-1][1] + dp[i-1][0] + n[0..i-1].parseInt + 1
        else:
          dp[i][1] += dp[i-1][1] + dp[i-1][0]
        
      elif n[i].toInt==v:
        if n[i]=='1':
          dp[i][0] += dp[i-1][0] + 1
          dp[i][1] += dp[i-1][1] + n[0..i-1].parseInt + 1
        else:
          dp[i][0] += dp[i-1][0]
          dp[i][1] += dp[i-1][1]
      elif n[i].toInt < v:
        if v == 1:
          dp[i][1] += dp[i-1][1] + n[0..i-1].parseInt + 1
        else:
          dp[i][1] += dp[i-1][1]
  return dp[l-1].sum()






    
      

  
  
echo solve()