import algorithm, sequtils, strutils, math,tables,heapqueue


proc solve():string=
  var
    s = stdin.readLine
    k = stdin.readLine.parseInt
    dq = newseq[string]()
  for i in 0..<s.len:
    for j in i..<min(i+k,s.len):
      if s[i..j] notin dq:
        dq.add(s[i..j])
  dq.sort
  return dq[k-1]
  



  


echo solve()