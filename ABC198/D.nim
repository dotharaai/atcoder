import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc check(s1,s2,s3:string,repc:var seq[char],repv:var seq[char]):bool=
  var
    s1 = s1
    s2 = s2
    s3 = s3
  for i in 0..<repc.len:
    s1 = s1.replace(repc[i],repv[i])
    s2 = s2.replace(repc[i],repv[i])
    s3 = s3.replace(repc[i],repv[i])
  if (s1[0]=='0') or (s2[0]=='0') or (s3[0]=='0'):
    return false
  else:
    return (s1.parseInt+s2.parseInt) == s3.parseInt






proc printAns(s1,s2,s3,:string,repc:var seq[char],repv:var seq[char])=
  var
    s1 = s1
    s2 = s2
    s3 = s3
  for i in 0..<repc.len:
    s1 = s1.replace(repc[i],repv[i])
    s2 = s2.replace(repc[i],repv[i])
    s3 = s3.replace(repc[i],repv[i])
  echo s1
  echo s2
  echo s3

proc solve()=
  var
    s1 = read()
    s2 = read()
    s3 = read()
    alp = "abcdefghijklmnopqrstuvwxyz".toseq()
    numel = "0123456789".toseq()
    num = "0123456789".toseq().mapIt(it.toInt)
    usealp = newseq[char]()
    dct = initTable[char,int]()
  for v in alp:
    if v in (s1 & s2 & s3) and (v notin usealp):
      usealp.add(v)
  if usealp.len>10:
    echo "UNSOLVABLE"
    return
  else:
    var
      d1 = initTable[char,int]()
      d2 = initTable[char,int]()
      d3 = initTable[char,int]()
    for a in alp:
      d1[a]=0
      d2[a]=0
      d3[a]=0
    usealp.sort()
    for i in 0..<s1.len:
      if d1.hasKeyOrPut(s1[i],10^(s1.len-i-1)):
        d1[s1[i]] = d1[s1[i]] + 10^(s1.len-i-1)
    for i in 0..<s2.len:
      if d2.hasKeyOrPut(s2[i],10^(s2.len-i-1)):
        d2[s2[i]] = d2[s2[i]] + 10^(s2.len-i-1)
    for i in 0..<s3.len:
      if d3.hasKeyOrPut(s3[i],10^(s3.len-i-1)):
        d3[s3[i]] = d3[s3[i]] + 10^(s3.len-i-1)
    #echo d1
    #echo d2
    #echo d3
    proc check2():bool=
      var
        v1 = 0
        v2 = 0
        v3 = 0
      for i in 0..<usealp.len:
        v1+=d1[usealp[i]]*(numel[i].toInt)
        v2+=d2[usealp[i]]*(numel[i].toint)
        v3+=d3[usealp[i]]*(numel[i].toint)
      if v1+v2==v3:
        #echo v1
        #echo v2
        #echo v3
        if ($v1).len<s1.len or ($v3).len<s3.len or ($v2).len<s2.len:
          return false
        if v1==0 or v2==0 or v3==0:
          return false
        return true
      return false
    if check2():
      printAns(s1,s2,s3,usealp,numel)
      return
    while numel.nextPermutation:
      #if check2(s1,s2,s3,usealp,numel):
      if check2():
        printAns(s1,s2,s3,usealp,numel)
        return
  echo "UNSOLVABLE"


    
    
  
  

solve()