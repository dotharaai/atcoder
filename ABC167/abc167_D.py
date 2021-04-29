

n, k = map(int,input().split())
cities = list(map(lambda x:int(x)-1,input().split()))

footprint_L = list()
footprint_S = set()
i = 0
footprint_S.add(i)
footprint_L.append(i)
while cities[i] not in footprint_S:
    footprint_S.add(cities[i])
    footprint_L.append(cities[i])
    i = cities[i]

#print("terminal:", cities[i])


cyclestart = footprint_L.index(cities[i])
cyclelen = len(footprint_L) - cyclestart
#print(footprint_L)
#print(cyclestart, cyclelen)
#print((k-cyclestart) % cyclelen)
if k >= len(footprint_L):
    print(footprint_L[cyclestart+(k-cyclestart) % cyclelen]+1)
else:
    print(footprint_L[k]+1)
