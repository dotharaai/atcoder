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
    c = newseqwith(n,scan()-1)
    r = newseqwith(n,0)
    p = newseqwith(n,1)
    d = newseqwith(n,initTable[int,int]())
  for i in 0..<n:
    r[i]=i
    d[i][c[i]]=1
  
  proc find(x:int):int=
    if r[x]==x:
      return x
    else:
      result = find(r[x])
      r[x]=result
  

  proc move(s,t:int)=
    for (key,value) in d[s].pairs:
      if d[t].hasKeyOrPut(key,value):
        d[t][key]+=value



  proc unite(x,y:int)=
    var
      rx = find(x)
      ry = find(y)
    if rx==ry:
      return
    if p[rx]>=p[ry]:
      move(ry,rx)
      r[ry]=rx
      p[rx]+=p[ry]
      p[ry]=0
    else:
      move(rx,ry)
      r[rx]=ry
      p[ry]+=p[rx]
      p[rx]=0
  for i in 0..<q:
    var (x1,x2,x3)=(scan(),scan()-1,scan()-1)
    if x1==1:
      unite(x2,x3)
    if x1==2:
      if d[find(x2)].haskey(x3):
        echo d[find(x2)][x3]
      else:
        echo 0


    


      

  

  
solve()