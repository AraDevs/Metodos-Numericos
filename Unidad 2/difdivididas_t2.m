%Método de Interpolación por medio de Diferencias Divididas Versión 2
%1) Ingresar los valores de X dados en alguna tabla en particular
%2) Ingresar los valores de Y respectivos de la misma tabla
clear all
clc
syms x
%format long permite colocar los numeros con 15 decimales
%dicha cantidad es la mas ocupada en este tipo de ejercicios
format long
disp('Interpolacion por Diferencias Divididas V2')
X = input('Ingrese los valores de X en formato [x0,x1,x2,...,xn]: ');
Y = input('Ingrese los valores de Y en formato [y0,y1,y2,...,yn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(n,n);
MPol(:,1) = Y'

for i=2:n
	for j=i:n
		MPol(j,i) = MPol(j,i-1) - MPol(j-1,i-1);
		MPol(j,i) = (MPol(j,i))/(X(j) - X(j-i+1))
	end
end

init = 0;
PPol = 1;
for i=1:n
	PPol = PPol*(x - X(i)); %Factor de multiplicacion
    FPol = init + MPol(i,i)*PPol; %Factor de suma
    init = FPol;
end

pretty(FPol);
R = subs(FPol,aprox)
fprintf('\n');,
fprintf('El valor aproximado de la función es: %2.15f \n\n', R);

%real = subs(g,aprox);
%fprintf('El valor exacto de la función es: %2.15f \n\n', real);

%raprox = abs(R - real);
%fprintf('El error de aproximación es: %e \n', raprox);
