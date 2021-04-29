import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt
  
proc solve(n:int)=
  # i = Nから順番に決まっていく(i=Nのときなど箱が1通りしかないのでもう動かせない)
  # i = N/kのときなどは上k個を見るとO(n)
  var a = @[0] & stdin.readLine.split.map(parseInt)
  var b = newseq[int](n+1)
  for i in countdown(n,1):
    var tsum = 0
    for d in countup(i+i,n,i):
      tsum += b[d]
    tsum = tsum mod 2
    b[i] = max(tsum-a[i], (a[i] - tsum))
  echo b.filterIt(it != 0).len
  for i in 1..<b.len:
    if b[i] != 0:
      stdout.write($(i) & " ") 
  echo ""







  



var n = read()

solve(n)