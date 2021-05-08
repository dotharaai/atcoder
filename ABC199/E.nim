import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    n = scan()
    m = scan()
    restriction = newseqwith(n+1,newseq[(int,int)]())
    dp = newseqwith(1 shl 18,0)

  for i in 0..<m:
    restriction[scan()].add((scan(),scan()))
  dp[0] = 1

  proc check(msk:int):bool=
    var
      cnt = msk.toBin(18).count('1') 
      tot = newseqwith(18+1,0)
    for i in 0..<n:
      if (msk and (1 shl i)) > 0:
        tot[i+1]+=1
    for i in 1..n:
      tot[i] = tot[i]+tot[i-1]


    for (y,z) in restriction[cnt]:
      if z < tot[y]:
        return false


    return true



  for msk in 0..<1 shl n:
    #echo msk.toBin(18)
    for nxt in 0..<n:
      if (msk and 1 shl nxt) == 0:
        if check(msk + (1 shl nxt)):
          dp[msk+(1 shl nxt)] += dp[msk]
  #echo dp
  return dp[(1 shl n) - 1]


    

echo solve()