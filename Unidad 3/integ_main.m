%Resolución de integrales exactas por el comando int
%El uso de este programa viene limitado al comando int
%esto debido a que es el unico que acepta parámetros
%de entrada (funciones) y salida (respuesta)

%Menú principal de trabajo
%Dependiendo de la integral solicitada será la función a llamar
%integral1.m es para resolución de integrales sencillas
%integral2.m es para resolución de integrales dobles
%integral3.m es para resolución de integrales triples

%Uso del programa
%1) Definir el tipo de integral a resolver (simple, doble, triple)
%2) Ingresar la función o funciones a utilizar en la(s) integral(es)
%3) Ingresar los límites de integración que dependerán del tipo de integral a resolver

%Inicialización 1
clear all
clc
syms x y z
format long

%Inicialización 2
disp('Resolución de integrales exactas');
no_int = input('Ingrese el tipo de integral a resolver (1=sencilla,2=doble,3=triple): ');
fprintf('\n');

switch (no_int)
	case 1
		%disp('Resolución de integrales sencillas')
		fun = input('Ingrese la función a integrar: ');
		lim_inf1 = input('Ingrese el límite inferior de la integral: ');
		lim_sup1 = input('Ingrese el límite superior de la integral: ');
		fprintf('\n');

		integral1(fun,lim_inf1,lim_sup1);

	case 2
		%disp('Resolución de integrales dobles')
		fun = input('Ingrese la función a integrar: ');
		lim_inf1 = input('Ingrese el límite inferior de la integral interna: ');
		lim_sup1 = input('Ingrese el límite superior de la integral interna: ');
		lim_inf2 = input('Ingrese el límite inferior de la integral externa: ');
		lim_sup2 = input('Ingrese el límite superior de la integral externa: ');
		fprintf('\n');

		integral2(fun,lim_inf1,lim_sup1,lim_inf2,lim_sup2);

	case 3
		%disp('Resolución de integrales triples')
		fun = input('Ingrese la función a integrar: ');
		lim_inf1 = input('Ingrese el límite inferior de la integral interna: ');
		lim_sup1 = input('Ingrese el límite superior de la integral interna: ');
		lim_inf2 = input('Ingrese el límite inferior de la integral central: ');
		lim_sup2 = input('Ingrese el límite superior de la integral central: ');
		lim_inf3 = input('Ingrese el límite inferior de la integral externa: ');
		lim_sup3 = input('Ingrese el límite superior de la integral externa: ');
		fprintf('\n');

		integral3(fun,lim_inf1,lim_sup1,lim_inf2,lim_sup2,lim_inf3,lim_sup3);

	otherwise
		fprintf('\n');
		fprintf('¡Error! Seleccione una opción válida \n');
		pause

end
