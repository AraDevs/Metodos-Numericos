%Método de Interpolación por medio de Neville Versión 2
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

for i=2:n
	for j=i:n
		MPol(j,i) = (aprox - X(j-1))*MPol(j-1,i-1) - (aprox - X(j))*MPol(j,i-1);
		MPol(j,i) = MPol(j,i)/(X(j) - X(j-i+1))
	end
end

R = MPol(n,n);
fprintf('\n');,
fprintf('El valor aproximado de la función es: %2.15f \n\n', R);

%real = subs(g,aprox);
%fprintf('El valor exacto de la función es: %2.15f \n\n', real);

%raprox = abs(R - real);
%fprintf('El error de aproximación es: %e \n', raprox);
