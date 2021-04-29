import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    n = scan()
    c = @["#".repeat(n+2)] &  newseqwith(n,"#" & read() & "#") & @["#".repeat(n+2)]
    q = initHeapQueue[(int,int,int)]()
    cnt = newseqwith(n+2,newseqwith(n+2,0))
  
  

  for t in countdown(4,0):
    for y in 1..n:
      for x in 1..n:
        if c[y][x]!='?':
          continue
        var shuui = @[c[y-1][x],c[y+1][x],c[y][x-1],c[y][x+1]]
        cnt[y][x] = shuui.count('B')+shuui.count('W')
        if shuui.count('B')+shuui.count('W') == t:
          q.push((-t,y,x))

          
    while q.len>0:
        var (pt,py,px)=q.pop()
        var ps = @[c[py-1][px],c[py+1][px],c[py][px-1],c[py][px+1]]
        if cnt[py][px] != pt:
          continue
        
        echo fmt"({py},{px})"
        if ps.count('B')>=ps.count('W'):
          c[py][px]='W'
        else:
          c[py][px]='B'
        if py-1!=0:
          cnt[py-1][px]+=1
          if c[py-1][px]=='?':
            q.push((-cnt[py-1][px],py-1,px))

        if py!=n+1:
          cnt[py+1][px]+=1
          q.push((-cnt[py+1][px],py+1,px))
        if px-1!=0:
          cnt[py][px-1]+=1
          q.push((-cnt[py][px-1],py,px-1))
        if px!=n+1:
          cnt[py][px+1]+=1
          q.push((-cnt[py][px+1],py,px+1))

          

  for y in 1..n:
    for x in 1..n:
      if c[y][x+1]!='#' and c[y][x]!=c[y][x+1]:
        #echo y,", ",x
        result+=1
      if c[y+1][x]!='#' and c[y][x]!=c[y+1][x]:
        #echo y,", ",x
        result+=1


  
echo solve()

