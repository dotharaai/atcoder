import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    s = read()
    n = s.len()
    t = initDeque[char]()
    v = true
  for c in s:
    if c == 'R':
      v = not v
    else:
      if v:
        t.addLast(c)
      else:
        t.addFirst(c)
  var sq:seq[char]
  if v:
    sq = t.toSeq()
  else:
    sq = t.toSeq()
    sq.reverse()
  var res = initDeque[char]()
  #echo sq
  for c in sq:
    if res.len>0 and res[0]==c:
      discard res.popFirst
    else:
      res.addFirst(c)
  #echo res
  if res.len>0:
    result = res.toSeq.reversed.join("")
  else:
    result = ""


  
  
  return
  



echo solve()