# Capítulo 1.5: Ecuaciones Lineales de Primer Orden y Factor Integrante
import numpy as np
import sympy as sp
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

# 1. Solución simbólica mediante factor integrante en SymPy
t = sp.symbols('t', real=True)
y = sp.Function('y')
edo_lin = sp.Eq(sp.diff(y(t), t) + y(t), sp.cos(2 * t))
sol_pvi = sp.dsolve(edo_lin, y(t), ics={y(0): 1.5})
print("Solución exacta del PVI:", sol_pvi)

# 2. Comparación entre respuesta total y régimen estacionario
t_num = np.linspace(0, 15, 350)
sol = solve_ivp(lambda t, y: -y + np.cos(2 * t), [0, 15], [1.5], t_eval=t_num)
y_est = (np.cos(2 * t_num) + 2 * np.sin(2 * t_num)) / 5.0

plt.figure(figsize=(8, 4.5))
plt.plot(sol.t, sol.y[0], color="#b51f33", lw=2.5, label="Respuesta Total y(t)")
plt.plot(t_num, y_est, color="#153d64", ls="--", lw=2.0, label="Respuesta Estacionaria")
plt.title("Cap. 1.5 · EDO Lineal de Primer Orden: Transitorio vs. Estacionario")
plt.xlabel("Tiempo t (s)"); plt.ylabel("y(t)")
plt.grid(True, alpha=0.3); plt.legend()
plt.show()