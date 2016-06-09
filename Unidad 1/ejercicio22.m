% Seccion de inicializacion
clear all
clc
format long
syms h
disp('Ejercicio 22 Guia 1 MEN')

%Sección de introducción de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
% valor del solve: 0.80337830650421249093240210645812
V = 9; R = 2; L = 5;

%g = (R^2*acos((R - h)/R) - (R - h)*(2*R*h - h^2)^(1/2))*L - V;
g = (R^2*acos((R - h)/R) - (R - h)*(2*R*h - h^2)^(1/2))*L - V;
po = 0.803;
error = 1e-12;

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