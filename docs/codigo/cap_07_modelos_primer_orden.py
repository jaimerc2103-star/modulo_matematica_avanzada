# Capítulo 1.7: Modelos de Población, Equilibrio y Velocidad
import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

# Simulación del modelo logístico dP/dt = r*P*(1 - P/K) desde distintas condiciones iniciales
t_eval = np.linspace(0, 15, 300)
r, K = 0.6, 100.0

plt.figure(figsize=(8, 4.5))
for P0 in [10, 35, 70, 135]:
    sol = solve_ivp(lambda t, P: r * P * (1 - P / K), [0, 15], [P0], t_eval=t_eval)
    plt.plot(sol.t, sol.y[0], lw=2.3, label=f"Condición inicial P(0) = {P0}")

plt.axhline(K, color="#153d64", ls="--", lw=2, label=f"Equilibrio estable P* = {K}")
plt.axhline(K/2, color="gray", ls=":", label="Inflexión P = K/2 = 50")
plt.title("Cap. 1.7 · Estabilidad del Modelo Logístico")
plt.xlabel("Tiempo t"); plt.ylabel("Población P(t)")
plt.grid(True, alpha=0.3); plt.legend()
plt.show()