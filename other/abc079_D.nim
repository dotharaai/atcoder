import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

const inf = int.high
var
  h, w = read()
  d = newseqwith(10,newseqwith(10,inf))
  num = newseqwith(10,0)

for i in 0..9:
  var c = stdin.readLine.split.map(parseInt)
  for ci in 0..9:
    d[i][ci] = c[ci]


for i in 0..<h:
  var c = stdin.readLine.split.map(parseInt)
  for ci in c:
    if ci>=0:
      num[ci]+=1


proc wf()=
  for k in 0..9:
    for i in 0..9:
      for j in 0..9:
        d[i][j] = min(d[i][j], d[i][k]+d[k][j])
        #if d[i][j] == d[i][k]+d[k][j]:
          #echo "更新,", d[i][j]

proc solve():int=
  for i in 0..9:
    result += d[i][1]*num[i]


wf()
echo solve()
