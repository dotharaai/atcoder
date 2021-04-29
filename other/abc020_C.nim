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
    (h,w,t)=(scan(),scan(),scan())
    s = newseqwith(h,read())
    start:(int,int)
    goal:(int,int)
  
  for y in 0..<h:
    for x in 0..<w:
      if s[y][x]=='S':
        start = (x,y)
      if s[y][x] == 'G':
        goal = (x,y)
  


  proc binSearch(left,right:int):int=
    if right-left==1:
      return left
    else:
      var level = newseqwith(h,newseqwith(w,int.high))
      var q = initDeque[(int,int,int)]()
      var mid = (right+left).div(2)
      q.addFirst((start[0],start[1],0))
      while q.len>0:
        var (px,py,pc) = q.popFirst()
        if level[py][px]<=pc:
          continue
        else:
          level[py][px]=pc
          if py+1<h:
            if s[py+1][px]=='#':
              q.addLast((px,py+1,pc+mid))
            else:
              q.addLast((px,py+1,pc+1))
          if px+1<w:
            if s[py][px+1] == '#':
              q.addLast((px+1,py,pc+mid))
            else:
              q.addLast((px+1,py,pc+1))
          if px-1>=0:
            if s[py][px-1] == '#':
              q.addLast((px-1,py,pc+mid))
            else:
              q.addLast((px-1,py,pc+1))
          if py-1>=0:
            if s[py-1][px]=='#':
              q.addLast((px,py-1,pc+mid))
            else:
              q.addLast((px,py-1,pc+1))
          
      if level[goal[1]][goal[0]]<=t:
        return binSearch(mid,right)
      else:
        return binSearch(left,mid)
  return binSearch(1,1E10.int)


      
    

    
  
echo solve()