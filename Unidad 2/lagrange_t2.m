%Metodo de Interpolacion por medio de Lagrange Version 2

% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar los valores de evaluación en formato vector
%2) Ingresar los valores resultantes en formato vector
%3) Ingresar el valor a aproximar
disp('Interpolacion de Lagrange V2')
X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
Y = input('Ingrese los valores de y en formato [y0,y1,y2,...,yn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

% Se inicializan valores de numerador y denominador a 1,
% esto permite aplicar el factor producto de Lagrange
num=1;
den=1;

for i=2:n
	%prod from {i=1} to {n} (x - x_i)
	num=num*(x - X(i));
    %prod from {i=1} to {n} (x_{i-1} - x_i)
	den=den*(X(i-1) - X(i));
	L(i) = num/den;
	%pretty(L(i))
	fprintf('\n');	
end

% Se inicializa el valor del polinomio aproximado a 0,
% esto permite aplicar el factor suma del polinomio de Lagrange
init = 0;
for i=1:n
    Pol_Lag = init + Y(i)*L(i);
    init = Pol_Lag;
end

% Polinomio de Lagrange y valor aproximado
% Debido a que este modelo no coloca funcion real, no solicita
% valor real ni error en valores
disp('Polinomio de Lagrange resultante: ')
fprintf('\n');
pretty(Pol_Lag)
ValA = subs(Pol_Lag,aprox);
fprintf('El valor aproximado de la funcion es: %2.15f \n\n', ValA);