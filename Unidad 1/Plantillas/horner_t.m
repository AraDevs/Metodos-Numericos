% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Metodo de Horner')

% Sección de introduccion de datos de trabajo
xo = input('Introduzca el valor X0: ');
g = input('Introduzca el polinomio a evaluar: ');
error = input('Introduzca el valor del error: ');

% Sección de evaluaciones del metodo (1/2)
% sym2poly permite convertir un polinomio ingresado de forma simbólica a un
% vector con los coeficientes de dicho polinomio, esto sirve para realizar
% un proceso de división sintética usando matrices y vectores
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
fprintf('n \t\t x0 \t\t x \t\t error')
fprintf('%3.0f \t %2.15f \t %2.15f \t %e\n',cont,xo,x,tol)

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
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
	fprintf('%3.0f \t %2.15f \t %2.15f \t %e\n',cont,xo,x,tol)
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de x es: %2.15f\n', x)