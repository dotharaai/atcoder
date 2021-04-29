import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


const D = 1E9.int+7
proc solve()=
  var
    
    pattern = 1
    n = scan()
    t = newseqwith(n,scan()).sorted(SortOrder.Ascending)
    cost = newseqwith(n+1,0)
    cosuu = initTable[int,int]()
  
  for idx,tv in t:
    cost[idx+1]=cost[idx]+tv
    if cosuu.hasKeyOrPut(tv,1):
      cosuu[tv]+=1
  #echo t
  t = t.deduplicate()
  pattern = 1
  for tv in t:
    for i in countdown(cosuu[tv],1):
      pattern*=i
      pattern = pattern mod D
  echo cost.foldr(a+b)
  echo pattern


  
    

    
  
solve()