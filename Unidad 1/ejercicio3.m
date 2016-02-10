% Para este ejercicio en particular deben combinarse 2 metodos, por lo tanto,
% debera crearse un switch que permite elegir al usuario como resolver el ejercicio

% Sección de inicialización
clear all
clc
format long
syms x
disp('Ejercicio 3 Guia 1 MEN')

% Switch para escoger la opcion de resolucion
% Si se escoge la opcion 1, entonces el ejercicio se resolvera usando Biseccion
% Si se escoge la opcion 2, entonces el ejercicio se resolvera usando Steffensen
disp('Presione 1 para efectuar el ejercicio por medio de Biseccion')
disp('Presione 2 para efectuar el ejercicio por medio de Steffensen')
option = input('Introduzca la opcion deseada: ')

switch option
	case 1 % Resolucion por medio de Biseccion

		% Sección de introducción de datos de trabajo
		a = input('Introduzca el valor de a: ');
		b = input('Introduzca el valor de b: ');
		g = input('Introduzca la función: ');
		error = input('Introduzca el valor de precisión: ');

		% Sección de evaluaciones del método (1/2)
		fa = subs(g,a);
		fb = subs(g,b);

		if (fa*fb < 0)
			c = a + (b - a)/2;
			fc = subs(g,c);
			cont = 1;
			tol = abs(fc);
			disp('n	a		b 		p 		error')
			fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f 		%e\n', cont, a,b,c,tol)

			while (abs(c-a) > error)
				cont = cont + 1;

				if (fa*fc < 0)
					a = a;
					b = c;
					c = a + (b - a)/2;
					tol = abs(c - b);

				else
					a = b;
					b = b;
					c = a + (b - a)/2;
					tol = abs(c - a);

				end

				fc = subs(g,c);
				fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f 		%e\n', cont, a,b,c,tol)
			end

		end

		% Mostrar respuesta en pantalla
		fprintf('El valor aproximado de x es: %2.15f\n', c);

	case 2 % Resolucion por medio de Steffensen
		% Sección de introducción de datos de trabajo
		po = input('Introduzca el valor P0: ');
		g = input('Introduzca la función: ');
		error = input('Introduzca el valor de precisión: ');

		% Sección de evaluaciones del método (1/2)
		p1 = subs(g,po);
		p2 = subs(g,p1);
		P = po - (p1 - po)^2/(p2 + 2*p1 + po);
		tol = abs(P - po);
		cont = 1;

		% Mostrar los valores solicitados en pantalla
		disp('n		P0		P1 		P2 		P		error')
		fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f		%2.15f 		%e\n', cont, po,p1,p2,P,tol);

		% Sección de corrida del método explicado (2/2)
		while(abs(P - po) > error)
			cont = cont + 1;
			po = P;

			p1 = subs(g,po);
			p2 = subs(g,p1);
			P = po - (p1 - po)^2/(p2 + 2*p1 + po);
			tol = abs(P - po);

			fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f		%2.15f 		%e\n', cont, po,p1,p2,P,tol);
		end

		% Mostrar respuesta en pantalla
		fprintf('El valor aproximado de x es: %2.15f\n', P);

	otherwise
		disp('Opcion incorrecta, favor escoger la opcion adecuada')
end