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
    c = newseqwith(n,scan())
    dp = newseqwith(n,0)
    # ある瞬間に踏んでいるマスの色が直前に出てきたときのインデックス
    # -1:出てきてない
    lc = newseqwith(c.max()+1,-1)
  dp[0]=1
  lc[c[0]]=0
  for i in 1..<n:
    if c[i]==c[i-1]:
      dp[i]=dp[i-1]
      continue
    if lc[c[i]]>=0:
      dp[i]=dp[i-1]+dp[lc[c[i]]]
    else:
      dp[i]=dp[i-1]
    dp[i].mod=(1E9.int+7)
    lc[c[i]]=i
  return dp[^1]


  
    

    
  
echo solve()