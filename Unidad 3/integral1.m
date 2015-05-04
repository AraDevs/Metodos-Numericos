%Resolución de integrales simples
%Resolución de integrales simples usando el comando int

%MODO DE USO:
% Ingresar la función a integrar
% Ingresar el límite inferior de integración
% Ingresar el límite superior de integración
% El programa retorna la solución de la integral

function [integ] = integral1(fun, lim_inf,lim_sup)

disp('Resolución de integrales sencillas')

fprintf('El valor de la integral exacta es: \n');
integ = double(int(fun,lim_inf,lim_sup))