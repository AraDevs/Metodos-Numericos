% Seccion de inicializacion
clear all
clc
format long
syms V
disp('Ejercicio 14 Guia 1 MEN')

% Sección de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
% valor del solve: 1.554272650115556e-04
% Sección de valores iniciales
P = 1008e3;
T1 = 258.75; T=T1+273.15;
Pc = 7390e3; Tc=304.2; R=0.2968;
Vo = R*T/P;
a = (0.4278*(R^2)*(Tc^2.5))/(Pc);
b = (0.0867*R*Tc)/(Pc);

% Sección de valores finales
%g = (P + a/(V*(V + b)*T^0.5))*(V - b) - R*T
g = (P + a/(V*(V + b)*T^0.5))*(V - b) - R*T;
po = Vo-0.01;
p1 = Vo;
error = 1e-12;

% Sección de evaluaciones del metodo (1/2)
a1 = subs(g,p1);
a2 = subs(g,po);
pk = p1 - a1*(p1-po)/(a1 - a2);
cont = 1;
tol = abs(pk - p1);

% Mostrar los valores solicitados en pantalla
fprintf('n \t\t p0 \t\t p1 \t\t p2 \t\t error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,po,p1,pk,tol)

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
while(abs(pk - p1) > error)
	cont = cont + 1;
	po = p1;
	p1 = pk;

	pk = p1 - a1*(p1-po)/(a1 - a2);
	tol = abs(pk - p1);
	fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,po,p1,pk,tol);
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de x es: %2.15f\n', pk)