import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


type Direction = enum
  UP
  DOWN

var
  n:int
  r:seq[int]
  memo=initTable[(int,Direction),int]()

proc searchRec(idx:int, d:Direction):int=
  if idx == n:
    return 0
  elif memo.hasKey((idx,d)):
    return memo[(idx,d)]
  for nidx in idx..<n:
    if r[idx] < r[nidx] and d == UP:
      result.max=searchRec(nidx, DOWN)+1
    elif r[idx] > r[nidx] and d == DOWN:
      result.max=searchRec(nidx, UP)+1
  memo[(idx,d)] = result


proc solve():int=
  n = scan()
  r = newseqwith(n,scan())
  for idx in 0..<n-2:
    result.max=max(searchRec(idx,UP),searchRec(idx,DOWN))+1
  if result<=2:
    return 0
  
    


  
echo solve()