import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


proc cmp(a,b:tuple[need,fin:int]):int=
  system.cmp[int](a.fin, b.fin)



proc solve(n:int, a:seq[tuple[need,fin:int]]):string=
  var a = a
  a.sort(cmp, SortOrder.Ascending)
  var date = 0
  for work in a:
    if date+work.need > work.fin:
      return "No"
    date += work.need

  return "Yes"
  

var
  n = read()
  work:seq[tuple[need:int, fin:int]]

for i in 0..<n:
  var t = stdin.readLine.split.map(parseInt)
  work.safeadd((need:t[0],fin:t[1]))

echo solve(n,work)