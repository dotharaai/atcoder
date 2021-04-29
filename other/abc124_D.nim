import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


proc solve(n,k:int,s:string):int=
  var memo = newseq[(char,int)](0)
  if s[0] == '0':
    memo.add(('1',0))
  var idx=0
  while idx < len s:
    var lgt = 0
    while idx+lgt < len(s) - 1 and s[idx+lgt] == s[idx+lgt+1]:
      lgt+=1
    memo.add((s[idx],lgt+1))
    idx+=lgt+1
  if s[s.len-1] == '0':
    memo.add(('1',0))
  
  #for m in memo:
    #echo m
  var k = min(k,(memo.len - 1) div 2)
  #echo memo.len

  var zeros = memo.filterIt(it[0]=='0').len
  var tempvalue = 0
  var idx2 = 0
  var used = 0
  while used < k and idx2 < memo.len:
    if memo[idx2][0] == '1':
      tempvalue += memo[idx2][1]
    else:
      tempvalue += memo[idx2][1]
      used+=1
    #echo idx2, ", ",memo[idx2], ", ", used, ", ", tempvalue
    idx2+=1
  tempvalue+=memo[idx2][1]
  result = tempvalue
  #echo tempvalue
  var id = 2
  while id+2*k < memo.len:
    #echo "out:", id-2,", ", id-1
    #echo "in:", id+2*k-1,", ", id+2*k
    tempvalue -= (memo[id-2][1]+memo[id-1][1])
    tempvalue += (memo[id+2*k-1][1]+memo[id+2*k][1])
    id+=2
    #echo tempvalue
    result = max(result, tempvalue)


var
  n, k = read()
  s = stdin.readline

echo solve(n,k,s)