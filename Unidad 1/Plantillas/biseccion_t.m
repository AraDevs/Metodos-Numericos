% Seccion de inicializacion
clear all
clc
format long
syms x
disp('Metodo de Biseccion')

% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
a = input('Introduzca el valor de a: ');
b = input('Introduzca el valor de b: ');
g = input('Introduzca la funcion: ');
error = input('Introduzca el valor de precision: ');

% Seccion de evaluaciones del metodo (1/2)
fa = subs(g,a);
fb = subs(g,b);

% Seccion de corrida del metodo (2/2)
%1a verificacion: Los resultados de la funcion evaluada deben ser de signos distintos
if(fa*fb < 0)
	c = a + (b - a)/2;
	fc = subs(g,c);
	cont = 1;
	tol = abs(fc);
	fprintf('n \t\t p0 \t\t\t p1 \t\t\t p2 \t\t   error \n')
	fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,a,b,c,tol)

	%2a verificacion: El programa debe seguir corriendo mientras no se cumpla el criterio de paro
	% Dentro del while, debera verificarse bajo que limite es que se encuentra el cambio de signo
	% y realizar el cambio para continuar evaluando
	while(abs(c-a) > error)
		cont = cont + 1;

		if (fa*fc < 0)
			a = a;
			b = c;
			c = a + (b - a)/2;
			tol = abs(c - b);

		else
			a = c;
			b = b;
			c = a + (b - a)/2;
			tol = abs(c - a);

		end

		fc = subs(g, c);
		fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %e\n',cont,a,b,c,tol)
	end

	% Mostrar respuesta aproximada en pantalla
	fprintf('\n');
	fprintf('El valor aproximado de x es: %2.15f\n', c);

end