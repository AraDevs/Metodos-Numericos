% Sección de inicialización
clear all
clc
format long
syms x
disp('Metodo de la Secante')

% Sección de introducción de datos de trabajo
g = input('introduzca la función g: ');
po = input('Introduzca el valor inicial 1: ');
p1 = input('Introduzca el valor inicial 2: ');
delta = input('Introduzca el valor del error: ');

% Sección de evaluaciones del método (1/2)
a1 = subs(g,p1);
a2 = subs(g,po);
pk = p1 - a1*(p1-po)/(a1 - a2);
cont = 1;
tol = abs(subs(g,pk));

% Mostrar los valores solicitados en pantalla
disp('n		p0		p1 		p2 		error')
fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f 		%e\n', cont, po,p1,pk,tol);

% Sección de corrida del método explicado (2/2)
while(abs(pk-p1) > delta)
	cont = cont + 1;
	po = p1;
	p1 = pk;

	pk = p1 - a1*(p1-po)/(a1 - a2);
	tol = abs(pk-p1);
	fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f 		%e\n', cont, po,p1,pk,tol);
end

% Mostrar respuesta en pantalla
fprintf('El valor aproximado de x es: %2.15f\n', pk);
