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



proc solve():int=
  var
    (h,w,m)=(scan(),scan(),scan())
    horp = newseqwith(w,(0,0))
    verp = newseqwith(h,(0,0))
    mines = initHashSet[(int,int)]()
  for i in 0..<m:
    var (y,x)=(scan()-1,scan()-1)
    mines.incl((y,x))
    var hp = horp[x]
    hp[1]=x
    hp[0]+=1
    horp[x]=hp
    var vp = verp[y]
    vp[1]=y
    vp[0]+=1
    verp[y]=vp
    
  horp.sort(SortOrder.Descending)
  verp.sort(SortOrder.Descending)
  #echo horp
  #echo verp
  var
    hmax = horp[0][0]
    vmax = verp[0][0]
  for cy in 0..<h:
    if verp[cy][0]<vmax-1:
      break
    for cx in 0..<w:
      if horp[cx][0]<hmax-1:
        break
      var
        y = verp[cy][1]
        x = horp[cx][1]
      if (y,x) in mines:
        result.max=(verp[cy][0]+horp[cx][0] - 1)
      else:
        result.max=(verp[cy][0]+horp[cx][0] )
        return
      
        


    

    
  
echo solve()