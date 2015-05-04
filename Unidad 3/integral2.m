%Resolución de integrales dobles
%Resolución de integrales dobles usando el comando int

%MODO DE USO:
% Definir el orden de integración (dxdy ó dydx)
% Ingresar la función a integrar
% Ingresar el límite inferior de la integral interna
% Ingresar el límite superior de la integral interna
% Ingresar el límite inferior de la integral externa
% Ingresar el límite superior de la integral externa
% El programa retorna la solución de la integral

function [integ] = integral2(fun, lim_inf1,lim_sup1,lim_inf2,lim_sup2)

syms x y z
disp('Resolución de integrales dobles')

%Definición del orden de integración
ord_int = input('Defina el orden de integración (1=dxdy,2=dydx): ');
fprintf('\n');

switch (ord_int)
	% Orden de integración dxdy
	case 1
		fprintf('El valor de la integral exacta es: \n');
		integ = double(int(int(fun,x,lim_inf1,lim_sup1),y,lim_inf2,lim_sup2))

	% Orden de integración dydx
	case 2
		fprintf('El valor de la integral exacta es: \n');
		integ = double(int(int(fun,y,lim_inf1,lim_sup1),x,lim_inf2,lim_sup2))

	otherwise
		fprintf('\n');
		fprintf('¡Error! Seleccione una opción válida \n');
		pause

end
