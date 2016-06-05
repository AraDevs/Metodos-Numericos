% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Metodo de la Posicion falsa')

% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
g = input('introduzca la funcion g: ');
po = input('Introduzca el valor inicial 1: ');
p1 = input('Introduzca el valor inicial 2: ');
delta = input('Introduzca el valor del error: ');

% Seccion de evaluaciones del metodo (1/2)
a1 = subs(g,p1);
a2 = subs(g,po);

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
if(a1*a2<0)
	pk = p1 - a1*(p1-po)/(a1 - a2);
	a3 = subs(g,pk);
	cont = 1;
	tol = abs(a3);

	disp('n		p0		p1 		p2 		error')
	fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f 		%e\n', cont, po,p1,pk,tol);

	while(abs(pk-p1) > delta)
	cont = cont + 1;

	if(a1*a3 < 0)
		po = p1;
		p1 = pk;
		pk = p1 - a1*(p1-po)/(a1 - a2);
		tol = abs(pk-p1);
	else
		po = po;
		p1 = pk;
		pk = p1 - a1*(p1-po)/(a1 - a2);
		tol = abs(pk-p1);
	end

	a3 = subs(g,pk);	
	fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f 		%e\n', cont, po,p1,pk,tol);
	end
end

% Mostrar respuesta en pantalla
fprintf('El valor aproximado de x es: %2.15f\n', pk);
