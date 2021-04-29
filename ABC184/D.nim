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






proc preSolve():seq[seq[seq[float]]]=
  var 
    #(a,b,c)=(scan(),scan(),scan())
    n = 100
    dp = newseqwith(n,newseqwith(n,newseqwith(n,-1.0)))
  dp[99][99][99]=1.0
  proc f(x,y,z:int):float=
    #echo ":",x,",",y,",",z
    if x==n or y==n or z==n:
      return 0
    else:
      if dp[x][y][z] != -1.0:
        return dp[x][y][z]
      else:
        dp[x][y][z] = 1.0+(f(x+1,y,z)*x.float + f(x,y+1,z)*y.float + f(x,y,z+1)*z.float)/(x+y+z).float
        return dp[x][y][z]
  dp[0][0][0] = f(0,0,0)
  return dp

const dp = preSolve()
  
  
proc solve():float=
  var (a,b,c)=(scan(),scan(),scan())
  return dp[a][b][c]

    
echo solve()