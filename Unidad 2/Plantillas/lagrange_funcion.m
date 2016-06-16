%Metodo de Interpolacion por Lagrange para funcion

% Seccion de inicializacion
clear all
clc
syms x
format long
disp('Metodo de Interpolacion por Lagrange para funcion')

% Seccion de introduccion de datos de trabajo
%1) Ingresar la funcion a evaluar para obtener los valores generados
%2) Ingresar los valores de evaluacion en formato vector
%3) Ingresar el valor a aproximar
%4) Se obtienen la cantidad de puntos para empezar a crear el polinomio
g = input('Ingrese la funcion a evaluar: ');
X = input('Ingrese los valores de x en formato [x0,x1,x2,...,xn]: ');
Y = subs(g,X);
aprox = input('Ingrese el valor a aproximar: ');
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
	
	L(k) = num/den
	pause
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

% Evaluacion del valor aproximado en la funcion real
fprintf('\n');,
ValR = subs(g,aprox);
fprintf('El valor exacto de la funcion es: %2.15f \n\n', ValR);

% Error de aproximacion
tol = abs(ValA - ValR);
fprintf('El error de aproximacion es: %e \n', tol);
