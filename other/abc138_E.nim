import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    s = read()
    t = read()
    nextc = newseqwith(26,newseqwith(s.len*2 , -1))
  s = s & s
  for c in ord('a')..ord('z'):
    if s[s.len-1]==chr(c):
      nextc[c-ord('a')][s.len-1]=0

    for idx in countdown(s.len-2,0):
      if s[idx]==c.chr:
        nextc[c-ord('a')][idx]=0
      else:
        if nextc[c-ord('a')][idx+1]>=0:
          nextc[c-ord('a')][idx]=nextc[c-ord('a')][idx+1]+1
  #for c in 'a'.ord..'z'.ord:
    #echo c.chr, ": ", nextc[c-ord('a')]

  var idx = 0
  var m = s.len.div(2)
  for search in t:
    if nextc[search.ord-ord('a')][idx.mod(m)] == -1:
      return -1
    else:
      idx+=nextc[search.ord-ord('a')][idx.mod(s.len.div(2))]+1
  return idx
  
  
    

    
  
echo solve()