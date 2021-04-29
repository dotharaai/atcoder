import algorithm, macros, math, sequtils, strutils, tables
# import bitops, lenientops, deques,
#   heapqueue, sets, sugar


let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt




proc solve(n,m,q:int)=
  var data = newseqwith(n+1,newseqwith(n+1,0))
  for i in 1..m:
    var t = stdin.readLine.split.map(parseInt)
    data[t[0]][t[1]] += 1
  #echo ""
  #for d in data:
    #echo d
  for i in 1..n:
    for j in 1..n:
      data[i][j] += data[i-1][j] + data[i][j-1] - data[i-1][j-1]
  #echo ""
  #for d in data:
    #echo d
  var t = newseq[string](0)
  for q in 0..<q:
    var pq = stdin.readLine.split.map(parseInt)
    t.add($(data[pq[1]][pq[1]] - data[pq[0]-1][pq[1]] - data[pq[1]][pq[0]-1] + data[pq[0]-1][pq[0]-1]))
  for s in t:
    echo s


var
  nmq = stdin.readLine.split.map(parseint)
  



solve(nmq[0],nmq[1],nmq[2])