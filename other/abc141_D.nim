import algorithm, sequtils, strutils, math,tables, queues, future



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt

proc pushHeap[T](arr:var seq[T], elem:T)=
  var n = arr.len
  arr.add(elem)
  while n != 0:
    var i = (n - 1) div 2
    if arr[n] > arr[i]:
      swap(arr[n],arr[i])
    n = i
proc popHeap[T](arr:var seq[T]):T=
  result = arr[0]

  var n = arr.len-1
  arr[0] = arr[n]
  arr.delete(n)
  var i = 0
  var j :int = 2*i+1
  while j < n:
    if j != n-1 and arr[j] < arr[j+1]:
      j+=1
    if arr[i] < arr[j]:
      swap(arr[i], arr[j])
    i=j
    j = 2*i+1

proc solve(n,m:int):int=
  var a = stdin.readLine.split.map(parseInt)
  var heap:seq[int] = @[]
  for  i in 0..<n:
    heap.pushHeap(a[i])
  for i in 0..<m:
    var f = heap.popHeap
    heap.pushHeap(f div 2)
  for i in 0..<heap.len:
    result+=heap[i]



  


  



var n,m = read()
echo solve(n,m)