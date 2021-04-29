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
    a = newseqwith(n,scan())
    b = a.sorted(SortOrder.Ascending)
    t = initTable[int,int]()
    tv = 0
  for bv in b:
    if not t.hasKey(bv):
      t[bv] = tv
      tv+=1
  for av in a:
    echo t[av]
    



  return 
  
    

    
  
solve()