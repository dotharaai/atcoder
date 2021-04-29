import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


var s:string


const modi = 1E9.int+7


proc solve(n,m:int, war:seq[tuple[x,y:int]]):int=
  var idx = 0
  #echo war
  while idx < war.len:
    #echo idx
    var terminal = war[idx].y
    result+=1
    while idx < war.len and war[idx].x < terminal:
      idx+=1
  return


var
  n,m = read()
  war = newseq[tuple[x,y:int]](m)

for i in 0..<m:
  var ab = stdin.readLine.split.map(parseInt)
  war[i] = (x:ab[0],y:ab[1])

proc cmpTuple(a,b:tuple[x,y:int]):int=
  if a.y == b.y:
    cmp(a.x,b.x)
  else:
    cmp(a.y,b.y)


war.sort(cmpTuple,SortOrder.Ascending)


echo solve(n,m,war)