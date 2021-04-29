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
    Deg = scan()
    Dis = scan()
    Dir: string
    W: int
 
  Dir = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW",
      "WSW", "W", "WNW", "NW", "NNW"][round(Deg / 3600 / 0.0625).toInt mod 16]
  let ws = round(Dis / 60, 1)
  if ws <= 0.2:
    W = 0
  elif 0.3 <= ws and ws <= 1.5:
    W = 1
  elif 1.6 <= ws and ws <= 3.3:
    W = 2
  elif 3.4 <= ws and ws <= 5.4:
    W = 3
  elif 5.5 <= ws and ws <= 7.9:
    W = 4
  elif 8.0 <= ws and ws <= 10.7:
    W = 5
  elif 10.8 <= ws and ws <= 13.8:
    W = 6
  elif 13.9 <= ws and ws <= 17.1:
    W = 7
  elif 17.2 <= ws and ws <= 20.7:
    W = 8
  elif 20.8 <= ws and ws <= 24.4:
    W = 9
  elif 24.5 <= ws and ws <= 28.4:
    W = 10
  elif 28.5 <= ws and ws <= 32.6:
    W = 11
  elif 32.7 <= ws:
    W = 12
  if W == 0:
    Dir = "C"
  echo Dir, " ", W
  
solve()