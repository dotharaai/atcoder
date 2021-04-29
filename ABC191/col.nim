import strutils, sequtils

const MOD = 1000000007'u

func collatz(i: uint): uint =
  if i == 1: 0'u
  elif (i and 1)  == 0: collatz(i shr 1) + 1'u
  else: collatz(i shl 1 + i + 1) + 1'u

proc main() =
  let n =stdin.readLine().parseUInt()
  echo (1'u..n).foldl((a + collatz(b)) mod MOD, first = 0'u)

if isMainModule:
  #GC_disableMarkAndSweep()
  main()