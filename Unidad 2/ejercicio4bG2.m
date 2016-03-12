% Seccion de inicializacion
clear all
clc
syms x
format long

disp('Guia 2 MEN Ejercicio 4b')
X = [0.2,0.4,0.6,0.8,1.0,1.2]
Y = [1.1787359,1.3104793,1.3899781,1.4140628,1.3817733,1.2943968]
aprox = 1.227

% Valor aproximado por interpolacion lineal modo extrapolacion
fprintf('\n');
ValL = interp1(X,Y,aprox,'linear','extrap');
fprintf('El valor aproximado por interpolacion lineal es: %2.15f \n', ValL)

% Valor aproximado por interpolacion escalonada modo extrapolacion
fprintf('\n');
ValE = interp1(X,Y,aprox,'spline', 'extrap');
fprintf('El valor aproximado por interpolacion escalonada es: %2.15f \n', ValE)