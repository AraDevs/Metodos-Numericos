% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar la funcion a evaluar 
%2) Ingresar los valores de evaluación en formato vector
%3) Ingresar el valor a aproximar
%4) Genera la derivada de la funcion ingresada
%5) La columna que genera es de tamaño doble ya que se duplican los valores ingresados
%6) Se asignaran los valores de la columna de la matriz normal a la matriz doble
disp('Guia 2 MEN Ejercicio 8a')
g =  -70 + 7*x + 70*exp(-x/10);
pretty(g)
X = [2.5,2.98,3.85,5.02,6.85,8.85,11.5,15.5,17.5]
aprox = 10.875
n = length(X);
G = diff(g,x);
Y = subs(g,X)

% Seccion de asignacion de valores
%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(2*n,2*n);
for i=1:n
	% Asignacion de valores evaluados en la funcion
	MPol(2*i) = subs(g,X(i));
	MPol(2*i-1) = subs(g,X(i));
	
	% Conversion del vector x en formato doble
	Xm(2*i) = X(i);
	Xm(2*i-1) = X(i);
	
	% Asignacion de valores evaluados en la derivada
	Z(2*i) = subs(G,X(i));
	Z(2*i-1) = subs(G,X(i));
end

% Se trabajaran los valores de numerador y denominador por aparte,
% posteriormente se uniran estos valores para obtener el resultado
for i=2:2*n
	for j=i:2*n
		%num = F[j,i-1] - F[j-1,i-1]
		num = MPol(j,i-1) - MPol(j-1,i-1);
		%den = X(j) - X(j-i+1)
		den = Xm(j) - Xm(j-i+1);
		
		% El valor de la derivada solo debe aparecer en la 1a corrida,
		% a partir de la 2a corrida en adelante esta no debe estar presente
		if(i==2 & den==0)
			MPol(j,i) = Z(j)
		else
			MPol(j,i) = num/den
		end

		% Codigo patch para mostrar las formulas en cada iteracion
		% sprintf permite mostrar el codigo en formato similar a como se escribiria a mano,
		% solo que en este caso no soporta la funcion pretty
		equ1 = 'F(%d,%d)=F(%d,%d) - F(%d,%d)/(x%d - x%d)';
		sprintf(equ1,j,i,j,i-1,j-1,i-1,j,j-i+1)
		equ2 = 'F(%d,%d)=%0.15f';
		sprintf(equ2,j,i,MPol(j,i))

	end
end

% Se inicializa el valor del polinomio aproximado a 0 y 1,
% esto permite aplicar los factores suma y producto
% del polinomio de Hermite que se genera
init = 0;
PPol = 1;
for i=1:(2*n-1)
	PPol = PPol*(x - Xm(i)); %Factor de multiplicacion
    Pol_Herm = init + MPol(i,i)*PPol; %Factor de suma
    init = Pol_Herm;
end

pretty(Pol_Herm) %Polinomio de Hermite por Diferencias

% Valor aproximado de la funcion
ValA = subs(Pol_Herm,aprox);
fprintf('\n');,
fprintf('El valor aproximado de la funcion es: %2.15f \n\n', ValA);

% Evaluacion del valor aproximado en la funcion real
fprintf('\n');,
ValR = subs(g,aprox);
fprintf('El valor exacto de la funcion es: %2.15f \n\n', ValR);

% Error de aproximacion
tol = abs(ValA - ValR);
fprintf('El error de aproximacion es: %e \n', tol);