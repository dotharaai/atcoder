import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt
  
proc solve(n,k:var int):int=
  var s = stdin.readLine
  var sequ:seq[int]
  n = s.len

  
  #sequ.safeadd(0)
  var idx = 0
  while idx < n:
    var count = 0
    #echo idx
    while idx+count+1 < n and s[idx+count] == s[idx+count+1]:
      count+=1
    sequ.safeadd(count+1)
    idx+=count+1
  #sequ.add(0)
  #echo sequ

  var t = sequ.len-1
  # 転倒がt回の時t.float/2.ceil.int回の反転が必要
  var need = (t.float/2).ceil.int
  if k >= need:
    return n-1
  elif k < need:
    for r in sequ:
      result += (r-1)
    result+=2*k
    return
  


  



var n,k = read()
echo solve(n,k)