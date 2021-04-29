import strutils, algorithm, sequtils, math, sets



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

type Bridge = object
  num:int
  height:int



proc sortBridge(a,b:Bridge):int=
  return a.height-b.height



proc solve(n:int,m:int,x:int):int=
  var costs = newseq[int](n)
  var learn = newseq[seq[int]](0)
  for i in 0..<n:
    var t = stdin.readline.split.mapIt(it.parseint)
    costs[i] = t[0]
    learn.add(t[1..^1])
  result = costs.foldr(a+b)+10
  for i in 0..<2^n:
    var tcost = 0
    var learnv = newseqWith[int](m,0)
    for j in 0..<n:
      var isUse = false
      if j == 0:
        isUse =  (i and 1)>0
      else:
        isUse =  (i and 2^j) > 0
      if isUse:
        tcost += costs[j]
        for mi in 0..<m:
          learnv[mi] += learn[j][mi]
        #echo learnv, " " , tcost
        for k in 0..<m:
          if learnv.mapIt(it >= x).allIt(it == true):
            result = min(result, tcost)
  if result == costs.foldr(a+b)+10:
    result = -1

    

  return



  



var
  n,m,x = read()
echo solve(n,m,x)