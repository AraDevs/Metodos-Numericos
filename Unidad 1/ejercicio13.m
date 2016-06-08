% Seccion de inicializacion
clear all
clc
format long
syms Re
disp('Ejercicio 13 Guia 1 MEN')

% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
% valor del solve: 58289.490658849556531304806209131
% Sección de valores iniciales
Pr = 0.7; Nu = 60;

% Sección de valores finales
g = 0.3 + ((1 + (Re/282000)^(5/8))^(4/5))*((0.62*Re^(1/2)*Pr^(1/3))/(1 + (1 + (0.4/Pr)^(1/4)))) - Nu;
po = 58289.48;
p1 = 58289.50;
error = 1e-12;

% Seccion de evaluaciones del metodo (1/2)
a1 = subs(g,p1);
a2 = subs(g,po);

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
if(a1*a2<0)
	pk = p1 - a1*(p1-po)/(a1 - a2);
	a3 = subs(g,pk);
	cont = 1;
	tol = abs(pk - p1);

	fprintf('n \t\t p0 \t\t p1 \t\t p2 \t\t error \n')
	fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,po,p1,pk,tol)

	while(abs(pk - p1) > error)
	cont = cont + 1;

	if(a1*a3 < 0)
		po = p1;
		p1 = pk;
		pk = p1 - a1*(p1-po)/(a1 - a2);
		tol = abs(pk - p1);
	else
		po = po;
		p1 = pk;
		pk = p1 - a1*(p1-po)/(a1 - a2);
		tol = abs(pk - p1);
	end

	a3 = subs(g,pk);	
	fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,po,p1,pk,tol)
	end

	% Mostrar respuesta aproximada en pantalla
	fprintf('\n')
	fprintf('El valor aproximado de x es: %2.15f\n', pk)
	
end