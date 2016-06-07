% Seccion de inicializacion
clear all
clc
format long
syms t
disp('Ejercicio 12 Guia 1 MEN')

% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=x
% valor del solve: 1.9189
% So - St - m*gr*t/k + ((gr*m^2)/(k^2))*(1 - exp(-k*t/m)) 
% Sección de valores iniciales para operación
gr = 32.17; k = 0.1; So = 1259;
m1 = 9.5; m = m1*2.204622476;
St1 = 14400; St = St1*0.08333;
g = (k*(So - St + ((gr*m^2)/k^2)*(1 - exp(-k*t/m))))/(m*gr);
po = 1.9188;
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