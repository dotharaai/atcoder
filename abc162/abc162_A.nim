import strutils, algorithm, sequtils


proc solve(N:seq[char]):string=
  if '7' in N:
    return "Yes"
  else:
    return "No"



var
  ab = @(stdin.readline())

echo solve(ab)