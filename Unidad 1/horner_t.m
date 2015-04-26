% Sección de inicialización
clear all
clc
format long
syms x
disp('Metodo de Horner')

% Sección de introducción de datos de trabajo
xo = input('Introduzca el valor X0: ');
g = input('Introduzca el polinomio a evaluar: ');
error = input('Introduzca el valor del error: ');

% Sección de evaluaciones del método (1/2)
A = sym2poly(g);
n = length(A);
B = zeros(size(A));
C = zeros(size(A));

% matriz(filas,columnas)
% matriz(arriba/abajo, derecha/izquierda)
cont = 1;

for i=1:n
	if(i==1)
		B(i) = A(i);
	else
		B(i) = B(i-1)*xo + A(i);
	end
end
bop = B(n);

for i=1:n-1
	if(i==1)
		C(i) = B(i);
	else
		C(i) = C(i-1)*xo + B(i);
	end
end
boq = C(n-1);

x = xo - bop/boq;

tol = abs(x-xo);
disp('n			x0		x	error')
fprintf('%3.0f	%2.15f	%2.15f	%e\n', cont,xo,x,tol)

% Sección de evaluaciones del método (2/2)
while(tol > error)
	
	cont = cont+1;
	xo = x;
	n = length(A);
	A = sym2poly(g);
	B = zeros(size(A));
	C = zeros(size(A));

	for i=1:n
		if(i==1)
			B(i) = A(i);
		else
			B(i) = B(i-1)*xo + A(i);
		end
	end
	bop = B(n);

	for i=1:n-1
		if(i==1)
			C(i) = B(i);
		else
			C(i) = C(i-1)*xo + B(i);
		end
	end
	boq = C(n-1);

	x = xo - bop/boq;
	tol = abs(x - xo);
	fprintf('%3.0f	%2.15f	%2.15f	%e\n', cont,xo,x,tol)
end


