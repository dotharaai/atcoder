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
    cp = a.filterIt(it>=0).len
    cn = a.filterIt(it<0).len
    r = 0
  a.sort()
  if a.len==2:
    echo max(a[0]-a[1],a[1]-a[0])
    echo max(a[0],a[1]), " ", min(a[0],a[1])
    return
  if cp == 0:
    cp=1
    cn-=1
  elif cn == 0:
    cn=1
    cp-=1
  echo a[cn..<n].sum()-a[0..<cn].sum()
  for i in cn..<n-1:
    echo a[0]," ", a[i]
    a[0]-=a[i]
  for i in 0..<cn:
    echo a[n-1]," ", a[i]
    a[n-1]-=a[i]

  
  
  
    

    
  
solve()