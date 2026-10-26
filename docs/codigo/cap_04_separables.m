%% CAPÍTULO 4 | ECUACIONES SEPARABLES Y APLICACIONES
% UCACUE | Matemática Avanzada | Ingeniería Civil
% Tres casos: decaimiento, tangente con dominio y crecimiento logístico.
clc; close all; clearvars;

%% 1. Reducción de concentración: C'=-k*C
k=0.25; C0=12; tf=12; t=linspace(0,tf,501);
Cexacta=C0*exp(-k*t);
[tn,Cn]=ode45(@(t,C)-k*C,[0 tf],C0);
figure('Name','C4: concentración');
plot(t,Cexacta,'b','LineWidth',2);hold on;
plot(tn,Cn,'r.');
plot([0 tf],[C0/2 C0/2],'k--');grid on;
xlabel('Tiempo [h]');ylabel('Concentración [mg/L]');
title('Modelo C''=-kC y tiempo de semirreducción');
legend('Exacta','ode45','C_0/2','Location','northeast');
fprintf('C4 - t_mitad = %.5f h\n',log(2)/k);

%% 2. EDO separable y'=t(1+y^2), y(0)=0
% Solución y=tan(t^2/2) definida en (-sqrt(pi), sqrt(pi)).
tlim=sqrt(pi);t2=linspace(0,0.95*tlim,300);
y2=tan(t2.^2/2);
[t2n,y2n]=ode45(@(t,y)t*(1+y.^2),[0 0.95*tlim],0);
figure('Name','C4: dominio y singularidad');
plot(t2,y2,'LineWidth',2);hold on;
plot(t2n,y2n,'r.');grid on;
xlabel('t');ylabel('y(t)');title('y=tan(t^2/2) antes del polo');
legend('Exacta','ode45','Location','northwest');
fprintf('C4 - Primer polo positivo en t=%.6f\n',tlim);

%% 3. Crecimiento logístico: P'=r*P*(1-P/K)
r=0.30; K=1000; P0=200;
t3=linspace(0,25,400);
P=K./(1+(K/P0-1)*exp(-r*t3));
[t3n,Pn]=ode45(@(t,P)r*P*(1-P/K),[0 25],P0);
figure('Name','C4: crecimiento logístico');
plot(t3,P,'b','LineWidth',2); hold on;
plot(t3n,Pn,'r.');
plot(t3,K*ones(size(t3)),'k--');grid on;
xlabel('Tiempo');ylabel('P');
title('Solución logística, P_0=200, K=1000');
legend('Exacta','ode45','K','Location','southeast');
fprintf('C4 - Tiempo hasta P=500: %.4f\n',log(4)/r);

%% 4. Sensibilidad de la tasa de decaimiento
figure('Name','C4: sensibilidad k'); hold on;
for kj=[0.10 0.25 0.50]
    plot(t,C0*exp(-kj*t),'LineWidth',1.7,...
        'DisplayName',sprintf('k = %.2f 1/h',kj));
end
grid on; xlabel('Tiempo [h]');ylabel('C [mg/L]');
legend('Location','northeast');title('Cambia la tasa, cambia la escala temporal');

%% ACTIVIDADES
% A1: identifique todas las soluciones de equilibrio antes de dividir.
% A2: determine intervalos de definición de ecuaciones con tangente.
% A3: contraste crecimiento desde P0<K y P0>K.
% A4: describa limitaciones de estos modelos en situaciones reales.
