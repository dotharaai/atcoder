import sequtils, algorithm,strutils,sets, math

proc solve():int=
  var x = stdin.readline
  var s = newseq[char](0)
  for i in 0..<x.len:
    if s.len == 0:
      s.add(x[i])
    elif s[s.len-1] == 'S' and x[i] == 'T':
        discard s.pop()
    else:
      s.add(x[i])
  return s.len


echo solve()