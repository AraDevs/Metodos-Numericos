%Metodo de Interpolacion por medio de Lagrange Version 1

% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar la funcion a evaluar 
%2) Ingresar los valores de evaluación en formato vector
%3) Ingresar el valor a aproximar
%4) Genera los valores de f(x) para cada uno de los valores del vector
disp('Interpolacion de Lagrange V1')
g = input('Ingrese la funcion a evaluar: ');
X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

for i=1:n
	Y(i) = subs(g,X(i));
end

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
end

% Se inicializa el valor del polinomio aproximado a 0,
% esto permite aplicar el factor suma del polinomio de Lagrange
init = 0;
for i=1:n
    Pol_Lag = init + Y(i)*L(i);
    init = Pol_Lag;
end

% Polinomio de Lagrange y valor aproximado
disp('Polinomio de Lagrange resultante: ')
fprintf('\n');
pretty(Pol_Lag)
ValA = subs(Pol_Lag,aprox);
fprintf('El valor aproximado de la funcion es: %2.15f \n\n', ValA);

% Evaluacion del valor aproximado en la funcion real
fprintf('\n');,
ValR = subs(g,aprox);
fprintf('El valor exacto de la funcion es: %2.15f \n\n', ValR);

tol = abs(ValA - ValR);
fprintf('El error de aproximacion es: %e \n', tol);