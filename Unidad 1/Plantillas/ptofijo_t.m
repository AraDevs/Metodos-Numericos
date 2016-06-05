% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Metodo de Iteracion de Punto fijo')

% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=x
g = input('Introduzca la funcion g: ');
po = input('Introduzca el valor inicial: ');
error = input('Introduzca el valor del error: ');

% Seccion de evaluaciones del método (1/2)
p1 = subs(g,po);
cont = 1;
tol = abs(p1 - po);


% Mostrar los valores solicitados en pantalla
fprintf('n \t\t p0 \t\t p1 \t \t error')
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
fprintf('El valor aproximado de x es: %2.15f\n', p1);