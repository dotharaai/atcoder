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
    b = newseqwith(n,scan()) & @[99]
    op = newseq[int](0)
    buy = true
    a = newseq[int](0)
  a.add(201)
  for bv in b:
    if a[a.len-1] != bv:
      a.add(bv)
  #echo a

  
  
  n = a.len
  for idx in 1..<n-1:
    if buy and  a[idx-1] > a[idx] and a[idx] < a[idx+1]:
      op.add(a[idx])
      buy=false
    elif (not buy) and a[idx-1] < a[idx] and a[idx] > a[idx+1]:
      op.add(a[idx])
      buy=true 
  result=1000
  var stock = 0
  #echo op
  for idx in countup(0,op.len-2,2):
    stock=result div op[idx]
    result=result mod op[idx]
    result+=stock*op[idx+1]
  

  
    


    


    
  
echo solve()