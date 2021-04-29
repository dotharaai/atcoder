import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    n = scan()
    d = 1E9.int+7
    dp = newseqwith(4,newseqwith(n+1,0))
  dp[0][0]=1
  for length in 1..n:
    dp[0][length]=(dp[0][length-1]*8) mod d
    dp[1][length]=(dp[0][length-1] + dp[1][length-1]*9) mod d
    dp[2][length]=(dp[0][length-1] + dp[2][length-1]*9) mod d
    dp[3][length]=(dp[1][length-1] + dp[2][length-1] + dp[3][length-1]*10) mod d
  return dp[3][n]

  

    
  

  

echo solve()