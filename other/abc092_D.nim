import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 

const inf = int.high - 5

proc read:int = get().parseInt



proc solve()=
  var a,b = read()
  var base = newseqwith(100,"")
  for i in 0..<50:
    base[i] = "#".repeat(100)
    base[i+50] = ".".repeat(100)
  block white:
    var count = 1
    for line in countup(0,50,2):
      for spot in countup(0,99,2):
        if count == a:
          break white
        base[line][spot] = '.'
        count+=1
        
  block black:
    var count = 1
    for line in countup(0,50,2):
      for spot in countup(0,99,2):
        if count == b:
          break black
        base[51+line][spot] = '#'
        count+=1
        
  echo "100 100"
  for d in base:
    echo d

    

  



solve()