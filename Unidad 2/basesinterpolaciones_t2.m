%Metodo de Interpolacion por medio de (metodo) Version 2

% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar los valores de evaluación en formato vector
%2) Ingresar los valores resultantes en formato vector
%3) Ingresar el valor a aproximar
%disp('Interpolacion de (metodo) V2')
X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
Y = input('Ingrese los valores de y en formato [y0,y1,y2,...,yn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(n,n);
MPol(:,1) = Y'
for i=1:n
	Y(i) = MPol(i);
end