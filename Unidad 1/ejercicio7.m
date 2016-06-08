% Seccion de inicializacion
clear all
clc
format long
syms V
disp('Ejercicio 7 Guia 1 MEN')

%Sección de introducción de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0 
% valor del solve: 9.192594675047820e-05
% Sección de valores iniciales para operación
T1 = 114.53; T = (T1 - 32)*(5/9) + 273.15;
Pc = 3390e3;
Tc = 126.2;
P = 1025e3;
R = 0.2968;
a = (27*(R*Tc)^2)/(64*Pc);
b = (R*Tc)/(8*Pc);

% Sección de datos finales a manejar
g = (P + a/(V^2))*(V - b) - R*T;
po = R*T/P;
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