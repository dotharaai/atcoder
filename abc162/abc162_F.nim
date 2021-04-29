import strutils, algorithm, sequtils



var
  N = stdin.readline.parseInt
  a = stdin.readline().split(" ").mapIt(it.parseInt)
  memo:seq[seq[int]] = newSeqWith(N,newSeqWith(N,-1000000000))


  
proc solve(idx,last:int):int=
  if memo[idx][last] != -1000000000:
    return memo[idx][last]
  
  #echo idx, ",  ", last
  if idx >= N:
    return -100000000
  if (N-idx+2) < last*2:
    return -100000000
  elif last==1:
    return max(a[idx..^1])
  elif last==0:
    return 0
  else:
    result= max(a[idx]+solve(idx+2,last-1), solve(idx+1,last))
    memo[idx][last]=result
    return 





echo solve(0,N.div(2))