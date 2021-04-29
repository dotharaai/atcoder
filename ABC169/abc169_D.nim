import strutils, algorithm, sequtils, random,math,strformat,tables

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

proc primeFact(n:int):Table[int,int]=
  result = initTable[int,int]()
  var t = n
  var d = 2
  var p = 2
  while p^2 <= n:
    if  t mod p == 0:
      result.add(p,0)
    while t mod p == 0:
      t = t div p
      result[p]+=1
    p+=1
  
  if t != 1:
    result[t]=1

proc getIsPrimes(n:int):seq[bool]=
    result = newSeqWith(n+1,true)
    result[1] = false
    result[0] = false
    for i in 2..n.float.sqrt.int:
        if not result[i]:continue
        for j in countup(i*2,n,i):
            result[j] = false    

  
proc solve(X:int):int=
  var pfs = X.primeFact
  #echo pfs
  for pf in pfs.keys():
    var m = pfs[pf]
    var c = 0
    var cum = 0
    while cum + c < m:
      c+=1
      cum+=c
    result+=c



  

  

var
  x = stdin.readLine().parseInt


echo solve(x)
