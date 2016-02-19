% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Metodo de Steffensen')

% Sección de introducción de datos de trabajo
po = input('Introduzca el valor P0: ');
g = input('Introduzca la función: ');
error = input('Introduzca el valor de precisión: ');

% Sección de evaluaciones del método (1/2)
p1 = subs(g,po);
p2 = subs(g,p1);
P = po - (p1 - po)^2/(p2 + 2*p1 + po);
tol = abs(P - po);
cont = 1;

% Mostrar los valores solicitados en pantalla
disp('n		P0		P1 		P2 		P		error')
fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f		%2.15f 		%e\n', cont, po,p1,p2,P,tol);

% Sección de corrida del método explicado (2/2)
while(abs(P - po) > error)
	cont = cont + 1;
	po = P;
	p1 = subs(g,po);
	p2 = subs(g,p1);
	P = po - (p1 - po)^2/(p2 + 2*p1 + po);
	tol = abs(P - po);

	fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f		%2.15f 		%e\n', cont, po,p1,p2,P,tol);
end

% Mostrar respuesta en pantalla
fprintf('El valor aproximado de x es: %2.15f\n', P);
