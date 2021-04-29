import sequtils, strutils, algorithm



proc solve(n,k:int):int=

  return min(abs(n-k*n.div(k)),abs(k*n.div(k)-n))



var nk = stdin.readLine.split(" ").mapIt(it.parseInt)

echo solve(nk[0],nk[1])