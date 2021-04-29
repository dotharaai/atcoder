import strutils, sequtils

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


proc solve(x,n:int):int=
  if n == 0:
    return x
  var p = stdin.readline.split.map(parseint)
  var diff = 0
  while true:
    if x - diff notin p:
      return x - diff
    if x + diff notin p:
      return x + diff
    diff += 1


      

  


var
  x, n = read()

echo solve(x,n)