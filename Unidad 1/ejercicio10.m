% Seccion de inicializacion
clear all
clc
format long
syms h
disp('Ejercicio 10 Guia 1 MEN')

% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
% valor del solve:  -0.569905678762
% Sección de valores iniciales para operación
rhop = 795;
rhoa = 1000;
d1 = 878; d = 878/1000; r = d/2;
Vesf = (4/3)*pi*r^2;

g = rhoa*pi*((h^2)*r - (h^3)/3) - rhop*Vesf;
po = -0.569905;
p1 = -0.569909;
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