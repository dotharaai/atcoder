import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

const inf = int.high
var
  n,k = read()
  #(n,k) = (50,4)
  cd = newseq[tuple[x,y:int]](n)
  x = newseq[int](n)
  y = newseq[int](n)

proc cmpTuple(a,b:tuple[x,y:int]):int=
  if a.x == b.x:
    cmp(a.y,b.y)
  else:
    cmp(a.x,b.x)


for i in 0..<n:
  var xy = stdin.readline.split.map(parseint)
  #var xy  = @[i*(-1)^(i mod 2), i-1]
  x[i] = xy[0]
  y[i] = xy[1]
  cd[i] = (xy[0],xy[1])

cd.sort(cmpTuple,SortOrder.Ascending)
x.sort(system.cmp, SortOrder.Ascending)
y.sort(system.cmp, SortOrder.Ascending)

proc solve():int=
  result = inf
  for left in 0..<n-1:
    for right in left+1..<n:
        for under in 0..<n-1:
          for top in under+1..<n:
            var
              lb = x[left]
              rb = x[right]
              ub = y[under]
              tb = y[top]
            #echo lb,", ", rb, ", ",ub, ", ",tb, ", ", cd.filterIt(lb <= it.x and it.x <= rb and ub <= it.y and it.y <= tb)
            if len(cd.filterIt(lb <= it.x and it.x <= rb and ub <= it.y and it.y <= tb)) >= k:
              result = min(result, (rb-lb)*(tb-ub))
            

#echo cd
echo solve()
#echo solve_right()
#echo solveRec(0,@[],0,0,0,0)