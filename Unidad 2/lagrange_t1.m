%Método de Interpolación por medio de Lagrange Versión 1
%1) Ingresar la función a evaluar junto con sus valores de evaluación
%2) Genera los valores de f(x) para cada uno de los valores ingresados
clear all
clc
syms x
%format long permite colocar los numeros con 15 decimales
%dicha cantidad es la mas ocupada en este tipo de ejercicios
format long
disp('Interpolacion de Lagrange V1')
g = input('Ingrese la función a evaluar: ');
X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
Y = zeros(n,n);
for i=1:n
	Y(i) = subs(g,X(i));	
end

num=1;
den=1;
for i=1:n
	if(i==1)
		%(x - x0)
		num = num*(x - X(2));
		%(x0 - x1)
		den = den*(X(1) - X(2));
		L(i) = num/den;
		pretty(L(i))
		fprintf('\n');
	else
		%prod from {i=1} to {n} (x - x_i)
		num=num*(x - X(i));
        %prod from {i=1} to {n} (x_{i-1} - x_i)
		den=den*(X(i-1) - X(i));
		L(i) = num/den;
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
APol1 = subs(g,aprox)
error = abs(APol1-APol);
error = error * 100
