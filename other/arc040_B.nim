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
    (n,r) = (scan(),scan())
    s = read()
    position = newseq[int]()
  for i in countdown(n-1,0):
    if s[i] == '.':
      position.add(max(i-r+1,0))
      for j in 0..<r:
        s[i-j] = 'o'
        if i-j == 0:
          break
    #echo s
  #echo position
  if position.len==0:
    return 0
  
  return position.len+position.max()

  
  
    

    
  
echo solve()