% Ejercicio 3 Guia 3 Matlab
clear all
clc
syms x
format long

disp('Ejercicio 3 Guia 3 MEN')
g = 2*(((log(x))/(log(5))).^2) - cos(x);
G = diff(g,2);

X=[1.5,1.8,2.5,2.9,3.7,4.9];
Y=[0.0561999,0.4939623,1.4494020,1.8462337,2.1697548,1.7635922];

disp('Valor aproximado segunda derivada')
derA1 = diff(Y)./diff(X);
derA2 = diff(derA1)./diff(X(1:end-1))

disp('Valor exacto segunda derivada')
derR2 = subs(G,X(1:end-2))

disp('Error de aproximacion segundas derivadas')
error = norm(derR2 - derA2,inf);
fprintf('%e \n\n',error);

disp('Valor de la segunda derivada en cada valor')
derCR2 = subs(G,X)