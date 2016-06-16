%Metodo de Interpolacion por Lagrange con valores

% Seccion de inicializacion
clear all
clc
syms x
format long
disp('Ejercicio 4a Guia 2 MEN')

% Seccion de introduccion de datos de trabajo
%1) Ingresar los valores generados en formato vector
%2) Ingresar los valores de evaluacion en formato vector
%3) Ingresar el valor a aproximar
%4) Se obtienen la cantidad de puntos para empezar a crear el polinomio
%5) Se obtienen la cantidad de puntos para empezar a crear el polinomio
X = [0.2,0.4,0.6,0.8,1.0,1.2];
Y = [1.1787359,1.3104793,1.3899781,1.4140628,1.3817733,1.2943968];
aprox = 0.585;
m = length(X);

% matriz(filas,columnas)
% matriz(arriba/abajo, derecha/izquierda)

% Se inicializan valores de numerador y denominador a 1,
% esto permite aplicar el factor producto de Lagrange
num=1;
den=1;

% Primera iteracion (k) sirve para definir el polinomio de Lagrange
% Segunda iteracion (n) sirve para armar los terminos del polinomio
% Al finalizar el "for" externo, se vuelven a inicializar los valores
% del denominador y numerador para crear nuevamente los polinomios
for k=1:m
	% Datos del numerador
	for n=1:m
		if k==n
			% No se realizan productos ni polinomios, de lo contrario
			% terminaria con un valor 0 en el denominador
		else
			num=num*(x - X(n));
			den=den*(X(k) - X(n));
		end
	end
	
	L(k) = num/den;
	num=1;den=1;
end

% Se inicializa el valor del polinomio aproximado a 0,
% esto permite aplicar el factor suma del polinomio de Lagrange
init = 0;
for k=1:m
    Pol_Lag = init + Y(k)*L(k);
    init = Pol_Lag;
end

% Polinomio de Lagrange y valor aproximado
disp('Polinomio de Lagrange resultante: ')
fprintf('\n');
pretty(Pol_Lag)
ValA = subs(Pol_Lag,aprox);
fprintf('El valor aproximado de la funcion es: %2.15f \n\n', ValA);

% Valor aproximado mediante interpolacion cubica
ValA1 = interp1(X,Y,aprox,'cubic');
fprintf('\n');
fprintf('El valor aproximado mediante interpolacion cubica es: %2.15f \n\n', ValA1);