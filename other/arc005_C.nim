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



proc solve():string=
  var
    (h,w)=(scan(),scan())
    maze = @["!".repeat(w+2)] & newseqwith(h,"!" & read() & "!") & @["!".repeat(w+2)]
    cost = newseqwith(h+2,newseqwith(w+2,int.high))
    s:(int,int)
    t:(int,int)
  for y in 1..h:
    for x in 1..w:
      if maze[y][x]=='s':
        s = (y,x)
        maze[y][x]='.'
      if maze[y][x] == 'g':
        t = (y,x)
        maze[y][x]='.'
  var q = initDeque[((int,int),int)]() # y,x,cost
  
  q.addLast((s,0))
  while q.len > 0:
    var (p, c) = q.popFirst()
    if cost[p[0]][p[1]] <= c:
      continue
    cost[p[0]][p[1]]=c
    if maze[p[0]-1][p[1]] == '.':
      q.addFirst(((p[0]-1,p[1]),c))
    elif maze[p[0]-1][p[1]] == '#':
      q.addLast(((p[0]-1,p[1]),c+1))
      
    if maze[p[0]+1][p[1]] == '.':
      q.addFirst(((p[0]+1,p[1]),c))
    elif maze[p[0]+1][p[1]] == '#':
      q.addLast(((p[0]+1,p[1]),c+1))

    if maze[p[0]][p[1]+1] == '.':
      q.addFirst(((p[0],p[1]+1),c))
    elif maze[p[0]][p[1]+1] == '#':
      q.addLast(((p[0],p[1]+1),c+1))
    
    if maze[p[0]][p[1]-1] == '.':
      q.addFirst(((p[0],p[1]-1),c))
    elif maze[p[0]][p[1]-1] == '#':
      q.addLast(((p[0],p[1]-1),c+1))
  #for v in cost:
    #echo v
  if cost[t[0]][t[1]]<=2:
    return "YES"
  else:
    return "NO"






  
  

  

echo solve()