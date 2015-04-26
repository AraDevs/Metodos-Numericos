% Sección de inicialización
clear all
clc
format long
syms x
disp('Metodo de Iteracion de Punto fijo')

% Sección de introducción de datos de trabajo
g = input('Introduzca la funcion g: ');
po = input('Introduzca el valor inicial: ');
delta = input('Introduzca el valor del error: ');

% Sección de evaluaciones del método (1/2)
p1 = subs(g,po);
cont = 1;
z = abs(subs(g,po));


% Mostrar los valores solicitados en pantalla
disp('n		p0 		p1 		error')
fprintf('%3.0f \t %2.15f \t %2.15f \t %e \n', cont, po, p1, z)

% Sección de corrida del método explicado (2/2)
while(abs(p1 - po) > delta)
    cont = cont + 1;
    po = p1;
    p1 = subs(g,po);
    tol = abs(p1 - po);
    fprintf('%3.0f \t %2.15f \t %2.15f \t %e \n', cont, po, p1, tol) 
end

% Mostrar respuesta en pantalla
fprintf('El valor aproximado de x es: %2.15f\n', p1);
