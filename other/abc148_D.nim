import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt

const D = 1E9.int + 7

proc solve(n:int):int=
  var a = stdin.readLine.split.map(parseInt)
  if 1 notin a:
    return -1
  var idx = 0
  var search = 1
  while idx < n:
    if a[idx] == search:
      search+=1
    else:
      result+=1
    idx+=1
  

  
  


    
    




var n = read()

echo solve(n)