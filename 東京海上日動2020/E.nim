import algorithm, sequtils, strutils, math,tables,  macros



const digit = 19
proc usable(n,s:int):bool=
  var n = n.toBin(digit)
  var s = s.toBin(digit)
  for i in 0..<digit:
    if s[i] == '1' and n[i] != '1':
      return false
  return true


proc isNeed(n,t,i:int):bool=
  var
    n = n.tobin(digit)
    t = t.tobin(digit)
  if t[i] == '1':
    if n[i] == '1':
      return true
    else:
      return false
  else:
    return true



proc solveRec(digitNum:int):int=
  



proc solve(n,k,s,t:int):int=
  var a = stdin.readline.split.map(parseInt).filterIt(it.usable(s))
  var needNum = newseqwith(digit, newseq[int](0))
  for i in 0..<digit:
    for idx, ai in a:
      if ai.isNeed(t,i):
        needNum[i].add(idx)
  





var
  nkst = stdin.readline.split.map(parseInt)
  
echo solve(nkst[0],nkst[1],nkst[2],nkst[3])