%Metodo de Interpolacion por medio de (metodo) Version 1

% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar la funcion a evaluar 
%2) Ingresar los valores de evaluación en formato vector
%3) Ingresar el valor a aproximar
%4) Genera los valores de f(x) para cada uno de los valores del vector
%disp('Interpolacion de (metodo) V1')
g = input('Ingrese la funcion a evaluar: ');
X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
Y = zeros(n,n);
for i=1:n
	Y(i,1) = subs(g,X(i));	
end