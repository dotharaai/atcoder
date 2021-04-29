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
    n = scan()
    a = newseqwith(n,scan())
    s = newseqwith(n,0)
    
  
  
  for v in a:
    s[v] += 1
    
  result=1
  #echo s
  if n.mod(2) == 0:
    #奇数番目が全部2
    for i in countup(1,n-1,2):
      if s[i] != 2:
        return 0
      else:
        result = (result*2).mod(1E9.int+7)
  else:
    if s[0]!=1:
      return 0
    for i in countup(2,n-1,2):
      if s[i]!=2:
        return 0
      else:
        result = (result*2).mod(1E9.int+7)

  return

  
    

    
  
echo solve()