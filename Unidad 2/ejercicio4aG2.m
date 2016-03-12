% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar los valores de evaluación en formato vector
%2) Ingresar los valores resultantes en formato vector
%3) Ingresar el valor a aproximar
disp('Guia 2 MEN Ejercicio 4a')
%X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
X = [0.2,0.4,0.6,0.8,1.0,1.2]
%Y = input('Ingrese los valores de y en formato [y0,y1,y2,...,yn]: ');
Y = [1.1787359,1.3104793,1.3899781,1.4140628,1.3817733,1.2943968]
%aprox = input('Ingrese el valor a aproximar: ');
aprox = 0.935
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
	L(i) = num/den
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

% Valor aproximado por interpolacion cubica
ValC = interp1(X,Y,aprox,'cubic');
fprintf('El valor aproximado por interpolacion cubica es: %2.15f \n\n', ValC);