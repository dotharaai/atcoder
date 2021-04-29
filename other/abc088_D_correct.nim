import sequtils, strutils, queues, math

const
  dd = [(1, 0), (0, 1), (-1, 0), (0, -1)]
let
  hw = stdin.readline.split.map(parseInt)
  (h, w) = (hw[0], hw[1])
  ss = newSeqWith(h, stdin.readline)
var
  q = initQueue[(int, int)]()
  bss = newSeqWith(h, newSeq[int](w))

q.add((0, 0))
bss[0][0] = 1
while len(q)>0:
  let (x, y) = q.dequeue
  for d in dd:
    let (dx, dy) = d
    if x+dx<0 or x+dx>=h or y+dy<0 or y+dy>=w:
      continue
    if bss[x+dx][y+dy]>0 or ss[x+dx][y+dy]=='#':
      continue
    bss[x+dx][y+dy] = bss[x][y]+1
    q.add((x+dx, y+dy))

if bss[h-1][w-1]<=0:
  echo -1
else:
  echo ss.mapIt(it.count('.')).sum - bss[h-1][w-1]
