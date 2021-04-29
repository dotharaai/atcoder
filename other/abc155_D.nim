import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 

const inf = int.high - 5

proc read:int = get().parseInt





# 境界を探す二分探索
# BinarySearch
# aは昇順にソートされているとする
# 初めて等しいか超える直前のidxを返す
proc myBinarySearch[T](a:openarray[T], key:T):int=

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


proc solve(n,k:int):int=
  var a = stdin.readLine.split.map(parseInt).sorted(system.cmp, SortOrder.Ascending)
  for i in 0..n:


  return 






  



var
  n,k  = read()
echo solve(n,k)