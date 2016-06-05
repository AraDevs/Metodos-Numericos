% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Metodo de Newton Raphson')

%Sección de introducción de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
g = input('Introduzca la funcion a evaluar: ');
po = input('Ingrese el valor inicial: ');
error = input('Ingrese el valor del error: ');

% Sección de evaluaciones del método (1/2)
G = diff(g);
f1 = subs(g,po);
f2 = subs(G,po);
P = po - f1/f2;
cont = 1;
tol = abs(P - po);

% Mostrar los valores solicitados en pantalla
fprintf('n \t\t P0 \t\t P1 \t\t error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %e\n', cont, po,P,tol)

% Sección de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
while(abs(P - po) > error)
	cont = cont + 1;
	po = P;
	f1 = subs(g,po);
	f2 = subs(G,po);
	P = po - f1/f2;
	tol = abs(P - po);
	
	fprintf('%3.0f \t %2.15f \t %2.15f \t %e\n', cont, po,P,tol)
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de x es: %2.15f\n', P)