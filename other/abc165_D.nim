import sequtils, algorithm,strutils,sets, math

proc solve(a,b,n:int):int=
  var x = min(b-1,n)
  return ((a*x) div b) - a*(x div b)







var t = stdin.readline.split.map(parseint)
echo solve(t[0],t[1],t[2])