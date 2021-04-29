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
    k = scan()
    a = newseqwith(k,scan()).reversed
    pmin = newseqwith(k,int.high.div(48))
    pmax = newseqwith(k,0)
  if a[0]!=2:
    echo -1
    return
  else:
    pmin[0]=2
    pmax[0]=2
  for i in 1..<k:
    var cmin = (pmin[i-1]-1+a[i]) div a[i]
    var cmax = (pmax[i-1]+a[i-1]-1) div a[i]
    pmin[i] = a[i]*cmin
    pmax[i]=a[i]*cmax

  if pmin.anyIt(it==0) or pmax.anyIt(it==0):
    echo -1
    return
  if pmax[k-1]-1+a[k-1]<pmin[k-1]:
    echo -1
    return
  echo pmin[k-1], " ", pmax[k-1]-1+a[k-1]
  return

    

    
  
solve()