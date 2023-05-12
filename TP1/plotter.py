import matplotlib.pyplot as plt
import matplotlib
import numpy as np

N = [1000, 2000, 3000, 4000, 5000,
     6000, 7000, 8000, 9000, 10000,
     11000, 12000, 13000, 14000, 15000,
     16000, 17000, 18000, 19000, 20000,
     21000, 22000, 23000, 24000, 25000]

results = []

filename = "COC472/TP1/results.txt"

with open(filename, "r") as file:
    lines = file.readlines()

for line in lines:
    ints = [float(x) for x in line.split()]
    results.append(ints)

plt.figure(figsize=(12, 8))
plt.plot(N, results[0], 'o-', label='C - line/col')
plt.plot(N, results[1], 'o-', label='C - col/line')
plt.plot(N, results[2], 'o-', label='Fortran - line/col')
plt.plot(N, results[3], 'o-', label='Fortran - col/line')
plt.xticks(N)
plt.tick_params('x', labelsize = 6)

plt.xlabel('Size N of vector and Matrix')
plt.ylabel('Time (s)')
plt.title('Runtime for multiplication A.x = b', weight = 'bold')
plt.legend()
plt.savefig("COC472/TP1/results.png")
plt.show()