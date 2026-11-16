%% CAPÍTULO 6 | SUSTITUCIONES Y ECUACIONES EXACTAS
% UCACUE | Matemática Avanzada | Ingeniería Civil
% Homogéneas, Bernoulli y exactas, sin Symbolic Math Toolbox.
clc; close all; clearvars;

%% 1. Homogénea: y'=1+y/x; y(1)=2; x>0
% u=y/x -> u'=1/x -> y=x*(log(x)+2).
x=linspace(0.25,4,400);yh=x.*(log(x)+2);
[xn,yn]=ode45(@(x,y)1+y/x,[1 4],2);
figure('Name','C6: ecuación homogénea');
plot(x,yh,'b','LineWidth',2);hold on;plot(xn,yn,'r.');
plot(1,2,'ko','MarkerFaceColor','k');grid on;
xlabel('x>0');ylabel('y');title('Cambio de variable u=y/x');
legend('Exacta','ode45','(1,2)','Location','best');

%% 2. Bernoulli: y'+y=y^2; y(0)=1/2
% z=1/y => z'-z=-1; y=1/(1+exp(t)).
t=linspace(0,6,400);yb=1./(1+exp(t));
[tn,ybn]=ode45(@(t,y)y.^2-y,[0 6],0.5);
figure('Name','C6: Bernoulli');
plot(t,yb,'b','LineWidth',2);hold on;plot(tn,ybn,'r.');
grid on;xlabel('t');ylabel('y');title('Bernoulli: z=1/y');
legend('Exacta','ode45','Location','northeast');

%% 3. Ecuación exacta: M dx + N dy = 0
% M=2xy+2x y N=x^2+2y.
% dM/dy=2x y dN/dx=2x (mismo valor).
% Potencial F=x^2*y+x^2+y^2, con F(1,1)=3.
[X,Y]=meshgrid(linspace(-2.6,2.6,500),linspace(-2.6,2.6,500));
F=X.^2.*Y+X.^2+Y.^2;
figure('Name','C6: curvas de nivel');
contour(X,Y,F,[-2 0 1 3 5 8],'LineWidth',1.2);hold on;
contour(X,Y,F,[3 3],'k','LineWidth',2.6);
plot(1,1,'ro','MarkerFaceColor','r');grid on;axis equal;
xlabel('x');ylabel('y');title('F(x,y)=x^2*y+x^2+y^2');
fprintf('C6 - Comprobación de exactitud en x=1.5: %.2f y %.2f\n', ...
    2*1.5,2*1.5);
fprintf('C6 - F(1,1)=%.2f\n',1+1+1);

%% 4. Errores numéricos asociados con las verificaciones
err1=max(abs((log(x)+3)-(1+yh./x)));
err2=max(abs((-exp(t)./(1+exp(t)).^2)+yb-yb.^2));
fprintf('C6 - Residuo máximo homogénea: %.3e\n',err1);
fprintf('C6 - Residuo máximo Bernoulli: %.3e\n',err2);

%% ACTIVIDADES
% A1: construya un diagrama para reconocer el tipo de EDO.
% A2: identifique el dominio x>0 y el efecto de acercarse a cero.
% A3: elija una curva de nivel distinta F(x,y)=C.
% A4: verifique M_y=N_x y compare con ecuaciones no exactas.
