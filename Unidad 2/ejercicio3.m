%Metodo de Interpolacion por Diferencias Divididas para funcion

% Seccion de inicializacion
clear all
clc
syms x
format long
disp('Ejercicio 3 Guia 2 MEN')

% Seccion de introduccion de datos de trabajo
%1) Ingresar la funcion a evaluar para obtener los valores generados
%2) Ingresar los valores de evaluacion en formato vector
%3) Ingresar el valor a aproximar
%4) Se obtienen la cantidad de puntos para empezar a crear el polinomio
X = [0.3,0.4,0.6,0.8,1.0,1.2];
Y = [-1.1733264,-0.6045824,-0.1716328,0.2312373,0.6753699,1.2815177];
aprox = 0.875;
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
		% num = F[j,i-1] - F[j-1,i-1]
		% den = X(j) - X(j-i+1)
		num = MPol(j,i-1) - MPol(j-1,i-1);
		den = X(j) - X(j-i+1);
		MPol(j,i) = num/den;

		% Codigo patch para mostrar las formulas en cada iteracion
		% sprintf permite mostrar el codigo en formato similar a como se escribiria a mano,
		% solo que en este caso no soporta la funcion pretty
		equ1 = 'F(%d,%d)=F(%d,%d) - F(%d,%d))/(x%d - x%d)';
		sprintf(equ1,j,i,j,i-1,j-1,i-1,j,j-i+1)
		equ2 = 'F(%d,%d)=%0.15f';
		sprintf(equ2,j,i,MPol(j,i))

	end
end

% Se muestra la matriz de diferencias divididas finalizada
MPol

% Se inicializa el valor del polinomio aproximado a 0 y 1,
% esto permite aplicar los factores suma y producto
% del polinomio de Diferencias que se genera
init = 0;
PPol = 1;
for i=1:m
	PPol = PPol*(x - X(i)); %Factor de multiplicacion
    Pol_Lag = init + MPol(i,i)*PPol; %Factor de suma
    init = Pol_Lag;
end
pretty(Pol_Lag) %Polinomio de Diferencias

% Valor aproximado de la funcion
ValA = subs(Pol_Lag,aprox);
fprintf('\n');,
fprintf('El valor aproximado de la funcion es: %2.15f \n\n', ValA);

% Valor aproximado mediante interpolacion escalonada
ValA1 = interp1(X,Y,aprox,'spline');
fprintf('\n');
fprintf('El valor aproximado mediante interpolacion escalonada es: %2.15f \n\n', ValA1);