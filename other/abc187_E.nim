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
    n = scan()
    m = scan()
    g = newseqwith(n,newseqwith(n,false))
    isS = newseqwith(1.shl(n),true)
    dp = newseqwith(1.shl(n),int.high.div(2))
  for i in 0..<n:
    g[i][i] = true
  for i in 0..<m:
    var
      a = scan()-1
      b = scan()-1
    g[a][b] = true
    g[b][a] = true
  for s in 1..<1.shl(n):
    for v1 in 0..<n:
      for v2 in 0..<n:
        if ((s and 1.shl(v1)) > 0) and ((s and 1.shl(v2)) > 0):
          isS[s] = isS[s] and g[v1][v2]
  for i in 0..<n:
    dp[1.shl(i)]=1
  for s in 1..<1.shl(n):
    var b = s
    #echo s.toBin(n), " : ", isS[s]
    if isS[s]:
      dp[s] = 1
      continue
    while b>0:
      
      if b>0 and (b xor s) > 0:
        #echo b.toBin(n)," , ", (b xor s).toBin(n)
        dp[s].min= dp[b] + dp[b xor s]
      b = (b-1) and s
      
  return dp[^1]
  


  
echo solve() 