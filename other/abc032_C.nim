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
    (n, k) = (scan(),scan())
    s = newseqwith(n,scan())
  if 0 in s:
    return n
  else:
    var
      right=0
      cum = 1
    for left in 0..<n:
      right.max=(left)
      while right<n and cum*s[right]<=k:
        cum*=s[right]
        right+=1
      result.max=(right-left)
      cum = max(cum.div(s[left]),1)

        


    

    
  
echo solve()