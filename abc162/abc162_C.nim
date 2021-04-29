import strutils, algorithm, sequtils, math



proc gengcdtable(N:int):seq[seq[int]]=
  result = newseqwith(N+1,newseqwith(N+1,0))
  for i in 1..N:
    for j in 1..N:
      result[i][j] = gcd(i,j)
      result[j][i] = result[i][j]


const gcdTable = gengcdtable(200)

proc solve(K:int):int=
  for a in 1..K:
    for b in 1..K:
      for c in 1..K:
        result += gcdtable[a][gcdtable[b][c]]


echo solve(stdin.readline.parseInt)