# Capítulo 1.6: Métodos de Sustitución y Ecuaciones Exactas
import numpy as np
import sympy as sp
import matplotlib.pyplot as plt

# 1. Verificación simbólica de exactitud y cálculo del potencial Φ(x,y)
x, y = sp.symbols('x y', real=True)
M = 2*x - y
N = 2*y - x
print("¿Es exacta? ∂M/∂y - ∂N/∂x =", sp.simplify(sp.diff(M, y) - sp.diff(N, x)))

Phi = sp.integrate(M, x) + sp.integrate(N - sp.diff(sp.integrate(M, x), y), y)
print("Función potencial Φ(x, y) =", Phi)

# 2. Gráfica de las curvas de nivel Φ(x, y) = C
xg, yg = np.meshgrid(np.linspace(-3, 3, 200), np.linspace(-3, 3, 200))
Z = xg**2 - xg * yg + yg**2
plt.figure(figsize=(7, 5))
cs = plt.contour(xg, yg, Z, levels=[0.5, 1.5, 3.0, 5.0, 8.0], cmap="RdBu_r")
plt.clabel(cs, inline=True, fontsize=9)
plt.title("Cap. 1.6 · Curvas Solución como Nivel de Potencial Φ(x,y) = C")
plt.xlabel("x"); plt.ylabel("y"); plt.grid(True, alpha=0.3)
plt.show()