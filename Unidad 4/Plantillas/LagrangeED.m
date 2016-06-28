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
m = length(X);

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
