%% CAPÍTULO 2 | INTEGRALES Y FAMILIAS DE SOLUCIONES
% UCACUE | Matemática Avanzada | Ingeniería Civil
% Comparación: familia, PVI, curvas implícitas y cinemática.
clc; close all; clearvars;

%% 1. Familia general y' = 2t-3
% Integración: y=t^2-3t+C.
t = linspace(-1,5,401);
Cs = [-2 0 2 4 6];
figure('Name','C2: soluciones generales'); hold on;
for j=1:numel(Cs)
    C=Cs(j);
    plot(t,t.^2-3*t+C,'LineWidth',1.4, ...
        'DisplayName',sprintf('C = %g',C));
end
plot(0,4,'ko','MarkerFaceColor','k','DisplayName','PVI (0,4)');
plot(t,t.^2-3*t+4,'k--','LineWidth',2.4, ...
    'DisplayName','Solución particular');
grid on; xlabel('t'); ylabel('y'); legend('Location','best');
title('Una ecuación diferencial, infinitas curvas solución');

%% 2. Verificación algebraica en una malla
C=4; y=t.^2-3*t+C;
dydt=2*t-3;
residuo=max(abs(dydt-(2*t-3)));
fprintf('C2 - y(2) = %.4f\n',2^2-3*2+C);
fprintf('C2 - Residuo algebraico máximo = %.3e\n',residuo);

%% 3. Curva implícita x^2 + y^2 = 9; condición y(0)=3
x = linspace(-3,3,601);
yarriba=sqrt(max(0,9-x.^2));
yabajo=-yarriba;
figure('Name','C2: solución implícita');
plot(x,yarriba,'b','LineWidth',2); hold on;
plot(x,yabajo,'Color',[0.65 0.65 0.65],'LineWidth',1.4);
plot(0,3,'ro','MarkerFaceColor','r'); axis equal; grid on;
xlabel('x'); ylabel('y');
title('x^2+y^2=9: rama seleccionada por y(0)=3');
legend('Rama del PVI','Otra rama','Dato inicial','Location','best');
% La EDO y'=-x/y no está definida en y=0.

%% 4. De aceleración a posición (modelo cinemático)
% x''(t)=2t, x(0)=1 m y x'(0)=0 m/s.
tc=linspace(0,3,301);
a=2*tc; vel=tc.^2; pos=tc.^3/3+1;
figure('Name','C2: integración sucesiva');
subplot(3,1,1);plot(tc,a,'LineWidth',1.8);grid on;ylabel('a [m/s^2]');
subplot(3,1,2);plot(tc,vel,'LineWidth',1.8);grid on;ylabel('v [m/s]');
subplot(3,1,3);plot(tc,pos,'LineWidth',1.8);grid on;
ylabel('x [m]');xlabel('Tiempo [s]');
fprintf('C2 - Posición en t=3 s: %.3f m\n',pos(end));

%% ACTIVIDADES
% A1: seleccione C para y(1)=5 en y=t^2-3t+C.
% A2: dibuje familias para varias constantes e indique diferencias.
% A3: estudie por qué x^2+y^2=9 no es una única función y(x).
% A4: reconstruya la trayectoria con otra aceleración y dos datos.
