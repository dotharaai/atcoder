import strutils,algorithm, sequtils

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:float = get().parseFloat
const inf = high(int) div 4

proc solve():float=
  var n, k = read()
  return (6*(k-1)*(n-k)+3*1*1*(n-1)+1)/n/n/n
  
  
  

echo solve()