import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')

var
  kke = inittable[string,int]()


proc iskke(s:string):int=
  #echo "isKKE: ", s
  if kke.haskey(s):
    return kke[s]
  for i in 1..<s.len:
    var t = s[0..<s.len-i]
    if t.len mod 2 == 0:
      #echo t, ", ", t[0..<t.len div 2],", ", t[t.len div 2..<t.len]
      if t[0..<t.len div 2] == t[t.len div 2..<t.len]:
        result+=1
  kke[s]=result

proc isIkkei(s:string):int=
  #echo "isIkkei: ", s
  for i in 0..<s.len div 2:
    if s[0..i] == s[s.len-i-1..<s.len]:
      #echo s[0..i],", ", s[s.len-i-1..<s.len], " => ", s[i+1..<s.len-i-1]
      result+=isKke(s[i+1..<s.len-i-1])
    


proc solve():int=
  var
    s = read()
  for i in 1..<s.len:
    #echo "N: " , s[0..<i]
    result+=isIkkei(s[i..<s.len])
  return 
  
    

    
  
echo solve()