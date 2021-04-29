import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 



proc read:int = get().parseInt



proc solve(n,m:int):int=
  var a = stdin.readLine.split.mapIt((it.parseInt div 2))
  var lcm = a[0]
  
  for c in a[1..<a.len]:
    lcm = lcm(lcm,c)
    if (lcm div c) mod 2 == 0:
      #lcm += c
      lcm*=3
    if lcm > m:
      return 0
  return (m div lcm) - (m div (lcm*2))


var
  n,m = read()
echo solve(n,m)