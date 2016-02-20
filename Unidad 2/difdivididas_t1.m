%Metodo de Interpolacion por medio de Diferencias Divididas Version 1
%1) Ingresar la función a evaluar junto con sus valores de evaluacion
%2) Genera los valores de f(x) para cada uno de los valores ingresados
clear all
clc
syms x
%format long permite colocar los numeros con 15 decimales
%dicha cantidad es la mas ocupada en este tipo de ejercicios
format long
disp('Interpolacion por Diferencias Divididas V1')
g = input('Ingrese la funcion a evaluar: ');
X = input('Ingrese los valores de X en formato [x0,x1,x2,...,xn]: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
MPol = zeros(n,n);
for i=1:n
	MPol(1,i) = subs(g,X(i));	
end

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
fprintf('El valor aproximado de la funcion es: %2.15f \n\n', R);

fprintf('\n');,
real = subs(g,aprox);
fprintf('El valor exacto de la funcion es: %2.15f \n\n', real);

raprox = abs(R - real);
fprintf('El error de aproximacion es: %e \n', raprox);
