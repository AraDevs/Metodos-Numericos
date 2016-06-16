% Seccion de inicializacion
clear all
clc
syms x
format long
disp('Ejercicio 2c Guia 2 MEN')

%1) X es vector tiempo 
%2) Y es vector distancia
%3) Z es vector velocidad
X = [0,3,5,8,13];
Y = [0,225,383,623,993];
Z = [75,77,80,74,72];
aprox = 13.45;

% Valor aproximado de velocidad y tiempo por interpolacion lineal
ValA1 = interp1(X,Z,aprox,'linear','extrap');
fprintf('\n');,
fprintf('El valor aproximado 1 mediante interpolacion lineal: %2.15f \n\n', ValA1);

% Valor aproximado de velocidad y tiempo por interpolacion cubica
ValA2 = interp1(X,Z,aprox,'cubic','extrap');
fprintf('\n');
fprintf('El valor aproximado 2 mediante interpolacion cubica es: %2.15f \n\n', ValA2)

% Valor aproximado de distancia y tiempo por interpolacion lineal
ValA3 = interp1(X,Y,aprox,'linear','extrap');
fprintf('\n');
fprintf('El valor aproximado 3 mediante interpolacion lineal es: %2.15f \n\n', ValA3)

% Valor aproximado de distancia y tiempo por interlacion cubica
ValA4 = interp1(X,Y,aprox,'cubic','extrap');
fprintf('\n')
fprintf('El valor aproximado 4 mediante interpolacion cubica es: %2.15f \n\n', ValA4)