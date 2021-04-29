import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques,re
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solveRec(s:var string,count:int=0, idx:int=0):int=
  for c in idx..<s.len-2:
    if s[c..c+2]=="ABC":
      s[c..c+2]="BCA"
      return solveRec(s, count+1,max(idx-1,0))
  return count


proc c(s:string):int=
  if s.len==0:
    return 0
  else:
    var acount = 0
    for c in s:
      if c=='A':
        acount+=1
      elif c == 'x':
        result+=acount



proc solve():int=
  var
    s = read()
    ns = s.replace("BC","x")
    nns = ns.split({'B','C'})
    ops = 0
    idx = 0
  #echo s
  #echo ns
  #echo nns
  return nns.mapIt(it.c).foldr(a+b)

    

      
    

    
  
echo solve()