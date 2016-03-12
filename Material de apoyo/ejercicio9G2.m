% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar los valores de evaluación en formato vector
%2) Ingresar los valores resultantes en formato vector
%3) Ingresar el valor a aproximar
disp('Guia 2 MEN Ejercicio 9')
X = [60,65,70,75,80,85,90]
Y = [0.95e-4,1.06e-4,1.2e-4,1.35e-4,1.54e-4,1.78e-4,2.06e-4]
aprox1 = -318.37; %temperatura en ºF
aprox = ((aprox1 - 32)*(5/9)) + 273.15
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(n,n);
MPol(:,1) = Y';

% Se trabajaran los valores de numerador y denominador por aparte,
% posteriormente se uniran estos valores para obtener el resultado
for i=2:n
	for j=i:n
		% num = (x - X(j-1))*Q(j-1,i-1) - (x - X(j))*Q(j,i-1)
		num = (aprox - X(j-1))*MPol(j-1,i-1) - (aprox - X(j))*MPol(j,i-1);
		% den = (X(j) - X(j-i+1))
		den = X(j) - X(j-i+1);
		MPol(j,i) = num/den

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

% Valor aproximado por interpolacion escalonada
fprintf('\n');
ValE = interp1(X,Y,aprox,'spline');
fprintf('El valor aproximado por interpolacion escalonada es: %2.15f \n\n', ValE);

tol = abs(ValA - ValE);
fprintf('El error aproximado es: %e \n\n', tol);