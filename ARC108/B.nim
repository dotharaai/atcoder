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



proc solve():int=
  var 
    n = scan()
    s = read()
    que = initDeque[char]()
  for i in 0..<n:
    que.addFirst(s[i])
    if que.len>=3 and que[0]=='x' and que[1]=='o' and que[2]=='f':
      discard que.popFirst()
      discard que.popFirst()
      discard que.popFirst()
  


  
  

  return que.len
  


  

echo solve()