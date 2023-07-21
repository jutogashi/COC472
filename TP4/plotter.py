import matplotlib.pyplot as plt
import matplotlib
import numpy as np

N = [1, 2, 4, 8, 16, 32, 64]

results = [[32.28, 16.31, 10.74, 12.62, 10.06, 10.15, 10.25],
           [116.66, 58.65, 43.85, 45.69, 46.13, 43.20, 42.25],
           [382.12, 218.02, 119.66, 109.32, 104.77, 100.34, 99.12]]


plt.figure(figsize=(12, 8))
plt.plot(N, results[0], 'o-', label = '1000x1000')
plt.plot(N, results[1], 'o-', label = '1500x1500')
plt.plot(N, results[2], 'o-', label = '2000x2000')
plt.xticks(N)
plt.tick_params('x', labelsize = 6)

plt.xlabel('Number N of threads')
plt.ylabel('Time (s)')
plt.title('Runtime for Jacobi method with Matrix size fixed', weight = 'bold')
plt.legend()
plt.savefig("graph_strong.png")
plt.show()