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



proc solve()=
  var
    n = scan()
    d = newseqwith(n,newseqwith(n,scan()))
    q = scan()
    p = newseqwith(q,scan())
    dp = newseqwith(n+1,newseqwith(n+1,0))
    memo = newseqwith(n^2+1,-1)
  for y in 1..n:
    for x in 1..n:
      dp[y][x] = dp[y-1][x]+dp[y][x-1]-dp[y-1][x-1]+d[y-1][x-1]
  for y1 in 0..<n:
    for y2 in y1+1..n:
      for x1 in 0..<n:
        for x2 in x1+1..n:
          memo[(x2-x1)*(y2-y1)].max=(dp[y2][x2]+dp[y1][x1]-dp[y1][x2]-dp[y2][x1])
  for v in 1..n^2:
    memo[v].max=memo[v-1]
  for v in p:
    echo memo[v]

solve()