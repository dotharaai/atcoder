import strformat, math, strutils
var 
  n = 199996
  k = 199995
  a = newseq[int](n)

for i in 0..<n:
  a[i] =  -1000000000

var f = open("ABC173/test.txt",FileMode.fmWrite)
f.writeline(fmt"{n} {k}")
f.writeline(a.join(" "))
f.close()