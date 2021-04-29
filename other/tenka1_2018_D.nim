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
    n = scan()
    uk = -1
    kset:seq[seq[int]]
  for k in 1..2*n:
    if k*(k-1)==2*n:
      uk = k
  
  if uk == -1:
    echo "No"
    return
  echo "Yes"
  kset = newseqwith(uk,newseq[int]())
  var p = newseqwith(uk,0)
  p[^1]=1
  p[^2]=1
  var idx=1
  kset[^1].add(idx)
  kset[^2].add(idx)
  while p.nextPermutation:
    idx+=1
    for i in 0..<uk:
      if p[i]==1:
        kset[i].add(idx)
  echo kset.len
  for v in kset:
    echo v.len," ", v.join(" ")







    
  
solve()