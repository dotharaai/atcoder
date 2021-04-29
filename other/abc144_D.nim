import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt


proc solve(a,b,watervolume:float):float=
  # b*h*(1/2)*a == a*a*x
  if watervolume*2 < a*a*b:
    var h = watervolume*2 / (a * b)
    return radToDeg(arctan(b/h))
  else:
    var watervolume = a*a*b - watervolume
    var h = watervolume*2 / (a * a)
    return 90.0-radToDeg(arctan(a/h))


var a,b,x = read()
#var a = 1E12.int
#var b = 1E12.int
echo solve(a.float,b.float,x.float)