import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
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




proc solve():string=
  var
    n =  scan()
    s = read()
    x = read()
    dp = newseqwith(n+1,initHashSet[int]())
  dp[n].incl(0)
  for i in countdown(n-1,0):
    if x[i] == 'T':
      for r in 0..<7:
        if 10*r mod 7 in dp[i+1] or (10*r + s[i].toInt) mod 7 in dp[i+1]:
          dp[i].incl(r)
    else:
      for r in 0..<7:
        if 10*r mod 7 in dp[i+1] and (10*r + s[i].toInt) mod 7 in dp[i+1]:
          dp[i].incl(r)
  if 0 in dp[0]:
    return "Takahashi"
  else:
    return "Aoki"


  
echo solve()