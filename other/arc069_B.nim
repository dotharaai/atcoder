import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    n = scan()
    s = read()
  for (first,second) in @[("S","S"),("S","W"),("W","S"),("W","W")]:
    var
      kind = newseqwith(n,"")
      expect:string
    kind[0]=first
    kind[1]=second
    if first == "S":
      if s[0]=='o':
        expect=second
      else:
        if second=="S":
          expect = "W"    
        else:
          expect = "S"
    else:
      if s[0]=='x':
        expect=second
      else:
        if second=="S":
          expect = "W"
        else:
          expect = "S"
    for i in 1..<n-1:
      if kind[i]=="S":
        if s[i]=='o':
          kind[i+1]=kind[i-1]
        else:
          if kind[i-1]=="S":
            kind[i+1]="W"
          else:
            kind[i+1]="S"
      else:
        if s[i]=='x':
          kind[i+1]=kind[i-1]
        else:
          if kind[i-1]=="S":
            kind[i+1]="W"
          else:
            kind[i+1]="S"
    if kind[n-1]==expect:
      if kind[n-1]=="S":
        if s[n-1]=='o' and kind[0]==kind[n-2]:
          echo kind.join("")
          return
        elif s[n-1]=='x' and kind[0]!=kind[n-2]:
          echo kind.join("")
          return
      else:
        if s[n-1]=='x' and kind[0]==kind[n-2]:
          echo kind.join("")
          return
        elif s[n-1]=='o' and kind[0]!=kind[n-2]:
          echo kind.join("")
          return
  echo -1



        

  

    
  
solve()