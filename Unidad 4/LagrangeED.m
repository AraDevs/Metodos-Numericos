%Metodo de Interpolacion por medio de Lagrange para ED

% Este metodo esta parchado para ser llamado por el metodo de resolucion de la ED,
% con esto se resolvera el valor para una ED aproximada en base a los valores
% de X (fila de valores T), Y (fila de valores Wi+1) y el valor a aproximar
% (el valor a aproximar en base a los resultados de T)

function [ValA] = LagrangeED(X,Y,aprox)

% Seccion de inicializacion
syms x
format long

% Interpolacion de Lagrange para ED
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
% Debido a que este modelo no coloca funcion real, no solicita
% valor real ni error en valores
disp('Polinomio de Lagrange resultante: ')
fprintf('\n');
pretty(Pol_Lag)
ValA = subs(Pol_Lag,aprox);