import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

const inf = int.high div 4

var
  n,m,r = read()
  rs = stdin.readline.split.mapit(it.parseint-1)
  d = newseqwith(n,newseqwith(n,inf))

for i in 0..<n:
  d[i][i] = 0

for i in 0..<m:
  var abc = stdin.readline.split.map(parseint)
  d[abc[0]-1][abc[1]-1] = abc[2]
  d[abc[1]-1][abc[0]-1] = abc[2]

proc wf()=
  for k in 0..<n:
    for i in 0..<n:
      for j in 0..<n:
        if d[i][j] > d[i][k] + d[k][j]:
          d[i][j] = d[i][k]+d[k][j]
  


proc solveRec(footPrint:seq[int] = @[]):int=
  if footPrint.len == rs.len:
    return 0
  elif footPrint.len == 0:
    result = inf
    for city in rs:
      result = min(result, solveRec(@[city]))
    return result
  else:
    var lastcity = footPrint[footPrint.len-1]
    #echo " ".repeat(footPrint.len) & $lastcity
    result = inf
    for ncity in rs.filterIt(it notin footPrint):
      #echo lastcity, ", " , ncity
      result = min(result, d[lastcity][ncity]+solveRec(footPrint & @[ncity]))
  return
      
    


wf()
#for ds in d:
  #echo ds
#echo ""
echo solveRec()