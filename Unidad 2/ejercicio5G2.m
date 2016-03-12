% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar la funcion a evaluar 
%2) Ingresar los valores de evaluación en formato vector
%3) Ingresar el valor a aproximar
%4) Genera los valores de f(x) para cada uno de los valores del vector
disp('Guia 2 MEN Ejercicio 5')
g = (log(12 - 5*x^2))/log (18)
X = [-1.2,-1.1,-0.92,-0.55,-0.42,-0.40,-0.38,-0.31]
aprox = -0.458
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

% Evaluacion del valor aproximado en la funcion real
fprintf('\n');,
ValR = subs(g,aprox);
fprintf('El valor exacto de la funcion es: %2.15f \n\n', ValR);

% Valor aproximado por interpolacion cubica
fprintf('\n');
ValC = interp1(X,Y,aprox,'cubic');
fprintf('El valor aproximado por interpolacion cubica es: %2.15f \n\n', ValC);

% Valor aproximado por interpolacion escalonada
fprintf('\n');
ValE = interp1(X,Y,aprox,'spline');
fprintf('El valor aproximado por interpolacion escalonada es: %2.15f \n\n', ValE)

% Error de aproximacion
tol = abs(ValA - ValR);
fprintf('El error de aproximacion es: %e \n', tol);
