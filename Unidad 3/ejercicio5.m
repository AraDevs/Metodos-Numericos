% Ejercicio 5 Guia 3 MEN
clear all
clc
format long
syms x

disp('Ejercicio 5 Guia 3 MEN')
g = exp(x)*cos(5*x);
a = 0.01;b = 0.03;
X = linspace(0.01,0.03);
Y = subs(g,X);

disp('Valor aproximado de la integral mediante trapz')
VA1 = trapz(X,Y)

disp('Valor aproximado de la integral mediante quadgk')
VA2 = quadgk(@e5g3,a,b)

disp('Valor real de la integral mediante int')
VR1 = double(int(g,a,b))