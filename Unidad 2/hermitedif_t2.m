%Método de Interpolación por medio de Diferencias Divididas Versión 2
%1) Ingresar los valores de X dados en alguna tabla en particular
%2) Ingresar los valores de Y respectivos de la misma tabla
%3) Ingresar los valores de las derivadas otorgadas
clear all
clc
syms x
%format long permite colocar los numeros con 15 decimales
%dicha cantidad es la mas ocupada en este tipo de ejercicios
format long
disp('Interpolacion de Hermite mediante Diferencias Divididas V2')
X = input('Ingrese los valores de X en formato [x0,x1,x2,...,xn]: ');
Y = input('Ingrese los valores de Y en formato [y0,y1,y2,...,yn]: ');
Yd = input('Ingrese los valores de las derivadas en formato [yd0,yd1,yd2,...,ydn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);
np = 2*n; %se realizará una columna de tamaño doble

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(np,np);

%En este método los valores se repiten 2 veces por cada columna
%Se asignarán los valores de la columna de la matriz normal a la matriz doble
for i=1:n
	MPol(2*i) = Y(i);
	MPol(2*i-1) = Y(i);
	
	Xm(2*i) = X(i);
	Xm(2*i-1) = X(i);
	
	Ydm(2*i) = Yd(i);
	Ydm(2*i-1) = Yd(i);
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
%MPol = zeros(np,np)
%MPol(:,1) = Yr'

%for i=2:n
%	for j=i:n
%		MPol(j,i) = MPol(j,i-1) - MPol(j-1,i-1);
%		MPol(j,i) = (MPol(j,i))/(X(j) - X(j-i+1))
%	end
%end

%init = 0;
%PPol = 1;
%for i=1:n
%	PPol = PPol*(x - X(i)); %Factor de multiplicacion
%    FPol = init + MPol(i,i)*PPol; %Factor de suma
%    init = FPol;
%end

%pretty(FPol);
%R = subs(FPol,aprox)
%fprintf('\n');,
%fprintf('El valor aproximado de la función es: %2.15f \n\n', R);

%real = subs(g,aprox);
%fprintf('El valor exacto de la función es: %2.15f \n\n', real);

%raprox = abs(R - real);
%fprintf('El error de aproximación es: %e \n', raprox);
