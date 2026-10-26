%% CAPÍTULO 5 | ECUACIONES LINEALES DE PRIMER ORDEN
% UCACUE | Matemática Avanzada | Ingeniería Civil
% Factor integrante, equilibrio y modelo idealizado de enfriamiento.
clc; close all; clearvars;

%% 1. Ecuación y'+2y=6, y(0)=1
f1=@(t,y)6-2*y;
t=linspace(0,4,401); y=3-2*exp(-2*t);
[tn,yn]=ode45(f1,[0 4],1);
figure('Name','C5: lineal constante');
plot(t,y,'b','LineWidth',2); hold on; plot(tn,yn,'r.');
plot(t,3*ones(size(t)),'k--');grid on;
xlabel('t');ylabel('y'); title('Transitorio y equilibrio y*=3');
legend('Exacta','ode45','Equilibrio','Location','southeast');

%% 2. Coeficiente variable en t>0
% y' +(1/t)y=t, y(1)=1 -> y=t^2/3+2/(3t).
f2=@(t,y) t-y/t;
t2=linspace(0.25,5,400); y2=t2.^2/3+2./(3*t2);
[t2n,y2n]=ode45(f2,[1 5],1);
figure('Name','C5: lineal variable');
plot(t2,y2,'b','LineWidth',2);hold on;plot(t2n,y2n,'ro');
plot(1,1,'ks','MarkerFaceColor','k');grid on;
xlabel('t>0');ylabel('y');
title('Factor integrante mu(t)=t; restricción t>0');
legend('Exacta','ode45 t>=1','PVI','Location','best');

%% 3. Enfriamiento idealizado T'=-k*(T-Tamb)
Tamb=20; T0=80; k=0.15;
t3=linspace(0,25,350);
T=Tamb+(T0-Tamb)*exp(-k*t3);
[t3n,Tn]=ode45(@(t,T)-k*(T-Tamb),[0 25],T0);
figure('Name','C5: enfriamiento idealizado');
plot(t3,T,'b','LineWidth',2);hold on;
plot(t3n,Tn,'r.');plot(t3,Tamb*ones(size(t3)),'k--');
grid on;xlabel('Tiempo [min]');ylabel('T [C]');
title('Respuesta térmica de primer orden');
legend('Exacta','ode45','Ambiente','Location','northeast');
fprintf('C5 - T(15)=%.4f C; tiempo hasta 30 C=%.4f min\n', ...
    Tamb+(T0-Tamb)*exp(-k*15),log(6)/k);

%% 4. Estudio de sensibilidad en k
figure('Name','C5: sensibilidad enfriamiento');hold on;
for kj=[0.08 0.15 0.30]
    plot(t3,Tamb+(T0-Tamb)*exp(-kj*t3),'LineWidth',1.8,...
        'DisplayName',sprintf('k = %.2f 1/min',kj));
end
grid on;xlabel('Tiempo [min]');ylabel('T [C]');
title('Variación del parámetro de enfriamiento');
legend('Location','northeast');

%% ACTIVIDADES
% A1: deduzca el factor integrante usando la regla del producto.
% A2: explique por qué t=0 divide el dominio en el ejemplo 2.
% A3: analice la sensibilidad del tiempo para alcanzar 30 C.
% A4: documente supuestos de un sistema térmico concentrado.
