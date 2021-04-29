import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


var roots:seq[int]

proc root(x:int):int=
  if roots[x]==x:
    return x
  else:
    return root(roots[x])


proc unite(x,y:int)=
  var
    rx = root(x)
    ry = root(y)
  if rx == ry:
    return
  else:
    if rx<ry:
      roots[ry]=rx
    else:
      roots[rx]=ry



proc solve():int=
  var
    (h, w) = (scan(),scan())
    s = newseqwith(h,read())
    f = newseqwith(h,newseqwith(w,false))
    dq = initDeque[(int,int)]()
    col = initDeque[char]()
  for y in 0..<h:
    for x in 0..<w:
      if not f[y][x]:
        dq.addLast((y,x))
        col.addLast(s[y][x])
        var
          bm = 0
          wm = 0
        while dq.len>0:
          var
            nm = dq.popFirst()
            nc  = col.popFirst()
          if f[nm[0]][nm[1]]:
            continue
          f[nm[0]][nm[1]]=true
          if nc=='.':
            wm+=1
          else:
            bm+=1
          if nm[0]>0 and s[nm[0]-1][nm[1]] != nc and not f[nm[0]-1][nm[1]]:
            dq.addLast((nm[0]-1,nm[1]))
            col.addLast(s[nm[0]-1][nm[1]])
          if nm[1]>0 and s[nm[0]][nm[1]-1] != nc and not f[nm[0]][nm[1]-1]:
            dq.addLast((nm[0],nm[1]-1))
            col.addLast(s[nm[0]][nm[1]-1])
          if nm[0]<h-1 and s[nm[0]+1][nm[1]] != nc and not f[nm[0]+1][nm[1]]:
            dq.addLast((nm[0]+1,nm[1]))
            col.addLast(s[nm[0]+1][nm[1]])
          if nm[1]<w-1 and s[nm[0]][nm[1]+1] != nc and not f[nm[0]][nm[1]+1]:
            dq.addLast((nm[0],nm[1]+1))
            col.addLast(s[nm[0]][nm[1]+1])
        result+=bm*wm

  
  
  

  

    
  
echo solve()