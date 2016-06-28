% Resolución de Ecuaciones Diferenciales (ED) por medio de Runge-Kutta Punto Medio

% Sección de inicializacion
% Variable x cambia por variable t, modificar solo si es necesario
clear all
clc
syms t y
format long

% Introduccion de los datos de trabajo
% La Ecuacion Diferencial (ED) debe introducirse tal y como la dan en el ejercicio,
% esto es el modo de trabajo del comando "dsolve"; también se solicita 2 veces la condicion
% inicial: una para el comando dsolve y la otra para valores numericos para mostrar en la
% matriz de resolucion
disp('Resolucion de ED por medio de Punto Medio')

a = input('Introduzca el valor del limite superior: ');
b = input('Introduzca el valor del limite inferior: ');
c = input('Introduzca la condicion inicial entre comillas -> y(a)=x: ');
c1 = input('Introduzca el valor de la condicion inicial: ');
F = input('Introduzca la Ecuacion Diferencial entre comillas: ');
F1 = input('Introduzca la funcion de trabajo f(t,y) despejada: ');
h = input('Introduzca el tamaño de paso h: ');
N = int32((b-a)/h);

% Llenado de matriz de soluciones de ED
% matriz(filas,columnas)
% matriz(arriba/abajo, derecha/izquierda)
mED = zeros(N,4);

% Asignacion de valores iniciales en la matriz de ED
% se comienzan con los valores iniciales
fprintf('t \t\t\t Wi+1 \t\t\t Y(t) \t\t\t Error \n')
mED(1,1) = a;
mED(1,2) = c1;
mED(1,3) = c1;
mED(1,4) = abs(mED(1,3) - mED(1,2));
fprintf('%2.15f \t %2.15f \t %2.15f \t %e\n', mED(1,1), mED(1,2),mED(1,3),mED(1,4))

% Se llena la matriz con los datos de paso, el valor aproximado de la ED en base a la
% valor W(i+1), el valor según la resolucion del dsolve y el error entre los nodos
f = dsolve(F,c);
for i=2:N+1
	mED(i,1) = mED(i-1,1) + h;
	wiI = mED(i-1,2) + (h/2)*subs(F1,[t,y],[mED(i-1,1),mED(i-1,2)]);
	tiI = mED(i-1,1)+(h/2);
	fun = subs(F1,[t,y],[tiI,wiI]);
	mED(i,2) = mED(i-1,2) + h*fun;
	mED(i,3) = subs(f,mED(i,1));
	mED(i,4) = abs(mED(i,3) - mED(i,2));
 	fprintf('%2.15f \t %2.15f \t %2.15f \t %e\n', mED(i,1), mED(i,2),mED(i,3),mED(i,4))
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
	% Este cambio debe hacerse dentro de este codigo, ya que no es posible colocarlo
	% automaticamente, posterior a eso colocar el metodo a ocupar
	v_interp = input('Introduzca el valor a aproximar: ');
	resp_interp = LagrangeED(mED(:,1),mED(:,2), v_interp);

	fprintf('El valor de aproximado de la ED en %2.15f es : %2.15f \n\n',v_interp,resp_interp);
end