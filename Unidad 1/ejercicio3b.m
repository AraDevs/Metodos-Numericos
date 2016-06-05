% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Ejercicio 3b Guia 1 MEN')

% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=x
% valor del solve: 17.203276380407487553932160126127
po = 17.20327615;
g = (36.585606272364359)/((18.125 - x) + (18.125 - x)^(1/4)) - x^(1/4);
error = 1e-12;

% Sección de evaluaciones del metodo (1/2)
p1 = subs(g,po);
p2 = subs(g,p1);
P = po - (p1 - po)^2/(p2 + 2*p1 + po);
tol = abs(P - po);
cont = 1;

% Mostrar los valores solicitados en pantalla
fprintf('n \t\t P0 \t\t P1 \t\t P2 \t\t P \t\t error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,po,p1,p2,P,tol);

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
while(abs(P - po) > error)
	cont = cont + 1;
	po = P;
	p1 = subs(g,po);
	p2 = subs(g,p1);
	P = po - (p1 - po)^2/(p2 + 2*p1 + po);
	tol = abs(P - po);

	fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,po,p1,p2,P,tol);
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de x es: %2.15f\n', P)