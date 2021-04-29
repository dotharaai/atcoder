import strformat, strutils

proc solve(s:seq[string]):string=
  return fmt"{s[2]} {s[0]} {s[1]}"


echo solve(stdin.readLine.split(" "))