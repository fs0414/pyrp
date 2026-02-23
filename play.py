from jsonschema.benchmarks.contains import size
from sklearn.utils.validation import _num_samples
import polars as pl
import matplotlib.pyplot as plt
import random

x = []
y = []

total = 0
num_5 = 0
n = 5

for i in range(n):
    # print(random.randint(1, 5))
    if random.randint(1, 5) == 5:
        num_5 += 1

    total += 1
    x.append(i)
    y.append(num_5/total)

plt.plot(x, y)
plt.plot(x, [1/6]*n, linestyle="dashed")
# plt.plot(x, y)
plt.xlabel('x', size=14)
plt.ylabel('y', size=14)
plt.grid()
plt.show()
