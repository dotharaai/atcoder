import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 

const inf = int.high - 5

proc read:int = get().parseInt

var
  h, w = read()
  table = newseqwith(h, stdin.readline)
  footPrint = newseqwith(h,newseqwith(w,inf))
  

proc solve():int=
  var
    start = (x:0,y:0)
    p = initqueue[tuple[x:int,y:int]]()
    c = initqueue[int]()
  p.add(start)
  c.add(1)
  while p.len > 0:
    var
      nowp = p.dequeue()
      nowc = c.dequeue()
    #echo nowp, ", ", nowc
    if footPrint[nowp.x][nowp.y] <= nowc:
      continue
    else:
      footPrint[nowp.x][nowp.y] = nowc
    if (nowp.x - 1 >= 0) and table[nowp.x-1][nowp.y] != '#' and nowc+1 < footPrint[nowp.x-1][nowp.y]:
      p.add((nowp.x - 1, nowp.y))
      c.add(nowc+1)
    if (nowp.x + 1 < h) and table[nowp.x+1][nowp.y] != '#' and nowc+1 < footPrint[nowp.x+1][nowp.y]:
      p.add((nowp.x+1, nowp.y))
      c.add(nowc+1)
    if (nowp.y - 1 >= 0) and table[nowp.x][nowp.y-1] != '#' and nowc+1 < footPrint[nowp.x][nowp.y-1]:
      p.add((nowp.x, nowp.y-1))
      c.add(nowc+1)
    if (nowp.y + 1 < w) and table[nowp.x][nowp.y+1] != '#' and nowc+1 < footPrint[nowp.x][nowp.y+1]:
      p.add((nowp.x, nowp.y+1))
      c.add(nowc+1)
  var sp = 0
  for line in table:
    for ch in line:
      if ch == '.':
        sp += 1

  if footPrint[h-1][w-1] == inf:
    #echo "cannot reach"
    return -1
  else:
    
    return sp - footPrint[h-1][w-1]

echo solve()