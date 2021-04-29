import strutils, sequtils

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


proc solve(a,b,v,w,t:int):string=
  if v == w:
    if a==b:
      return "YES"
    else:
      return "NO"
  if v > w:
    if abs(a-b)  <= t*abs(w-v):
      return "YES"
    else:
      return "NO"
  else:
    return "NO"
      

  


var
  av = stdin.readLine.split.map(parseInt)
  bw = stdin.readLine.split.map(parseInt)
  t = stdin.readline.parseInt

echo solve(av[0],bw[0],av[1],bw[1],t)