%Derivada real
%El uso de esta derivada está limitada a ejercicios que den una función,
%caso contrario no es posible obtener la derivada real

%Uso del programa
%1) deriv_real('[funcion]',[n derivada]). ¡¡Importante que funcion vaya entre comillas!!
%2) Ingresar los valores de evaluación X en forma de vector
%4) Una vez ingresados todos estos datos procede a operar

% Prueba de tipo de archivo tipo function, esto permitirá usarlo como API 
% en caso en algun ejercicio se solicite la derivada real junto a la aproximada
function [output] = deriv_real(fun, fd)

format long

% Ingreso de valores de trabajo para operaciones
disp('Derivada real')
%fun = input('Ingrese la función a evaluar: ');
X = input('Ingrese los valores de X en formato [x0;x1;x2;...;xn]: ');
%fd = input('Ingrese la derivada solicitada en el ejercicio: ');

% Fun(n) = diff([función],[derivada n])
F = diff(fun,fd);

% f(fd)(x) = subs(Fun(n),vector X(1:end-fd))
output = subs(F,X(1:end-fd));

% Imprime los resultados de la derivada solicitada
fprintf('\n')
fprintf('El valor de la derivada real es: \n');