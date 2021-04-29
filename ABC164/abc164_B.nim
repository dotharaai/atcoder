import strutils, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:float = get().parseFloat



proc solve(a,b,c,d:float):string=
  if (c/b).ceil <= (a/d).ceil:
    return "Yes"
  else:
    return "No"



#echo solve(10,9,10,10)
#echo solve(46,4,40,5)

var
  a,b,c,d = read()

echo solve(a,b,c,d)
