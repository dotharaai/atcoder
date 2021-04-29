import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt

proc solve(n:int):int=
  #var s = newseqwith(n,0)
  if n mod 2 == 0:
    return n div 2 * (n-1)
  else:
    return (n-1) div 2 * n
    
var n = read()

echo solve(n)