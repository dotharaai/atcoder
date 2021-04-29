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
    s = read()
    xs = s.replace("x","")
    vxs = xs.reversed().join()
  #echo s
  #echo xs
  #echo vxs
  if xs != vxs:
    return -1
  else:
    var 
      lidx=0
      ridx=s.len-1
    while lidx<=ridx:
      #echo s[lidx], ", ", s[ridx]
      if s[lidx] == 'x' and s[ridx] != 'x':
        result+=1
        lidx+=1
      elif s[lidx] != 'x' and s[ridx] == 'x':
        result+=1
        ridx-=1
      else:
        lidx+=1
        ridx-=1


    
  
    

    
  
echo solve()