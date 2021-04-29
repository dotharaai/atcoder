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
    n = scan()
    m=1000001
    s = newseqwith(n,scan())
    q = scan()
    k = newseqwith(q,scan())
    v = newseqwith(m+1,0)
  for i in s:
    if i != 0:
      v[i]+=1
  for i in countdown(m-1,0):
    v[i]+=v[i+1]
  proc binSearch(limit,left,right:int):int=
    if right-left==1:
      return right
    var mid = (left+right).div(2)
    if v[mid]>limit:
      binSearch(limit, mid,right)
    else:
      binSearch(limit, left, mid)
  for q in k:
    if v[0]<=q:
      echo 0
    else:
      echo binSearch(q,0,m)


  
  
    

    
  
solve()