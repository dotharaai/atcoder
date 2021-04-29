import strutils, algorithm, sequtils, random


proc naivesolve(N:int,S:string):int=
  for i in 0..<N:
    for j in (i+1)..<N:
      if S[i]!=S[j]:
        for k in (j+1)..<N:
          if S[i]!=S[k] and S[j]!=S[k] and (k-j) != (j-i):
            result+=1

    
  return result


proc solve(N:int,S:string):int=
  var
    r:seq[int]
    b:seq[int]
    g:seq[int]
  for i,c in S:
    if c=='R':
      r.add(i)
    elif c=='B':
      b.add(i)
    else:
      g.add(i)

  var tresult = r.len*b.len*g.len
  var minus = 0
  for i,c in S:
    for between in 1..N:
      if i+2*between>=N:
        break
      if S[i]!=S[i+between] and S[i]!=S[i+2*between] and S[i+between]!=S[i + 2*between]:
        minus+=1
  return tresult-minus


proc gentestcase(N:int):string=
  var ran = initRand(124)
  var r = ran.rand(N-3)
  var b = ran.rand(N-r)
  var g = N-r-b
  var S = @('R'.repeat(r) & 'B'.repeat(b) & 'G'.repeat(g))#.shuffle.mapIt($it).join()
  S.shuffle
  result = S.mapIt($it).join()
  return 

  
var
  N = stdin.readline().parseInt
  S = stdin.readline()


#echo S
#echo naivesolve(N,S)

echo solve(N,S)