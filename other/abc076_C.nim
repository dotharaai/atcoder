import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    s = read()
    t = read()
    sp = -1
  for idx in 0..s.len-t.len:
    if s[idx] == t[0] or s[idx]=='?':
      #echo "searching from : ", idx
      for i in 0..<t.len:
        #echo i, ", ", s[idx+i], ", ", t[i]
        if s[idx+i] == t[i] or s[idx+i] == '?':
          if i == t.len-1:
            sp.max=idx
          continue
        else:
          break
  if sp>=0:
    s[sp..<sp+t.len] = t
    s = s.replace("?","a")
    return s
  else:
    return "UNRESTORABLE"
    

    
  
echo solve()