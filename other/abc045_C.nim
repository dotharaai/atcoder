import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc calc(s:string,use:string):int=
  var leftegde = 0
  var use = use&"1"
  #echo s,", ", use
  for rightedge in 0..<use.len:
    if use[rightedge] == '1':
      #echo "  ",s[leftegde..rightedge].parseInt
      result+=s[leftegde..rightedge].parseInt
      leftegde=rightedge+1



proc solve():int=
  var
    s = read()
    n = s.len
    gap = n-1
  if n == 1:
    return s.parseInt
  

  for i in 0..<2^gap:
    var use = i.toBin(gap)
    result+=calc(s,use)
  
  
    

    
  
echo solve()