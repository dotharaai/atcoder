import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt

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


proc solve(n:int):int=
  var a = stdin.readLine.split.map(parseInt).sorted(system.cmp, SortOrder.Ascending)
  #echo a
  for l1 in 0..<n-2:
    for l2 in l1+1..<n-1:
      #echo a[l2], ":", a[l1]
      var
        c_min = a[l2]-a[l1]
        c_max = a[l1]+a[l2]
      # c_min < c < c_max
      var c_min_idx = max(a.myBinarySearch(c_min),l2)
      var c_max_idx = max(a.myBinarySearch(c_max),l2)
      #echo c_min_idx, ", ", c_max_idx
      result+=c_max_idx-c_min_idx






  


var n = read()
echo solve(n)