import strutils, algorithm, sequtils, tables

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

  
proc solve(n:int):int=
  var a = stdin.readline.split.map(parseInt).sorted(system.cmp, SortOrder.Ascending)
  var t = initTable[int,int]()
  var dp = newseqwith(1E6.int+1,true)
  dp[a[0]] = true
  for idx, x in a:
    if t.haskeyorput(x,1):
      t[x]+=1
    else:
      if dp[x]:
        for d in countup(2*x,1E6.int,x):
          dp[d] = false

  for i, x in a:

    if dp[x] and t[x] == 1:
      result+=1

  

  

var
  n = stdin.readLine().parseInt
  #n = 2E5.int


echo solve(n)