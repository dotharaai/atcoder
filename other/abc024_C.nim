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
    (n,d,k) = (scan(),scan(),scan())
    el = newseq[int](d)
    ar = newseq[int](d)
    s = newseq[int](k)
    t = newseq[int](k)
  for i in 0..<d:
    (el[i],ar[i]) = (scan(),scan())
  for i in 0..<k:
    (s[i],t[i]) = (scan(),scan())
  for i in 0..<k:
    var p = s[i]
    for j in 0..<d:
      if el[j] <= p and p <= ar[j]:
        if el[j] <= t[i] and t[i] <= ar[j]:
          echo j+1
          break
        else:
          if p < t[i]:
            p = ar[j]
          else:
            p = el[j]

  
    

    
  
solve()