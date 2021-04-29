import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


type SegTree = object
  tree :seq[int]
  n:int

proc initSegTree(baseArr:seq[int]):SegTree=
  var n = baseArr.len
  var m = 1
  while m < n:
    m*=2
  result = SegTree()
  result.n = m
  result.tree = newseqwith(2*m-1,-100)
  for i, v in baseArr:
    result.tree[m-1+i]=v
  for idx in countdown(m-2,0):
    result.tree[idx] = max(result.tree[idx*2+1],result.tree[idx*2+2])

proc get(segTree:SegTree,ql,qr:int,k:int=0,left:int=0,right:int= -1):int=
  var right=right
  if right<0:
    right = segTree.n
  if ql>=right or qr<=left:
    return -(int.high.div(4))
  if ql <= left and right <= qr:
    return segTree.tree[k]
  var
    vl = segTree.get(ql,qr,2*k+1,left,(left+right).div(2))
    vr = segTree.get(ql,qr,2*k+2,(left+right).div(2),right)
  return max(vl,vr)

proc set(segTree:var SegTree,idx,value:int)=
  var k = segTree.n + idx - 1
  segTree.tree[k] = value
  while k>=1:
    k = (k-1).div(2)
    if segTree.tree[k] == max(segTree.tree[2*k+1],segTree.tree[2*k+2]):
      break
    else:
      segTree.tree[k] = max(segTree.tree[2*k+1],segTree.tree[2*k+2])

proc show(s:SegTree)=
  var k = 1
  while k <= s.n:
    echo s.tree[k-1..<(k-1)+k]
    k*=2

proc solve():int=
  var
    (n, k)=(scan(),scan())
    a = newseqwith(n,scan())
    maxa=300000
    idp = newseqwith(maxa,0)

  var segTree = initSegTree(idp)
  for idx,v in a:
    var val:int
    val = segTree.get(max(0,v-k),min(maxa+1,v+k+1))
    segTree.set(v,val+1)
    #segTree.show()
  return segTree.tree[0]
  

    

    
  
echo solve()