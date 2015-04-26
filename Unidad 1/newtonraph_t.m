% Sección de inicialización
clear all
clc
format long
syms x
disp('Metodo de Newton Raphson')

%Sección de introducción de datos de trabajo
g = input('Introduzca la funcion a evaluar: ');
po = input('Ingrese el valor inicial: ');
error = input('Ingrese el valor del error: ');

% Sección de evaluaciones del método (1/2)
G = diff(g);
f1 = subs(g,po);
f2 = subs(G,po);
P = po - f1/f2;
cont = 1;
tol = abs(P);

% Mostrar los valores solicitados en pantalla
disp('n		P0			P1 			error')
fprintf('%3.0f	%2.15f 		%2.15f 		%e\n', cont, po,P,tol);

% Sección de corrida del método explicado (2/2)
while(abs(P - po) > error)
	cont = cont + 1;
	po = P;
	f1 = subs(g,po);
	f2 = subs(G,po);
	P = po - f1/f2;
	tol = abs(P - po);
	
	fprintf('%3.0f	%2.15f 		%2.15f 		%e\n', cont, po,P,tol);
end

% Mostrar respuesta en pantalla
fprintf('El valor aproximado de x es: %2.15f\n', P);
