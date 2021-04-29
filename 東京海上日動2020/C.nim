import strutils, algorithm, sequtils, math, sets



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

type Bridge = object
  num:int
  height:int



proc sortBridge(a,b:Bridge):int=
  return a.height-b.height



proc solve(n,k:int):string=
  var a = stdin.readline.split.map(parseInt)
  #var a = newseqwith(n,0)
  var nexta = newseqwith(n,0)
  var aflag = newseqwith(n+1,0)
  for j in 0..<k:
    #echo a
    for i in 0..<n:
      aflag[max(0,i-a[i])]+=1
      aflag[min(n-1,i+a[i])+1]-=1
    
    nexta[0] = aflag[0]
    for i in 1..<n:
      nexta[i] = nexta[i-1] + aflag[i]
    if a == nexta:
      #echo "j = ", j
      break
    a = nexta
    for i in 0..<n:
      aflag[i] = 0
      nexta[i] = 0
    aflag[n] = 0
  return a.join(" ")



  



var
  nk = stdin.readline.split.map(parseInt)
  #nk = @[2E5.int, 2E5.int]

echo  solve(nk[0],nk[1])