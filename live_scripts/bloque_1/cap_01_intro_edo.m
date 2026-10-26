%% CAPÍTULO 1 | INTRODUCCIÓN A LAS ECUACIONES DIFERENCIALES
% UCACUE | Matemática Avanzada | Ingeniería Civil | Edición ampliada
% Objetivos: clasificar modelos, verificar PVI y estudiar parámetros.
% Dependencias: MATLAB base (ode45, interp1). Sin Symbolic Math Toolbox.
clc; close all; clearvars;

%% 1. Definición del balance ideal y unidades
% V en m^3; t en horas; k en 1/h. Ecuación: V' = -k*V.
V0 = 8; k = 0.4; ti = 0; tf = 10;
f = @(t,V) -k*V;
Vexacta = @(t) V0*exp(-k*t);
t = linspace(ti,tf,501);
[tn,Vn] = ode45(f,[ti tf],V0);

%% 2. Contraste analítico y numérico
Ve_n = Vexacta(tn);
error_max = max(abs(Vn-Ve_n));
figure('Name','C1: PVI y comprobación');
plot(t,Vexacta(t),'b','LineWidth',2); hold on;
plot(tn,Vn,'r.','MarkerSize',7); grid on;
xlabel('Tiempo [h]'); ylabel('Volumen [m^3]');
title('V'' = -kV: solución analítica y ode45');
legend('Analítica','ode45','Location','northeast');
fprintf('C1 - Error máximo en la malla de ode45: %.3e m^3\n',error_max);

%% 3. Tiempo característico y semirreducción
mitad = log(2)/k;
fprintf('C1 - V(5 h) = %.4f m^3\n',Vexacta(5));
fprintf('C1 - Semirreducción = %.4f h\n',mitad);
assert(abs(Vexacta(0)-V0)<1e-12,'Error en condición inicial');

%% 4. Sensibilidad k = 0.2, 0.4 y 0.8 h^-1
figure('Name','C1: sensibilidad al parámetro k'); hold on;
lista_k = [0.2 0.4 0.8];
for j=1:numel(lista_k)
    kj = lista_k(j);
    plot(t,V0*exp(-kj*t),'LineWidth',1.8, ...
        'DisplayName',sprintf('k = %.1f 1/h',kj));
end
grid on; xlabel('Tiempo [h]'); ylabel('Volumen [m^3]');
legend('Location','northeast'); title('Impacto de la tasa de pérdida');

%% 5. Modelo de velocidad: la ley es distinta
% Eje positivo hacia abajo. dv/dt = g-(c/m)*v.
m = 80; c = 25; g = 9.81; v0 = 0;
tv = linspace(0,20,300); v_inf = m*g/c;
v = v_inf + (v0-v_inf)*exp(-(c/m)*tv);
figure('Name','C1: otro fenómeno representado por una EDO');
plot(tv,v,'LineWidth',2); grid on;
xlabel('Tiempo [s]'); ylabel('Velocidad [m/s]');
title('Caída idealizada con resistencia lineal');
fprintf('C1 - Velocidad terminal = %.3f m/s\n',v_inf);

%% ACTIVIDADES AL FINAL DEL TEMA
% A1: clasifique cinco EDO y dos EDP; indique orden y linealidad.
% A2: compare fórmula y ode45 con diferentes tolerancias.
% A3: modifique k y estime el efecto sobre el tiempo de semirreducción.
% A4: escriba las unidades, hipótesis y límites de los dos modelos.
