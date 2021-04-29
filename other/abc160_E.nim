import strutils,algorithm, sequtils

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

var 
  x,y,a,b,c = read()
  p = stdin.readLine.split(" ").mapit(it.parseInt).sorted(system.cmp,SortOrder.Descending)[0..(x-1)]
  q = stdin.readLine.split(" ").mapit(it.parseInt).sorted(system.cmp,SortOrder.Descending)[0..(y-1)]
  r = stdin.readLine.split(" ").mapit(it.parseInt).sorted(system.cmp,SortOrder.Descending)

var
  pi = 0
  qi = 0
  ri = 0
  result = 0
for i in 0..(x+y-1):
  if pi == x and qi == y and ri==c:
    echo -1
    break
  elif pi==x and qi==y:
    result+=r[ri]
    ri+=1
  elif pi==x and ri==c:
    result+= q[qi]
    qi+=1
  elif qi==y and ri==c:
    result += p[pi]
    pi+=1
  elif pi==x:
    if max(q[qi],r[ri]) == q[qi]:
      result+=q[qi]
      qi+=1
    else:
      result+=r[ri]
      ri+=1
  elif qi==y:
    if max(p[pi],r[ri]) == p[pi]:
      result+=p[pi]
      pi+=1
    else:
      result+=r[ri]
      ri+=1
  elif ri==c:
    if max(q[qi],p[pi]) == q[qi]:
      result+=q[qi]
      qi+=1
    else:
      result+=p[pi]
      pi+=1
  else:
    if max(@[p[pi],q[qi],r[ri]]) == p[pi]:
      result+=p[pi]
      pi+=1 
    elif max(@[p[pi],q[qi],r[ri]]) == q[qi]:
      result+=q[qi]
      qi+=1
    else:
      result+=r[ri]
      ri+=1

echo result