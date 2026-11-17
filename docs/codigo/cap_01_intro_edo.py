# Capítulo 1.1: Ecuaciones Diferenciales y Modelos Matemáticos
import numpy as np
import sympy as sp
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

# 1. Resolución simbólica exacta con SymPy
t, k, T_amb = sp.symbols('t k T_amb', positive=True)
y = sp.Function('y')
edo = sp.Eq(sp.diff(y(t), t), -k * (y(t) - T_amb))
sol_exacta = sp.dsolve(edo, y(t), ics={y(0): 95})
print("Solución analítica exacta:", sol_exacta)

# 2. Simulación numérica con SciPy (solve_ivp - RK45) y sensibilidad
t_eval = np.linspace(0, 15, 250)
plt.figure(figsize=(8, 4.5))
for k_val in [0.15, 0.35, 0.70]:
    sol = solve_ivp(lambda t, y: -k_val * (y - 20.0), [0, 15], [95.0], t_eval=t_eval)
    plt.plot(sol.t, sol.y[0], lw=2.2, label=f"k = {k_val} s⁻¹ (τ = {1/k_val:.2f} s)")

plt.axhline(20.0, color="#153d64", ls="--", label="Equilibrio T_amb = 20 °C")
plt.title("Cap. 1.1 · Sensibilidad respecto al parámetro k")
plt.xlabel("Tiempo t (s)")
plt.ylabel("Temperatura y(t) [°C]")
plt.grid(True, alpha=0.3)
plt.legend()
plt.show()