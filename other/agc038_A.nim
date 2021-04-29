import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    (h,w,a,b) = (scan(),scan(),scan(),scan())
    s = newseq[string](h)
  for y in 0..<b:
    s[y] = "0".repeat(a) & "1".repeat(w-a)
  for y in b..<h:
    s[y] = "1".repeat(a) & "0".repeat(w-a)
  for c in s:
    echo c
    

    
  
solve()