%Derivación aproximada Versión 1
%1) Ingresar la función para derivar, esta puede ocuparse posteriormente
%2) Ingresar los valores de evaluación X en forma de vector
%3) Ingresar la derivada solicitada en el ejercicio
%4) Una vez ingresados todos estos datos procede a operar

% Inicialización
clear all
clc
syms x
format long

% Ingreso de valores de trabajo y creación de matrices para operaciones
disp('Derivación aproximada V1')
fun = input('Ingrese la función a evaluar: ');
X = input('Ingrese los valores de X en formato [x0;x1;x2;...;xn]: ');
fd = input('Ingrese la derivada solicitada en el ejercicio: ');
fr1 = input('¿El programa solicita la derivada real? (1=sí,2=no): ');
fr2 = input('¿El programa solicita la derivada exacta en cada punto de X? (1=sí,2=no): ');
n = length(X);
dap = zeros(n-1,n-1);
Y = zeros(n,1);

% Obtención de los valores para la matriz Y
for k=1:n
	Y(k) = subs(fun,X(k));
end

% Dependiendo de la derivada solicitada es la operación que realizará dentro de este ciclo

% Si es la 1a derivada, entonces realizará esta operación:
%			diff(vector Y)
% f'(x) = ---------------------------------------
%			diff(vector X)
if fd==1
	Z = diff(Y)./diff(X);
	for k=1:length(Z)
		dap(k,fd) = Z(k);
	end

	% Imprime los resultados de la derivada solicitada
	fprintf('\n')
	fprintf('El valor de la derivada aproximada es: \n');
	fprintf('%2.15f \n', dap(:,fd))

% Si es la 2a derivada o mayor, entonces realizará esta operación:
%			diff(vector f(fd -1)(x))
% f(fd)(x) = -------------------------------------
%			diff(vector X(1:end-(fd-1)))
else
	Z = diff(Y)./diff(X);
	for k=1:length(Z)
		dap(k,1) = Z(k);
	end

	for i=2:fd
		%1a iteracion (2): hasta n-1 -> n - i(2) + 1
		%2a iteración (3): hasta n-2 -> n - i(3) + 1
		%3a iteración (4): hasta n-3 -> n - i(4) + 1
		%y así sucesivamente
		dap1 = dap([1:n-i+1],[i-1]);
		%1a iteracion (2): X(1:end-(1)) -> i(2) - 1
		%2a iteración (3): X(1:end-(2)) -> i(3) - 1
		%3a iteración (4): X(1:end-(3)) -> i(4) - 1
		%y así sucesivamente
		Z = diff(dap1)./diff(X(1:end-(i-1)));

		% Una vez obtenidos los valores de esa derivada aproximada
		% los ingresa a la matriz completa de derivadas aproximadas
		for k=1:length(Z)
			dap(k,i) = Z(k);
		end

	end

	% Muestra la matriz de derivadas aproximadas obtenidas en el transcurso del programa
	dap

	% Imprime los resultados de la derivada solicitada
	fprintf('\n')
	fprintf('El valor de la derivada aproximada es: \n');
	fprintf('%2.15f \n', Z)
end

% Llamados a las resoluciones de derivadas reales
% 1) Resolución de la derivada real
if fr1==1
	out = deriv_real1(fun,fd);
	err = norm(out-Z);
	fprintf('\n')
	fprintf('El valor del error es: \n');
	fprintf('%e \n', err)
end

% 2) Resolución de la derivada real en cada punto de X
if fr2==1
	out = deriv_real2(fun,fd)
	fprintf('\n')
	fprintf('El valor exacto de la derivada en cada punto de X es: \n');
	fprintf('%e \n', out)
end