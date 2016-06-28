% Resolución de Ecuaciones Diferenciales (ED) por medio de Taylor

% Sección de inicializacion
% Variable x cambia por variable t, modificar solo si es necesario
clear all
clc
syms t y
format long

% Introduccion de los datos de trabajo
% Para este metodo no es necesario realizar la resolucion usando el comando "dsolve",
% sin embargo, se dejaran comentados las secciones en las que deben ingresarse los datos
% en el caso se requiera ocupar dicho comando, de lo contrario solo se ocuparan los datos 
% que se encuentren descomentados
disp('Resolucion de ED por medio de Taylor')

a = input('Introduzca el valor del limite inferior: ');
b = input('Introduzca el valor del limite superior: ');
%c = input('Introduzca la condicion inicial entre comillas -> y(a)=x: ');
c1 = input('Introduzca el valor de la condicion inicial: ');
%F = input('Introduzca la Ecuacion Diferencial entre comillas: ');
F1 = input('Introduzca la funcion de trabajo f(t,y) despejada: ');
h = input('Introduzca el tamaño de paso h: ');
t_orden = input('Ingrese el orden de Taylor a utilizar: ');
N = (b-a)/h;
m = t_orden-1;

% Llenado de matriz de soluciones de ED
% matriz(filas,columnas)
% matriz(arriba/abajo, derecha/izquierda)
mED = zeros(N,2);

% Se solicitan las derivadas implicitas en terminos de f(y,t) para ocuparlas posteriormente,
% el método de Taylor solicita (# de orden - 1) derivadas implicitas para el proceso
fprintf('\n');
fprintf('Se ingresaran %d derivadas implicitas \n',m)
for i=1:m
	FI(i) = input('Ingrese la derivada: ');
end
fprintf('\n')

% Asignacion de valores iniciales en la matriz de ED
% se comienzan con los valores iniciales
fprintf('t \t\t\t Wi+1 \n')
mED(1,1) = a;
mED(1,2) = c1;
fprintf('%2.15f \t %2.15f \n', mED(1,1), mED(1,2))

% Se crea la ecuacion de diferencias en base al orden de Taylor solicitado
funT = h*F1;
for k=1:m
    PolT = funT + ((h^(k+1))/(factorial(k+1)))*FI(k);
    funT = PolT;
end

% Se llena la matriz con los datos de paso y el valor aproximado de la ED en base al
% valor W(i+1). Si desea agregar los valores que da el "dsolve", descomentar la linea
% inferior y colocar los valores dentro del metodo, ya que no los considera
%f = dsolve(F,c);
for i=2:N+1
	mED(i,1) = mED(i-1,1) + h;
	fun = subs(funT,[t,y],[mED(i-1,1),mED(i-1,2)]);
	mED(i,2) = mED(i-1,2) + fun;
	fprintf('%2.15f \t %2.15f \n', mED(i,1), mED(i,2))
end
fprintf('\n');

% El ejercicio puede solicitar interpolacion para un valor en particular, 
% si es el caso se debe colocar el metodo a ocupar junto con los datos de
% las matrices de X (mED(:,1)) y Y (mED:,2)

% El comando "menu" permite crear un dialogo con una o varias opciones para 
% seleccion, este se ocupa como manera interactiva para consultar al usuario
% si necesita hacer la parte de interpolacion en dicho ejercicio
choice = menu('¿El ejercicio solicita valor de interpolacion?','Si','No');
if choice==0 | choice==2
   break;
else
	% Opciones disponibles para resoluciones de aproximacion en ED
	% LagrangeED: Interpolacion de Lagrange
	% NevilleED: Interpolacion de Neville
	% DifDividED: Interpolacion por Diferencias Divididas
	% HermiteED: Interpolacion por Hermite (principalmente Difer. Dividid.)
	% TrazadoresED: Interpolacion por Trazadores Cubicos
	% respuesta = metodo(X,Y,valor a interpolar);
	v_interp = input('Introduzca el valor a aproximar: ');
	resp_interp = LagrangeED(mED(:,1),mED(:,2), v_interp);

	fprintf('El valor de aproximado de la ED en %2.15f es : %2.15f \n\n',v_interp,resp_interp);
end