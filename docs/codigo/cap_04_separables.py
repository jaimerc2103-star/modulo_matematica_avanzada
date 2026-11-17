# Capítulo 1.4: Ecuaciones Separables y Aplicaciones Físicas
import numpy as np
import sympy as sp
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

# 1. Modelo de vaciado de tanque (Torricelli): dh/dt = -c * sqrt(h)
t = np.linspace(0, 25, 300)
h0 = 9.0
plt.figure(figsize=(8, 4.5))

for c in [0.12, 0.20, 0.30]:
    h_exacta = np.maximum(0.0, np.sqrt(h0) - 0.5 * c * t)**2
    t_vac = 2 * np.sqrt(h0) / c
    plt.plot(t, h_exacta, lw=2.4, label=f"c = {c} (Vaciado en t = {t_vac:.1f} s)")

plt.title("Cap. 1.4 · Vaciado de Tanque por Separación de Variables")
plt.xlabel("Tiempo t (s)")
plt.ylabel("Altura de agua h(t) [m]")
plt.grid(True, alpha=0.3)
plt.legend()
plt.show()