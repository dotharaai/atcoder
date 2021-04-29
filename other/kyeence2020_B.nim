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
    st = newseqwith(n,(0,0))
  for i in 0..<n:
    var (x,le) = (scan(),scan())
    st[i] = (x+le,x-le)
  st.sort(SortOrder.Ascending)
  var maxp = -10000000000000
  for i in 0..<n:
    if st[i][1]>= maxp:
      maxp=st[i][0]
      result+=1
    


  
    

    
  
echo solve()