import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


proc cmp(a,b:tuple[need,fin:int]):int=
  system.cmp[int](a.fin, b.fin)


# enough Array
proc solve(n,k:int):int=
  var a = stdin.readLine.split.map(parseInt)
  var cumsum = newseq[int](n+1)
  for i in 0..<n:
    cumsum[i+1] = cumsum[i]+a[i]
  #echo cumsum
  var term = 0
  for left in 0..n:
    if left >= 1:
      # termをcumsum[left]-cumsum[left-1]分巻き戻す
      term = max(left+1, term-(cumsum[left]-cumsum[left-1]))
    while term <= n and cumsum[term]-cumsum[left] < k:
      term+=1
    if term > n:
      break
    elif cumsum[term] - cumsum[left] >= k:
      #echo left, ", ", term
      result += (n-term+1)

      



  
  

var
  n,k = read()

echo solve(n,k)