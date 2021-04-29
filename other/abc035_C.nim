import strutils,algorithm, sequtils

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt
const inf = high(int) div 4

proc solve()=
  var n, q = read()
  var flip = newseqwith(n+1,0)
  for i in 0..<q:
    var lr = stdin.readline.split.map(parseInt)
    flip[lr[0]-1]+=1
    flip[lr[1]] -= 1
  var cum = 0
  #echo flip
  
  for i in 0..<n:
    cum+=flip[i]
    if cum mod 2 == 0:
      stdout.write("0")
    else:
      stdout.write("1")
  echo ""

  
  
  

solve()