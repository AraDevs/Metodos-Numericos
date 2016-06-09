% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Ejercicio 23 Guia 1 MEN')

% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=x
% valor del solve: 1.509785140699101
% Seccion de valores iniciales
e = 8.85e-12; a = 90/100;
q = 2e-5; Q = 2e-5;
F = 1;

%g = (1/(4*pi*e))*((q*Q*x)/((x^2 + a^2)^(3/2))) - F;
g = ((4*pi*F*e)*(x^2 + a^2)^(3/2))/(q*Q);
po = 0.221;
error = 1e-12;

% Seccion de evaluaciones del método (1/2)
p1 = subs(g,po);
cont = 1;
tol = abs(p1 - po);


% Mostrar los valores solicitados en pantalla
fprintf('n \t\t p0 \t\t p1 \t \t error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %e \n',cont,po,p1,tol)

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
while(abs(p1 - po) > error)
    cont = cont + 1;
    po = p1;
    p1 = subs(g,po);
    tol = abs(p1 - po);
    fprintf('%3.0f \t %2.15f \t %2.15f \t %e \n',cont,po,p1,tol)
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de x es: %2.15f\n', p1)