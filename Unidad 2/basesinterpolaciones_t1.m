%Metodo de Interpolacion por medio de (metodo) Version 1
%1) Ingresar la funcion a evaluar junto con sus valores de evaluacion
%2) Genera los valores de f(x) para cada uno de los valores ingresados
clear all
clc
syms x
%format long permite colocar los numeros con 15 decimales
%dicha cantidad es la mas ocupada en este tipo de ejercicios
format long
disp('Interpolacion de Neville V1')
g = input('Ingrese la funcion a evaluar: ');
X = input('Ingrese los valores de X en formato [x0,x1,x2,...,xn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
Y = zeros(n,n);
for i=1:n
	Y(i) = subs(g,X(i));	
end

Y
%for i=2:n
%	for j=i:n
%		Y(j,i) = 
%	end
%end
