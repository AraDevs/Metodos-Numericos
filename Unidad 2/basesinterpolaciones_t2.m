%Metodo de Interpolacion por medio de (metodo) Versión 2
%1) Ingresar los valores de X dados en alguna tabla en particular
%2) Ingresar los valores de Y respectivos de la misma tabla
clear all
clc
syms x
%format long permite colocar los numeros con 15 decimales
%dicha cantidad es la mas ocupada en este tipo de ejercicios
format long
disp('Interpolacion de Neville V2')
X = input('Ingrese los valores de X en formato [x0,x1,x2,...,xn]: ');
Y = input('Ingrese los valores de Y en formato [y0,y1,y2,...,yn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(n,n);
MPol(:,1) = Y'
for i=1:n
	Y(i) = MPol(i);
end

%for i=2:n
%	for j=1:n
%		Y(j,i) = 
%	end
%end
