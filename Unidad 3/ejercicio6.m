% Ejercicio 6 Guia 3 MEN

clear all
clc
format long
syms x

disp('Ejercicio 6 Guia 3 MEN')
g = sqrt(81 - x.^2)./(x.^2);
a = 2.5;b = 3.5;
X = linspace(a,b);
Y = subs(g,X);

disp('Valor aproximado de la integral mediante trapz')
VA1 = trapz(X,Y)

disp('Valor aproximado de la integral mediante quadl')
VA2 = quadl(@e6g3,a,b)

disp('Valor real de la integral mediante int')
VR1 = double(int(g,a,b))