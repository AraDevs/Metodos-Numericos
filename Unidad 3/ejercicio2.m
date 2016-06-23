% Ejercicio 2 Guia 3 Matlab
clear all
clc
syms x
format long

disp('Ejercicio 2 Guia 3 MEN')
g = x.*tan(x) + (x.^2).*cos(x);
G = diff(g);
X = [2.1,2.4,3.1,3.6,4.4];
Y = [-5.8170491,-6.4458221,-9.7307004,-9.8455088,7.6738603];

disp('Valor aproximado de la primera derivada')
derA1 = diff(Y)./diff(X)

disp('Valor exacto de la primera derivada')
derR1 = subs(G,X(1:end-1))

disp('Valor aproximado de la segunda derivada')
derA2 = diff(derA1)./diff(X(1:end-1))

disp('Error de aproximacion de primera derivada')
error=norm(derR1 - derA1,inf)