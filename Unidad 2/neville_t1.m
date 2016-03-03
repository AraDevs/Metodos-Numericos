%Metodo de Interpolacion por medio de Neville Version 1

% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar la funcion a evaluar 
%2) Ingresar los valores de evaluación en formato vector
%3) Ingresar el valor a aproximar
%4) Genera los valores de f(x) para cada uno de los valores del vector
disp('Interpolacion de Neville V1')
g = input('Ingrese la funcion a evaluar: ');
X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(n,n);
for i=1:n
	MPol(i,1) = subs(g,X(i));	
end

% Se trabajaran los valores de numerador y denominador por aparte,
% posteriormente se uniran estos valores para obtener el resultado
for i=2:n
	for j=i:n
		% num = (x - X(j-1))*Q(j-1,i-1) - (x - X(j))*Q(j,i-1)
		num = (aprox - X(j-1))*MPol(j-1,i-1) - (aprox - X(j))*MPol(j,i-1);
		% den = (X(j) - X(j-i+1))
		den = X(j) - X(j-i+1);
		MPol(j,i) = num/den;

		% Codigo patch para mostrar las formulas en cada iteracion
		% sprintf permite mostrar el codigo en formato similar a como se escribiria a mano,
		% solo que en este caso no soporta la funcion pretty
		equ1 = 'Q(%d,%d)=((x - x%d)Q(%d,%d) - (x - x%d)Q(%d,%d))/(x%d - x%d)';
		sprintf(equ1,j,i,j-1,j-1,i-1,j,j,i-1,j,j-i+1)
		equ2 = 'Q(%d,%d)=%0.15f';
		sprintf(equ2,j,i,MPol(j,i))
		
	end
end

% Valor aproximado de la funcion
ValA = MPol(n,n);
fprintf('\n');,
fprintf('El valor aproximado de la funcion es: %2.15f \n\n', ValA);

% Evaluacion del valor aproximado en la funcion real
fprintf('\n');,
ValR = subs(g,aprox);
fprintf('El valor exacto de la funcion es: %2.15f \n\n', ValR);

% Error de aproximacion
tol = abs(ValA - ValR);
fprintf('El error de aproximacion es: %e \n', tol);