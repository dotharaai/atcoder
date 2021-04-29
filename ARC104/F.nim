import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var 
    #n = 2E5.int#scan()
    n = scan()
    a = newseqwith(n,scan())
    b = newseqwith(n,scan())
    #a = newseqwith(n,0)
    #b = newseqwith(n,0)
    ca = newseqwith(n+1,0)
    cb = newseqwith(n+1,0)
    rseq = newseqwith(n,0)
  for i in 0..<n:
    ca[a[i]]+=1
    cb[b[i]]+=1
  var
    aidx=0
    ridx=0
    lastspace = n
  

  # aにもbにもあるやつから処理
  for i in 1..n:
    aidx+=ca[i]
    if ca[i]>0 and cb[i]>0:
      var
        v = 0
        d = 0
      while v < cb[i]:
        if rseq[(aidx+d) mod n]==0:
          rseq[(aidx+d) mod n] = i
          v+=1
        d+=1
      ridx+=d
      lastspace-=cb[i]

  for i in 0..<n:
    if a[i]==rseq[i]:
      echo "No"
      return
  # それ以外を処理
  
  
  for  i in 1..n:
    var idx = 0
    if ca[i]==0 and cb[i]>0:
      var
        v = 0
      while v < cb[i]:
        if rseq[idx mod n]==0:
          rseq[idx mod n]=i
          v+=1
  echo "Yes"
  echo rseq.join(" ")




  
  
  

solve()