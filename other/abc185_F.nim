import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    (n,q)=(scan(),scan())
    a = newseqwith(n,scan())
    b = 1
  while b<n:
    b*=2
  
  var
    seg = newseqwith(b*2-1,0)
  proc getVal(x,y:int,k:int=0,l:int=0,r:int = -1):int=
    #echo  x,",", y
    var r:int = r
    if r<0:
      r = b
    if r<=x or y <= l:
      return 0
    if x<=l and r<=y:
      return seg[k]
    var
      vl = getVal(x,y,2*k+1,l,(l+r).div(2))
      vr = getVal(x,y,2*k+2,(l+r).div(2),r)
    
    return vl xor vr

  proc update(x,val:int)=
    var idx = x+(b-1)
    seg[idx]= seg[idx] xor val
    while idx>0:
      if idx.mod(2)==0:
        seg[(idx-1).div(2)]=seg[idx] xor seg[idx-1]
      else:
        seg[(idx-1).div(2)]=seg[idx] xor seg[idx+1]
      idx = (idx-1).div(2)
  for i  in 0..<n:
    update(i,a[i])
  #echo seg
  for i in 0..<q:
    var (t,x,y)=(scan(),scan(),scan())
    if t==1:
      update(x-1,y)
      #echo seg
    if t==2:
      echo getVal(x-1,y)
    
  

  
solve()