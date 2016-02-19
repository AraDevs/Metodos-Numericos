% Evaluador de funciones para metodos de Interpolaciones
% Este programa ayuda a obtener los valores definidos para ingresarlos
% a los ejercicios de interpolacion, este posee un switch que permite
% definir si se necesitan obtener los valores de la derivada de una funcion

%1) Ingresar la funcion que se desea evaluar 
%2) Ingresar los valores del vector X para revision
%3) Seleccionar si el ejercicio posee o no una derivada
%4) Genera los valores de f(x) para cada uno de los valores ingresados
%5) Si el ejercicio posee derivada, derivara la funcion ingresada y 
% posteriormente generara los valores de f'(x) para cada valor ingresado
clear all
clc
syms x

%format long permite colocar los numeros con 15 decimales
%dicha cantidad es la mas ocupada en este tipo de ejercicios
format long
disp('Generacion de vectores evaluados para ejercicios de Interpolaciones')

g = input('Ingrese la función a evaluar: '); %Ingresar la funcion requerida
X = input('Ingrese los valores de X en formato [x0,x1,x2,...,xn]: '); %Ingresar los valores del vector X
n = length(X); %

% Verificacion de si el ejercicio posee o no derivada
disp('Ingrese 1 si la funcion posee una derivada');
disp('Ingrese 2 si la funcion no posee una derivada');
option = input('¿La funcion posee derivada?: ')

%matriz(filas,columnas)
%matriz(arriba/abajo, derecha/izquierda)
Y = zeros(n,n);
for i=1:n
	Y(1,i) = subs(g,X(i));	
end
Y

% Evaluacion de derivada
if option == 1
	
	G = diff(g);
	Z = zeros(n,n);
	for i=1:n
		Z(1,i) = subs(G,X(i));
	end
	Z

end