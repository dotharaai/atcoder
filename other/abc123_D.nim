import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

var
  x,y,z,k = read()
  a:seq[int] = stdin.readLine.split.map(parseInt).sorted(system.cmp[int], SortOrder.Descending)
  b:seq[int] = stdin.readLine.split.map(parseInt).sorted(system.cmp[int], SortOrder.Descending)
  c:seq[int] = stdin.readLine.split.map(parseInt).sorted(system.cmp[int], SortOrder.Descending)
  lim = min(3000,x*y*z)


proc merge(f,s:seq[int]):seq[int]=
  result = @[]
  var fi = 0
  var si = 0
  for fi in 0..<f.len:
    for si in 0..<s.len:
      #echo fi, ", ",f[fi], ", ", si,", ",s[si], ", ", res
      result.add(f[fi]+s[si])
      #if result.len > k:
        #return
  result.sort(system.cmp, SortOrder.Descending)
  return result[0..<min(k,result.len)]

proc show(t:seq[int])=
  for s in 0..<t.len-1:
    echo t[s]
  echo t[t.len-1]
  
  

#echo merge(a,b)
show(merge(merge(a,b),c))
#solve(a,b,c,k)