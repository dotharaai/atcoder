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
    xy = newseqwith(n,(0,0,0))
    r = newseqwith(n,0)
    cities = initDeque[(int,int)]()
  for i in 0..<n:
    xy[i]=(scan(),scan(),i)
    r[i]=i
  xy.sort(SortOrder.Ascending)

  
  proc find(x:int):int=
    if r[x]==x:
      return x
    else:
      result = find(r[x])
      r[x]=result
      return result
  proc unite(x,y:int)=
    var
      rx = find(x)
      ry = find(y)
    if xy[rx][1]<xy[ry][1]:
      r[ry]=rx
      #del(xy[ry][1])
    else:
      r[rx]=ry
      #del(xy[rx][1])



  #echo xy
  var ymin = (int.high.div(2),-1)
  for idx,(x,y,i) in xy:
    if ymin[0] > y:
      cities.addFirst(ymin)
      ymin = (y,i)
    else:
      unite(i,ymin[1])
      while cities.len>0 and cities[0][0]<y:
        unite(i,cities[0][1])
        discard cities.popFirst()
    
          
  var v = newseqwith(n,0)
  for x in r:
    discard find(x)
    v[x]+=1
  
  for k in 0..<n:
    echo v[find(k)]
  
  


  
solve()