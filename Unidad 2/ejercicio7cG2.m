% Seccion de inicializacion
clear all
clc
syms x
format long

%1) Ingresar la funcion a evaluar 
%2) Ingresar los valores de evaluación en formato vector
%3) Ingresar el valor a aproximar
%4) Genera los valores de f(x) para cada uno de los valores del vector
disp('Guia 2 MEN Ejercicio 7c')
g = tan(pi*x/8);
pretty(g)
X = [-1.87,-1.63,-1.27,-0.89,-0.15,0.1,0.18,0.75,0.99]
aprox = 1.109
n = length(X);
Y = subs(g,X)

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(n,n);
for i=1:n
	MPol(i,1) = subs(g,X(i));	
end

% Se trabajaran los valores de numerador y denominador por aparte,
% posteriormente se uniran estos valores para obtener el resultado
for i=2:n
	for j=i:n
		% num = F[j,i-1] - F[j-1,i-1]
		num = MPol(j,i-1) - MPol(j-1,i-1);
		% den = X(j) - X(j-i+1)
		den = X(j) - X(j-i+1);
		MPol(j,i) = num/den

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

% Evaluacion del valor aproximado en la funcion real
fprintf('\n');,
ValR = subs(g,aprox);
fprintf('El valor exacto de la funcion es: %2.15f \n\n', ValR);

% Valor aproximado por interpolacion lineal
fprintf('\n');
ValL = interp1(X,Y,aprox,'linear','extrap');
fprintf('El valor aproximado por interpolacion lineal es: %2.15f \n\n', ValL);

% Valor aproximado por interpolacion cubica
fprintf('\n');
ValC = interp1(X,Y,aprox,'cubic','extrap');
fprintf('El valor aproximado por interpolacion cubica es: %2.15f \n\n', ValC);

% Error de aproximacion
tol = abs(ValA - ValR);
fprintf('El error de aproximacion es: %e \n', tol);