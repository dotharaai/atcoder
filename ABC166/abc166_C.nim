import strutils, algorithm, sequtils, math, sets



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

type Bridge = object
  num:int
  height:int



proc sortBridge(a,b:Bridge):int=
  return a.height-b.height



proc solve(n:int,m:int):int=
  var
    hs = stdin.readLine.split(" ").mapIt(it.parseInt)
    bridges = newseqwith(n,newseq[int](0))
    isHighest = newseqwith(n,true)


  
  # prepare towers
  var heightAndNum = newseq[Bridge](n)
  for idx, value in hs:
    heightAndNum[idx] = Bridge(num:idx,height:value)

  heightAndNum.sort(cmp=sortBridge,SortOrder.Descending)
  


  #prepare bridges
  for i in 1..m:
    var
      ab = stdin.readLine.split.mapIt(it.parseInt)
    bridges[ab[0]-1].add(ab[1]-1)
    bridges[ab[1]-1].add(ab[0]-1)
  #echo heightAndNum
  for tower in heightAndNum:
    #echo tower
    #echo bridges[tower.num]
    for b in bridges[tower.num]:
      isHighest[b] = false
      #echo b
      if hs[b] == tower.height:
        isHighest[tower.num] = false
    if isHighest[tower.num] == true:
      #echo "add"
      result+=1
  #echo isHighest
  return



  



var
  n,m = read()
echo solve(n,m)