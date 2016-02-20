%Metodo de Interpolacion por medio de Lagrange Version 2
%1) Ingresar los valores de X dados en alguna tabla en particular
%2) Ingresar los valores de Y respectivos de la misma tabla
clear all
clc
syms x
%format long permite colocar los numeros con 15 decimales
%dicha cantidad es la mas ocupada en este tipo de ejercicios
format long
disp('Interpolacion de Lagrange V2')
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

for i=1:n
	if(i==1)
		L(i) = ((x - X(2))/(X(1) - X(2)))
		pretty(L(i))
		fprintf('\n');
	else
		L(i) = ((x - X(i))/(X(i-1) - X(i)))
		pretty(L(i))
		fprintf('\n');
	end	
end

init = 0;
for i=1:n
    FPol = init + Y(i)*L(i);
    init = FPol;
end
FPol;
APol = subs(FPol,aprox);
APol
