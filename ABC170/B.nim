import strutils, sequtils

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


proc solve(x,n:int):int=
  for kame in 0..x:
    var turu = x - kame
    if y == kame*4 + turu*2:
      return "Yes"
  
  return "No" 


      

  


var
  x, n = read()

echo solve(x,n)