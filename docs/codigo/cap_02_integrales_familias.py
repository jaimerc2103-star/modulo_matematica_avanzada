# Capítulo 1.2: Integrales como Soluciones Generales y Particulares
import numpy as np
import sympy as sp
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

# 1. Integración simbólica y condición inicial
x, C = sp.symbols('x C')
f_x = x * sp.exp(-x**2 / 2)
y_gen = sp.integrate(f_x, x) + C
print("Familia general y(x) =", y_gen)

# 2. Gráfica de la familia de soluciones y curva particular para y(0) = 1
x_vals = np.linspace(-3, 3, 250)
plt.figure(figsize=(8, 4.5))
for c_val in [-2, -1, 0, 1, 2]:
    y_vals = -np.exp(-x_vals**2 / 2) + c_val
    estilo = "-" if c_val == 2 else "--"
    ancho = 2.8 if c_val == 2 else 1.4
    plt.plot(x_vals, y_vals, ls=estilo, lw=ancho, label=f"C = {c_val}")

plt.scatter([0], [1], color="#b51f33", zorder=5, s=60, label="Condición inicial y(0)=1 (C=2)")
plt.title("Cap. 1.2 · Familia de Curvas Solución por Integración Directa")
plt.xlabel("x")
plt.ylabel("y(x)")
plt.grid(True, alpha=0.3)
plt.legend()
plt.show()