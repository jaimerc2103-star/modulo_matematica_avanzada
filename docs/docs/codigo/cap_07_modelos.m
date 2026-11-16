%% CAPÍTULO 7 | MODELOS MATEMÁTICOS DE PRIMER ORDEN
% UCACUE | Matemática Avanzada | Ingeniería Civil
% Población, caída con fricción y almacenamiento; análisis de sensibilidad.
clc; close all; clearvars;

%% 1. Población logística: P'=r*P*(1-P/K)
r=0.35;K=1200;P0=200;
t=linspace(0,25,451);
P=K./(1+(K/P0-1)*exp(-r*t));
[tn,Pn]=ode45(@(t,P)r*P*(1-P/K),[0 25],P0);
figure('Name','C7: población logística');
plot(t,P,'b','LineWidth',2);hold on;plot(tn,Pn,'r.');
plot(t,K*ones(size(t)),'k--');grid on;
xlabel('Tiempo [años]');ylabel('Población');
title('Modelo logístico: equilibrio P*=K');
legend('Exacta','ode45','K','Location','southeast');
fprintf('C7 - Tiempo para P=600: %.5f años\n',log(5)/r);

%% 2. Movimiento vertical con resistencia lineal
% Eje positivo hacia abajo, m*v'=m*g-c*v.
m=80;c=25;g=9.81;v0=0;vf=m*g/c;
tv=linspace(0,20,400);
v=vf+(v0-vf)*exp(-(c/m)*tv);
[tvn,vn]=ode45(@(t,v)g-(c/m)*v,[0 20],v0);
figure('Name','C7: resistencia viscosa');
plot(tv,v,'b','LineWidth',2);hold on;plot(tvn,vn,'r.');
plot(tv,vf*ones(size(tv)),'k--');grid on;
xlabel('Tiempo [s]');ylabel('Velocidad [m/s]');
title('Velocidad terminal y transitorio');
legend('Exacta','ode45','Terminal','Location','southeast');
t95=-m/c*log(0.05);
fprintf('C7 - v_inf=%.4f m/s; t95=%.4f s\n',vf,t95);

%% 3. Almacenamiento ideal: S'=I-k*S, S(0)=S0
I=2; k=0.1; S0=5; Se=I/k;
ts=linspace(0,35,400);
S=Se+(S0-Se)*exp(-k*ts);
[tsn,Sn]=ode45(@(t,S)I-k*S,[0 35],S0);
figure('Name','C7: almacenamiento');
plot(ts,S,'b','LineWidth',2);hold on;plot(tsn,Sn,'r.');
plot(ts,Se*ones(size(ts)),'k--');grid on;
xlabel('Tiempo [h]');ylabel('Almacenamiento [unidad de volumen]');
title('Aporte constante y descarga proporcional');
legend('Exacta','ode45','Equilibrio','Location','southeast');
fprintf('C7 - Almacenamiento S(10)=%.5f\n',Se+(S0-Se)*exp(-1));

%% 4. Sensibilidad del modelo de almacenamiento
figure('Name','C7: sensibilidad a k');hold on;
for kj=[0.05 0.10 0.20]
    Sk=I/kj+(S0-I/kj)*exp(-kj*ts);
    plot(ts,Sk,'LineWidth',1.8,...
        'DisplayName',sprintf('k=%.2f 1/h',kj));
end
grid on;xlabel('Tiempo [h]');ylabel('Almacenamiento');
title('k modifica equilibrio y transitorio');
legend('Location','best');

%% ACTIVIDADES
% A1: construya una tabla completa de parámetros con unidades.
% A2: contraste fórmula y ode45 para los tres modelos.
% A3: estudie el efecto de un parámetro sobre el equilibrio.
% A4: redacte un informe de ingeniería con supuestos y limitaciones.
