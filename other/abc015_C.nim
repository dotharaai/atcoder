import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')





var
    (n,k) = (scan(),scan())
    t = newseqwith(n,newseqwith(k,scan()))

proc isBuggyRec(idx:int,nxor:int):bool=
  if idx==n:
    return nxor==0
  else:
    for i in 0..<k:
      if isBuggyRec(idx+1,nxor xor t[idx][i]):
        return true
    return false


proc solve():string=
  for i in 0..<k:
    if isBuggyRec(1,t[0][i]):
      return "Found"
  return "Nothing"

    

    
  
echo solve()