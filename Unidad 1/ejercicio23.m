% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Ejercicio 23 Guia 1 MEN')

% Seccion de inicialización de variables de trabajo
e = 8.85e-12;
a = 50/100;
q = 20e-6;
Q = 30e-6;
F = 2.5;

% Sección de datos iniciales del ejercicio
% valor aproximado del solve: 1.330446734811017
po = 1.330445318453;
g = ((4*pi*F*e)*(x^2 + a^2)^(3/2))/(q*Q);
error = 1e-12;
fprintf('\n')

% Sección de evaluaciones del metodo (1/2)
p1 = subs(g,po);
p2 = subs(g,p1);
P = po - (p1 - po)^2/(p2 + 2*p1 + po);
tol = abs(P - po);
cont = 1;

% Mostrar los valores solicitados en pantalla
disp('n		x0		x1 		x2 		x		error')
fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %2.15f \t %e\n', cont, po,p1,p2,P,tol);

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
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
fprintf('\n')
fprintf('El valor aproximado de la distancia x es: %2.15f\n', P);
