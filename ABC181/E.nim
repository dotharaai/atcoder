import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



# 境界を探す二分探索
# BinarySearch
# aは昇順にソートされているとする
# 初めて等しいか超える直前のidxを返す
proc myBinarySearch[T](a:openarray[T], key:T):int=
  if a.len==1:
    return 0
  var imin = -1
  var imax = a.len
  var imid:int
  while imax - imin > 1:
    imid = (imin+imax) div 2
    if a[imid] < key:
      imin = imid
    else:
      imax = imid
  return imin



proc solve():int=
  result = int.high.div(4)
  var 
    (n,m) = (scan(),scan())
    h = newseqwith(n,scan()).sorted(SortOrder.Ascending)
    w = newseqwith(m,scan()).sorted(SortOrder.Ascending)
    fl = newseqwith((n+1) div 2,0)
    fr = newseqwith((n+1) div 2,0)
  if n==1:
    for wv in w:
      result.min=(abs(h[0]-wv))
    return
  for i in countup(0,n,2):
    if i==0:
      fl[0]=0 
      fr[0]=0
    else:
      fl[i.div(2)]=fl[i.div(2)-1]+abs(h[i-1]-h[i-2])
      fr[i.div(2)]=fr[i.div(2)-1]+abs(h[n+1-i]-h[n-i])
  #echo fl
  #echo fr
  fr.reverse()
  #echo w
  for i in 0..<fl.len:
    var r =  fl[i]+fr[i]
    var k = h[i*2]
    #echo k
    var idx = w.myBinarySearch(k)

    var sm = int.high.div(2)
    for j in max(idx,0)..min(m-1,idx+1):
      sm.min=abs(w[j]-k)
    r+=sm
    result.min=r
      
    




  
    
  

echo solve()