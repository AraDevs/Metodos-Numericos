%Método de Interpolación por medio de Diferencias Divididas Versión 1
%1) Ingresar la función a evaluar junto con sus valores de evaluación
%2) Genera los valores de f(x) para cada uno de los valores ingresados
%3) Genera los valores de f'(x) para cada uno de los valores ingresados
clear all
clc
syms x
%format long permite colocar los numeros con 15 decimales
%dicha cantidad es la mas ocupada en este tipo de ejercicios
format long
disp('Interpolacion de Hermite mediante Diferencias Divididas V1')
g = input('Ingrese la función a evaluar: ');
X = input('Ingrese los valores de X en formato [x0,x1,x2,...,xn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);
np = 2*n; %se realizará una columna de tamaño doble
G = diff(g,x);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(np,np);

%En este método los valores se repiten 2 veces por cada columna
%Se asignarán los valores de la columna de la matriz normal a la matriz doble
for i=1:n
	%MPol(2*i) = Y(i);
	MPol(2*i) = subs(g,X(i));
	%MPol(2*i-1) = Y(i);
	MPol(2*i-1) = subs(g,X(i));
	
	Xm(2*i) = X(i);
	Xm(2*i-1) = X(i);
	
	%Ydm(2*i) = Yd(i);
	Ydm(2*i) = subs(G,X(i));
	%Ydm(2*i-1) = Yd(i);
	Ydm(2*i-1) = subs(G,X(i));
end

for i=2:np
	for j=i:np
		MPol(j,i) = MPol(j,i-1) - MPol(j-1,i-1);
		num = MPol(j,i);
		den = (Xm(j) - Xm(j-i+1));
		
		if(i==2 & den==0)
			MPol(j,i) = Ydm(j)
		else
			MPol(j,i) = num/den
		end
	end
end

init = 0;
PPol = 1;
for i=1:np-1
	PPol = PPol*(x - Xm(i)); %Factor de multiplicacion
    FPol = init + MPol(i,i)*PPol; %Factor de suma
    init = FPol;
end

pretty(FPol);
R = subs(FPol,aprox)
fprintf('\n');,
fprintf('El valor aproximado de la función es: %2.15f \n\n', R);

fprintf('\n');,
real = subs(g,aprox);
fprintf('El valor exacto de la función es: %2.15f \n\n', real);

raprox = abs(R - real);
fprintf('El error de aproximación es: %e \n', raprox);
