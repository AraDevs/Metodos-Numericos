%Metodo de Interpolacion por Neville con valores

% Seccion de inicializacion
clear all
clc
syms x
format long
disp('Ejercicio 2b Guia 2 MEN')

% Seccion de introduccion de datos de trabajo
%1) Ingresar la funcion a evaluar para obtener los valores generados
%2) Ingresar los valores de evaluacion en formato vector
%3) Ingresar el valor a aproximar
%4) Se obtienen la cantidad de puntos para empezar a crear el polinomio
X = [0,3,5,8,13];
Y = [75,77,80,74,72];
aprox = 9.25;
m = length(X);

% Seccion de evaluacion de datos
%5) Se generan los valores iniciales del polinomio en base a cada valor de X
%6) Se genera un vector (llamado aquí MPol) para mostrar en pantalla y operar
% matriz(filas,columnas)
% matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(m,m);
for i=1:m
	MPol(i,1) = Y(i);	
end

% Seccion de corrida del metodo de interpolacion
% Se trabajaran los valores de numerador y denominador por aparte,
% posteriormente se uniran estos valores para obtener el resultado
for i=2:m
	for j=i:m
		% num = (x - X(j-1))*Q(j-1,i-1) - (x - X(j))*Q(j,i-1)
		% den = (X(j) - X(j-i+1))
		num = (aprox - X(j-1))*MPol(j,i-1) - (aprox - X(j))*MPol(j-1,i-1);
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

% Valor aproximado de la funcion generada por Neville
ValA = MPol(m,m);
fprintf('\n');,
fprintf('El valor aproximado de la funcion es: %2.15f \n\n', ValA);

% Valor aproximado mediante interpolacion escalonada
ValA1 = interp1(X,Y,aprox,'spline');
fprintf('\n');
fprintf('El valor aproximado mediante interpolacion escalonada es: %2.15f \n\n', ValA1);