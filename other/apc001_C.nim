import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    n = scan()
    seats = newseqwith(n,"")

  proc binSearch(left,right:int)=
    if seats[left] == "":
      echo left
      seats[left] = read()
      if seats[left]=="Vacant":
        return
    if seats[right] == "":
      echo right
      seats[right]=read()
      if seats[right]=="Vacant":
        return
    var mid = (left+right).div(2)
    echo mid
    seats[mid] = read()
    if seats[mid]=="Vacant":
      return
    else:
      if (mid - left).mod(2)==0:
        if seats[mid]!=seats[left]:
          binSearch(left,mid)
        else:
          binSearch(mid,right)
      else:
        if seats[mid]==seats[left]:
          binSearch(left,mid)
        else:
          binSearch(mid,right)
  binSearch(0,n-1)


    

    
  
solve()