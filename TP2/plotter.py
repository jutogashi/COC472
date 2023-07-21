import matplotlib.pyplot as plt
import matplotlib
import numpy as np
import pandas as pd
import seaborn as sns

N = [1000, 2000, 4000]

results = [19.388493, 270.502596, 2880.538923]

plt.figure(figsize=(12, 8))
plt.plot(N, results, 'o-')
plt.xticks(N)
plt.tick_params('x', labelsize = 6)

plt.xlabel('Size N of vector and Matrix')
plt.ylabel('Time (s)')
plt.title('Runtime for Jacobi Method', weight = 'bold')
plt.savefig("TP2/results.png")
plt.show()

df = pd.read_csv('TP2/times.csv', header = 0)
print(df.head())

fig, ax = plt.subplots(1, figsize=(10, 10))
sns.boxplot(x=df['type'], y=df['time'])
plt.title('Runtime for Jacobi Method', weight = 'bold')
plt.savefig("TP2/results_box.png")
plt.show()