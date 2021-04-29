import sequtils, algorithm,strutils,sets, heapqueue



proc solve(k:int):int=
  var q = initHeapQueue[int]()
  for i in 1..9:
    q.push(i)
  for i in 0..<k-1:
    echo q
    var t = q.pop()
    if t mod 10 != 0:
      q.push(10*t+(t mod 10) - 1)
    q.push(10*t + t mod 10)
    if t mod 10 != 9:
      q.push(10*t + t mod 10 + 1)
  return q.pop

      






#var s = stdin.readLine.parseint
for i in countup(1,20,3):
  echo solve(i)