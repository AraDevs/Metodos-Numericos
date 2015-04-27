%Derivación aproximada Versión 1
%1) Ingresar la función para derivar, esta puede ocuparse posteriormente
%2) Ingresar los valores de evaluación X en forma de vector
%3) Genera los valores de f(x) para cada uno de los valores ingresados

% Inicialización
clear all
clc
syms x
format long

%Ingreso de valores de trabajo
disp('Derivación aproximada V1')
fun = input('Ingrese la función a evaluar: ');
X = input('Ingrese los valores de X en formato [x0;x1;x2;...;xn]: ');
fd = input('Ingrese la derivada solicitada en el ejercicio: ');
n = length(X);
dap = zeros(n,n)
Y = zeros(n,1);

for k=1:n
	Y(k) = subs(fun,X(k));
end

Z = diff(Y)./diff(X)

for k=1:length(Z)
	%dap(k,:) = Z(k);
	dap(k) = Z(k);
	%dap(k+1) = Z(k);
end
dap

%MPol(j,i) = MPol(j,i-1) - MPol(j-1,i-1);
%		MPol(j,i) = (MPol(j,i))/(X(j) - X(j-i+1))

%for i=1:fd
%	if fd==1
%		Z = diff(Y)./diff(X);
%		for k=1:length(Z)
%			dap(k,:) = Z(k);
%		end

%	else
%		disp('body')
%	end
%end




%dap = diff(X)/diff(Y)
%fprintf('', dap)*/

%fprintf('El valor de la derivada aproximada es: %2.15f \n', dap);
