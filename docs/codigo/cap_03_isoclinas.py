# Capítulo 1.3: Campos de Pendientes, Isoclinas y Curvas Solución
import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

# 1. Malla para el campo de direcciones de dy/dx = x - y
X, Y = np.meshgrid(np.linspace(-3, 3, 17), np.linspace(-3, 3, 17))
U = np.ones_like(X)
V = X - Y
N = np.sqrt(U**2 + V**2)
U, V = U / N, V / N

plt.figure(figsize=(8, 5))
plt.quiver(X, Y, U, V, color="#9fb3c8", angles="xy")

# 2. Isoclinas y soluciones particulares
x_span = np.linspace(-3, 3, 200)
for m in [-1.5, 0.0, 1.5]:
    plt.plot(x_span, x_span - m, "--", lw=1.3, label=f"Isoclina m = {m}")

for y0 in [-2.0, 0.0, 2.0]:
    sol = solve_ivp(lambda x, y: x - y, [-3, 3], [y0], t_eval=x_span)
    plt.plot(sol.t, sol.y[0], lw=2.4, label=f"Solución con y(-3) = {y0}")

plt.xlim(-3, 3); plt.ylim(-3, 3)
plt.title("Cap. 1.3 · Campo de Pendientes e Isoclinas: dy/dx = x - y")
plt.xlabel("x"); plt.ylabel("y")
plt.grid(True, alpha=0.3); plt.legend(loc="upper left", fontsize=8)
plt.show()