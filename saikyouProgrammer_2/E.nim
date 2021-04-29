import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var 
    k = scan()
    s = read()
    n = s.len
    charCount = newseqwith(n+1,newseqwith(26,0))
    center = newseq[int]()
  for i in 0..<n:
    charCount[i][s[i].ord-'a'.ord] = 1
  #for i in 0..<n:
    #echo charCount[i]
  

  proc dfs(k, length:int):(int,bool)=
    #echo "length:",length
    if length==0 and k>0:
      return (-1,false)
    if k==0:
      if length==1:
        return (-1,false)
      else:
        return (length,true)
    if length.mod(2)!=0:
      center.add(length.div(2))
    for i in 0..<length.div(2):
      for c in 0..<26:
        charCount[i][c]+=charCount[length-i-1][c]

    result = dfs(k-1,length.div(2))
    
    
    return
  
  var t = dfs(k,n)
  #echo t
  #echo "center:",center
  #for i in 0..<n:
    #echo charCount[i]
  if t[1]:
    var v = newseq[int](t[0])
    var cost = newseq[int](t[0])
    var midCost = 0
    var isP = true and t[0]>0
    for idx in center:
      for c in 0..<26:
        if charCount[idx][c] == charCount[idx].max():
          midCost+=charCount[idx].sum()-charCount[idx][c]
          break
    for i in 0..<t[0]:
      for c in 0..<26:
        if charCount[i][c] == charCount[i].max():
          v[i]=c
          cost[i] = charCount[i].sum()-charCount[i][c]
    for i in 0..<t[0].div(2):
      if v[i]!=v[t[0]-i-1]:
        isP=false
    if isP:
      var tcost = int.high.div(4)
      for i in 0..<t[0]:
        if t[0].mod(2)==1 and t[0].div(2)==i:
          continue
        for c in 0..<26:
          if v[i] != c:
            tcost.min=charCount[i][v[i]]-charCount[i][c]

      echo cost.sum()+midCost+tcost
    else:
      echo midCost+cost.sum()
  else:
    echo "impossible"


solve()