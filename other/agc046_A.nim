import math, strformat, sequtils, strutils

proc expl(X:float):int=
  var
    x = 1.0
    y = 0.0
    c = 1.0
  while abs(x)>1E-9 or abs(y)>1E-9:
    #echo fmt"{c}, ({x},{y})"
    x = x+cos(X*c*PI/180.0)
    y = y+sin(X*c*PI/180.0)
    c+=1
    
  return c.int



proc prepareTable():seq[int]=
  result = newseq[int](180)
  for i in 1..179:
    #stdout.write(fmt"{i}: ")
    result[i] = expl(i.float)

const t = prepareTable()

echo t[stdin.readLine.parseInt]