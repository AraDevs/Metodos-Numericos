clear all
clc
syms x
format long

disp('Guia 2 MEN Ejercicio 8b')
g = -70 + 7*x + 70*exp(-x/10);
pretty(g)
X = [2.98,3.85,5.02,6.85,8.85,11.5,15.5,17.5]
Y = subs(g,X)
aprox = 17.835

% Valor real de la funcion
fprintf('\n');
ValR = subs(g,aprox);
fprintf('El valor exacto de la funcion es: %2.15f: \n\n', ValR)

% Valor aproximado por interpolacion escalonada
fprintf('\n');
ValE = interp1(X,Y,aprox,'spline','extrap');
fprintf('El valor aproximado por interpolacion escalonada es: %2.15f \n\n', ValE);

% Valor aproximado por interpolacion lineal
fprintf('\n');
ValL = interp1(X,Y,aprox,'linear','extrap');
fprintf('El valor aproximado por interpolacion lineal es: %2.15f \n\n', ValL);