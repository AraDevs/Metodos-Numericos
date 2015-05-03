%Derivada real Versión 2
%El uso de esta derivada está limitada a ejercicios que den una función,
%caso contrario no es posible obtener la derivada real.
%El programa permite obtener los valores de la n-derivada en cada valor de X

%Uso del programa
%1) Llamar a la función como deriv_real('[funcion]',[n derivada]). 
%2) ¡¡Importante que "funcion" vaya entre comillas!! De lo contrario el programa arrojará error.
%3) Ingresar los valores de evaluación X en forma de vector.
%4) Una vez ingresados todos estos datos procede a operar.

% Este programa de la derivada real es un archivo de tipo function, lo cual permitirá
% usarlo como una API para llamarlo en los métodos de derivadas aproximadas y que pueda
% mostrar ambas soluciones requeridas: la derivada real y la derivada aproximada.
% Si el ejercicio lo solicita se podrá obtener el error entre ambos datos.
function [output] = deriv_real(fun, fd)

format long
fprintf('\n')
fprintf('Derivada real para cada valor de X')
fprintf('\n')

% Patch que permite remover advertencias del programa a efectuarse, esto permitirá
% ocultar mensaje de advertencia sobre método char/diff a removerse en futuras versiones
% Mensaje encontrado en Matlab R2011b, no testeado en otras versiones:
% Warning: The method char/diff will be removed in a future release. Use sym/diff instead
warning('off','all')

% Ingreso de los valores del vector X (se ocupa X en mayúsculas para evitar conflictos)
X = input('Ingrese los valores de X en formato [x0;x1;x2;...;xn]: ');

% Fun(n) = diff([función],[derivada n])
F = diff(fun,fd);

% f(fd)(x) = subs(Fun(n),vector X)
output = subs(F,X);

% Imprime los resultados de la derivada solicitada
fprintf('\n')
fprintf('El valor exacto de la derivada en cada punto de X es: \n');
fprintf('%2.15f \n', output)