%Metodo de Interpolacion por medio de Diferencias Divididas para ED

% Este metodo esta parchado para ser llamado por el metodo de resolucion de la ED,
% con esto se resolvera el valor para una ED aproximada en base a los valores
% de X (fila de valores T), Y (fila de valores Wi+1) y el valor a aproximar
% (el valor a aproximar en base a los resultados de T)

function [ValA] = DifDividED(X,Y,aprox)

% Seccion de inicializacion
syms x
format long

% Interpolacion de Diferencias Divididas para ED
m = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
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
    Pol_DD = init + MPol(i,i)*PPol; %Factor de suma
    init = Pol_DD;
end

% Polinomio de Diferencias Divididas y valor aproximado
disp('Polinomio de Diferencias resultante: ')
fprintf('\n');
pretty(Pol_DD) 
ValA = subs(Pol_DD,aprox);
