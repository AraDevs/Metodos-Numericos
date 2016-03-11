% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar los valores de evaluación en formato vector
%2) Ingresar los valores resultantes en formato vector
%3) Ingresar el valor a aproximar
disp('Guia 2 MEN Ejercicio 3')
%X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
X = [0.3,0.5,0.7,0.9,1.1,1.3]
%Y = input('Ingrese los valores de y en formato [y0,y1,y2,...,yn]: ');
Y = [-1.1733264,-0.6045824,-0.1716328,0.2312373,0.6753699,1.2815177]
%aprox = input('Ingrese el valor a aproximar: ');
aprox = 0.935
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

% Valor aproximado por interpolacion cubica
ValC = interp1(X,Y,aprox,'cubic');
fprintf('\n');
fprintf('El valor aproximado por interpolacion cubica es: %2.15f\n\n', ValC);