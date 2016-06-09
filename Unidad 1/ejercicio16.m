% Seccion de inicializacion
clear all
clc
format long
syms T
disp('Ejercicio 16 Guia 1 MEN')

%Sección de introducción de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
% valor del solve: 
Ti1 = 132.85; Ti = Ti1 + 273.15; Q = 2950;
% g = 32.24*(T - Ti) + 0.001924*((T^2)/2 - (Ti^2)/2) + 1.055e-5*((T^3)/3 - (Ti^3)/3) - 3.596e-9*((T^4)/4 - (Ti^4)/4) - Q;
g = 32.24*(T - Ti) + 0.001924*((T^2)/2 - (Ti^2)/2) + 1.055e-5*((T^3)/3 - (Ti^3)/3) - 3.596e-9*((T^4)/4 - (Ti^4)/4) - Q;
po = 490.5227;
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