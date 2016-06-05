% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Ejercicio 1 Guia 1 MEN')

% Sección de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
% valor del solve: 6.1249999999999999653278473434029
g = (log(17+5*x))/(log(15)) + x^2 - 38.942244725097574;
po = 6.120;
p1 = 6.124;
error = 1e-12;

% Sección de evaluaciones del metodo (1/2)
a1 = subs(g,p1);
a2 = subs(g,po);
pk = p1 - a1*(p1-po)/(a1 - a2);
cont = 1;
tol = abs(subs(g,pk));

% Mostrar los valores solicitados en pantalla
%disp('n		p0		p1 		p2 		error')
fprintf('n \t\t p0 \t\t\t p1 \t\t\t p2 \t\t   error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %e\n', cont, po,p1,pk,tol)

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
while(abs(pk-p1) > error)
	cont = cont + 1;
	po = p1;
	p1 = pk;

	pk = p1 - a1*(p1-po)/(a1 - a2);
	tol = abs(pk-p1);
	fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %e\n', cont, po,p1,pk,tol)
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de x es: %2.15f\n', pk)