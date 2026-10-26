%% CAPÍTULO 3 | CAMPOS DE PENDIENTES E ISOCLINAS
% UCACUE | Matemática Avanzada | Ingeniería Civil
% EDO y'=t-y; isoclinas y=t-c; métodos Euler y ode45.
clc; close all; clearvars;
f=@(t,y) t-y;

%% 1. Campo de direcciones normalizado
[T,Y]=meshgrid(-2:0.4:4,-2:0.4:4);
F=f(T,Y); U=1./sqrt(1+F.^2); V=F./sqrt(1+F.^2);
figure('Name','C3: campo e isoclinas');
quiver(T,Y,U,V,0.38,'Color',[.64 .68 .74]); hold on;

%% 2. Isoclinas de pendiente -1, 0, 1 y curva particular
xi=linspace(-2,4,401);
for pendiente=[-1 0 1]
    plot(xi,xi-pendiente,':','LineWidth',1.5,...
        'DisplayName',sprintf('Isoclina m=%g',pendiente));
end
ts=linspace(0,4,401);
ys=ts-1+2*exp(-ts);
plot(ts,ys,'b','LineWidth',2.5,'DisplayName','Solución exacta');
[tn,yn]=ode45(f,[0 4],1);
plot(tn,yn,'r.','DisplayName','ode45');
plot(0,1,'ko','MarkerFaceColor','k','DisplayName','PVI (0,1)');
grid on; xlim([-2 4]); ylim([-2 4]);
xlabel('t');ylabel('y');title('Campo, isoclinas y solución');
legend('Location','northwest');

%% 3. Euler: comparar tres tamaños de paso hasta t=2
figure('Name','C3: método de Euler'); hold on;
tex=linspace(0,2,401);
plot(tex,tex-1+2*exp(-tex),'k','LineWidth',2.4,...
    'DisplayName','Exacta');
pasos=[0.5 0.2 0.1];
for j=1:numel(pasos)
    h=pasos(j); N=round(2/h);
    te=(0:N)*h; ye=zeros(size(te)); ye(1)=1;
    for n=1:N
        ye(n+1)=ye(n)+h*f(te(n),ye(n));
    end
    plot(te,ye,'o-','DisplayName',sprintf('Euler h=%g',h));
    exacta_final=2-1+2*exp(-2);
    fprintf('C3 - Euler h=%g: error en t=2 = %.6f\n', ...
        h,abs(ye(end)-exacta_final));
end
grid on; xlabel('t');ylabel('y');legend('Location','best');
title('Convergencia visual del método de Euler');

%% 4. Análisis de equilibrios del modelo y'=y(1-y/3)
g=@(y) y.*(1-y/3);
yg=linspace(0,5,400);
figure('Name','C3: línea de fase');
plot(yg,g(yg),'LineWidth',2);hold on;
plot(yg,zeros(size(yg)),'k--');grid on;
xlabel('y');ylabel('f(y)');title('Equilibrios y*=0 y y*=3');
fprintf('C3 - f''(0)=1 (inestable); f''(3)=-1 (estable)\n');

%% ACTIVIDADES
% A1: cambie la condición inicial y0 a 0, 2 y 3.
% A2: dibuje isoclinas para pendientes -2 y 2.
% A3: programe Euler y registre errores frente a ode45.
% A4: explique el comportamiento cercano a los equilibrios.
