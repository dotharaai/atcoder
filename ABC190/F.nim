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
    size = 3*1E5.int + 1
    a = newseqwith(n,scan()+1)
    bitree = newseqwith(size+1,0)
  
  #echo a
  proc add(i:int,x:int)=
    var i = i
    while i <= size:
      #echo i
      bitree[i] += x
      i += (i and -i)
  
  proc sum(i:int):int=
    var i = i
    while i > 0:
      result+=bitree[i]
      i -= (i and -i)
  
  var t = 0
  for idx, v in a:

    #echo fmt"add {v}"
    add(v,1)
    #echo fmt"num {v} :{idx+1}-{sum(v)}={idx+1-sum(v)}"
    t += idx+1-sum(v)
  #echo bitree
  for k in 0..<n:
    echo t
    t-=(a[k]-1)
    t+=(n-a[k])
    
    
  
  
  
  

solve()