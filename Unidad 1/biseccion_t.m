%Seccion de inicializacion
clear all
clc
format long
syms x
disp('Metodo de Biseccion')


% Sección de introducción de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
a = input('Introduzca el valor de a: ');
b = input('Introduzca el valor de b: ');
g = input('Introduzca la función: ');
error = input('Introduzca el valor de precisión: ');

% Sección de evaluaciones del método (1/2)
fa = subs(g,a);
fb = subs(g,b);

% Sección de corrida del método (2/2)
%1a verificacion: Los resultados de la funcion evaluada deben ser de signos distintos
if(fa*fb < 0)
	c = a + (b - a)/2;
	fc = subs(g,c);
	cont = 1;
	tol = abs(fc);
	disp('n	a		b 		p 		error')
	fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f 		%e\n', cont, a,b,c,tol)

	%2a verificacion: El programa debe seguir corriendo mientras no se cumpla el criterio de paro
	% Dentro del while, deberá verificarse bajo que limite es que se encuentra el cambio de signo
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
		fprintf('%3.0f	%2.15f 		%2.15f 		%2.15f 		%e\n',cont,a,b,c,tol)
	end

end

% Mostrar respuesta en pantalla
% Verificar sección ya que a veces funciona bien, pero en otras da error que no encuentra la variable
fprintf('El valor aproximado de x es: %2.15f\n', c);