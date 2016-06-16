%Metodo de Interpolacion por Lagrange con valores

% Seccion de inicializacion
clear all
clc
syms x
format long
disp('Ejercicio 4b Guia 2 MEN')

% Seccion de introduccion de datos de trabajo
X = [0.2,0.4,0.6,0.8,1.0,1.2];
Y = [1.1787359,1.3104793,1.3899781,1.4140628,1.3817733,1.2943968];
aprox = 1.214;

ValA1 = interp1(X,Y,aprox,'linear','extrap');
fprintf('\n');
fprintf('El valor aproximado mediante interpolacion lineal es: %2.15f \n\n', ValA1);

% Valor aproximado mediante interpolacion cubica
ValA2 = interp1(X,Y,aprox,'spline','extrap');
fprintf('\n');
fprintf('El valor aproximado mediante interpolacion escalonada es: %2.15f \n\n', ValA2);