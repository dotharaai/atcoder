import strutils, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt



proc solve(n,k:int):int=
  var sunukes = newseqwith(n,true)
  for i in 1..k:
    var d = stdin.readLine()
    var t = stdIn.readLine.split(" ").mapIt(it.parseInt)
    for c in t:
      sunukes[c-1]=false
  return sunukes.count(true)

#echo solve(10,9,10,10)
#echo solve(46,4,40,5)

var
  n, k = read()
  

echo solve(n,k)
