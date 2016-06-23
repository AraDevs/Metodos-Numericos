% Ejercicio 1 Guia 3 Matlab
clear all
clc
syms x
format long

disp('Ejercicio 1 Guia 3 MEN')

X = [2.1,2.2,2.3,2.4,2.5,2.6]
fprintf('\n')
Y = [-1.709847,-1.373823,-1.119214,-0.916014,-0.747022,-0.601597]

disp('Primera derivada')
der1 = diff(Y)./diff(X)

disp('Segunda derivada')
der2 = diff(der1)./diff(X(1:end-1))