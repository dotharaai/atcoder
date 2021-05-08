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



proc solve()=
  var
    h = scan()
    w = scan()
    a = @[@[0]] & newseqwith(h,@[int.high.div(4)] & newseqwith(w-1,scan()) & @[int.high.div(4)])
    b = newseqwith(h-1,newseqwith(w,scan()))
    dp = newseqwith(h+1,newseqwith(w+1,int.high.div(4)))
  dp[1][1] = 0
  for x in 2..w:
    dp[1][x].min=dp[1][x-1]+a[1][x-1]
  for y in 1..h:
    for x in 1..w:
      dp[]

  

    

solve()