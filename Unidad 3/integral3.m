%Resolución de integrales triples
%Resolución de integrales triples usando el comando int

%MODO DE USO:
% Definir el orden de integración (dxdydz, dxdzdy, dydxdz, dydzdx, dzdxdy, dzdydx)
% Ingresar la función a integrar
% Ingresar el límite inferior de la integral interna
% Ingresar el límite superior de la integral interna
% Ingresar el límite inferior de la integral externa
% Ingresar el límite superior de la integral externa
% El programa retorna la solución de la integral

function [integ] = integral3(fun, lim_inf1,lim_sup1,lim_inf2,lim_sup2,lim_inf3,lim_sup3)

syms x y z
%Inicialización 2
disp('Resolución de integrales triples');
disp('1 = dxdydz')
disp('2 = dxdzdy')
disp('3 = dydxdz')
disp('4 = dydzdx')
disp('5 = dzdxdy')
disp('6 = dzdydx')
ord_int = input('Defina el orden de integración: ');
fprintf('\n');

switch (ord_int)
	% Orden de integración dxdydz
	case 1
		fprintf('El valor de la integral exacta es: \n');
		integ = double(int(int(int(fun,x,lim_inf1,lim_sup1),y,lim_inf2,lim_sup2),z,lim_inf3,lim_sup3))

	% Orden de integración dxdzdy
	case 2
		fprintf('El valor de la integral exacta es: \n');
		integ = double(int(int(int(fun,x,lim_inf1,lim_sup1),z,lim_inf2,lim_sup2),y,lim_inf3,lim_sup3))

	% Orden de integración dydxdz
	case 3
		fprintf('El valor de la integral exacta es: \n');
		integ = double(int(int(int(fun,y,lim_inf1,lim_sup1),x,lim_inf2,lim_sup2),z,lim_inf3,lim_sup3))

	% Orden de integración dydzdx
	case 4
		fprintf('El valor de la integral exacta es: \n');
		integ = double(int(int(int(fun,y,lim_inf1,lim_sup1),z,lim_inf2,lim_sup2),x,lim_inf3,lim_sup3))

	% Orden de integración dzdxdy
	case 5
		fprintf('El valor de la integral exacta es: \n');
		integ = double(int(int(int(fun,z,lim_inf1,lim_sup1),x,lim_inf2,lim_sup2),y,lim_inf3,lim_sup3))

	% Orden de integración dzdydx
	case 6
		fprintf('El valor de la integral exacta es: \n');
		integ = double(int(int(int(fun,z,lim_inf1,lim_sup1),y,lim_inf2,lim_sup2),x,lim_inf3,lim_sup3))

	otherwise
		fprintf('\n');
		fprintf('¡Error! Seleccione una opción válida \n');
		pause

end