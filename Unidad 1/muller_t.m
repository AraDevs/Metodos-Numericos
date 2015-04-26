% Sección de inicialización
clear all
clc
format long
syms x
disp('Metodo de Müller')

% Sección de introducción de datos de trabajo
xo = input('Introduzca el valor X0: ');
x1 = input('Introduzca el valor x1: ');
x2 = input('Introduzca el valor x2: ');
g = input('Introduzca el polinomio a evaluar: ');
error = input('Introduzca el valor del error: ');

% Sección de evaluaciones del método (1/2)
gxo = subs(g,xo);
gx1 = subs(g,x1);
gx2 = subs(g,x2);
cont = 1;

a = ((x1 - x2)*(gx1 - gx2) - (xo - x2)*(gx1 - gx2))/((xo - x2)*(x1 - x2)*(xo -x1));
b = (((xo - x2)^2)*(gx1 - gx2) - ((x1 - x2)^2)*(gxo - gx2))/((xo - x2)*(x1 - x2)*(xo -x1));
c = gx2;
sgn = 2*c/(b + sign(b)*(sqrt(b^2 - 4*a*c)));
x3 = x2 - sgn;
tol = abs(x3 - x2);

% Mostrar los valores en pantalla (1a iteración)
disp('n		x0		x1 		x2 		X3		error')
fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f		%2.15f 		%e\n', cont,xo,x1,x2,x3,tol);

% Sección de evaluaciones del método (2/2)
while(tol > error)
	cont =  cont + 1;
	x0 = x1;
	x1 = x2;
	x2 = x3;

	gxo = subs(g,xo);
	gx1 = subs(g,x1);
	gx2 = subs(g,x2);
	
	a = ((x1 - x2)*(gx1 - gx2) - (xo - x2)*(gx1 - gx2))/((xo - x2)*(x1 - x2)*(xo -x1));
	b = (((xo - x2)^2)*(gx1 - gx2) - ((x1 - x2)^2)*(gxo - gx2))/((xo - x2)*(x1 - x2)*(xo -x1));
	c = gx2;
	sgn = 2*c/(b + sign(b)*(sqrt(b^2 - 4*a*c)));
	x3 = x2 - sgn;
	tol = abs(x3-x2);

	disp('n		x0		x1 		x2 		X3		error')
	fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f		%2.15f 		%e\n', cont,xo,x1,x2,x3,tol);
end

% Mostrar respuesta en pantalla
fprintf('El valor aproximado de x es: %2.15f\n', x3);
