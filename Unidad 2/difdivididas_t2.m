%Metodo de Interpolacion por medio de Diferencias Divididas Version 2

% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar los valores de evaluación en formato vector
%2) Ingresar los valores resultantes en formato vector
%3) Ingresar el valor a aproximar
disp('Interpolacion de Diferencias Divididas V2')
X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
Y = input('Ingrese los valores de y en formato [y0,y1,y2,...,yn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(n,n);
MPol(:,1) = Y'

% Se trabajaran los valores de numerador y denominador por aparte,
% posteriormente se uniran estos valores para obtener el resultado
for i=2:n
	for j=i:n
		% num = F[j,i-1] - F[j-1,i-1]
		num = MPol(j,i-1) - MPol(j-1,i-1);
		% den = X(j) - X(j-i+1)
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

% Se inicializa el valor del polinomio aproximado a 0 y 1,
% esto permite aplicar los factores suma y producto
% del polinomio de Diferencias que se genera
init = 0;
PPol = 1;
for i=1:n
	PPol = PPol*(x - X(i)); %Factor de multiplicacion
    Pol_Lag = init + MPol(i,i)*PPol; %Factor de suma
    init = Pol_Lag;
end
pretty(Pol_Lag) %Polinomio de Diferencias

% Valor aproximado de la funcion
ValA = subs(Pol_Lag,aprox);
fprintf('\n');,
fprintf('El valor aproximado de la funcion es: %2.15f \n\n', ValA);