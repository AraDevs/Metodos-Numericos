% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Ejercicio 20 Guia 1 MEN')

% Sección de introduccion de datos de trabajo
xo = -5.5;
x1 = -5.2;
x2 = -4.5;
g = 3*x^5 + 11*x^4 - 21*x^3 - 10*x^2 + 21*x - 15;
error = 1e-12;

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
fprintf('n \t\t x0 \t\t x1 \t\t x2 \t\t x3 \t\t error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,xo,x1,x2,x3,tol)

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
while(abs(x3 - x2) > error)
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
	tol = abs(x3 - x2);

	fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,xo,x1,x2,x3,tol)
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de x es: %2.15f\n', x3)