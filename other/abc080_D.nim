import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

const inf = int.high
var
  n,ch = read()
  s = newseq[int](n)
  t = newseq[int](n)
  c = newseq[int](n)
  m = 1E5.int
  timeline = newseqwith(m+1, newseqwith(ch, false))

for i in 0..<n:
  var stc = stdin.readLine.split.map(parseInt)
  (s[i], t[i],c[i]) = (stc[0], stc[1],stc[2]-1)
  if s[i]>0:
    timeline[s[i]-1][c[i]] = true
  for j in s[i]..<t[i]:
    timeline[j][c[i]] = true


proc solve():int=
  for t in 0..m:
    result = max(result, timeline[t].filterIt(it==true).len)


echo solve()