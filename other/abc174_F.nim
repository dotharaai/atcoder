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
    (n,q)=(scan(),scan())
    c = newseqwith(n,scan())
    queries = newseq[(int,int,int)]()
    exists = newseqwith(n+1,-1)
    ans = newseqwith(q,0)
    bittree = newseqwith(n+1,0)

  for i in 0..<q:
    var(l,r)=(scan(),scan())
    queries.add((r,l,i))
  queries.sort(SortOrder.Ascending)

  proc add(a,w:int)=
    var x = a
    while x<=n:
      bittree[x]+=w
      x += x and (-x)

  proc sum(a:int):int=
    var x = a
    while x>0:
      result+=bittree[x]
      x -= x and (-x)
    
  var check = 1
  exists[c[check-1]]=check
  add(check,1)
  for qi in 0..<q:
    
    var (r,l,idx)=queries[qi]
    #echo "process ", qi, ", ", "(",l,",",r,")"
    while check<r:
      check+=1
      if exists[c[check-1]] != -1:
        add(exists[c[check-1]],-1)
      exists[c[check-1]] = check
      add(check,1)
    #echo "check:", check
    ans[idx] = sum(r)-sum(l-1)
  echo ans.join("\n")







    
  
solve()