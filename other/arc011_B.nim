import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc rep(word:string,d:Table[char,char]):string=
  result = word.toLowerAscii().replace(".","").replace(",","").replace("a","").replace("i","").replace("u","").replace("e","").replace("o","").replace("y","")

  for idx in 0..<result.len:
    result[idx]=d[result[idx].toLowerAscii()]

proc solve()=
  var
    n = scan()
    w = newseqwith(n,read())
    b = {'b':'1','c':'1','d':'2','w':'2','t':'3','j':'3','f':'4','q':'4','l':'5','v':'5',
    's':'6','x':'6','p':'7','m':'7','h':'8','k':'8','n':'9','g':'9','z','0','r':'0'}.toTable
  
  w.applyIt(it.rep(b))

  
  echo w.filterIt(it.len>0).join(" ")


    

    
  
solve()