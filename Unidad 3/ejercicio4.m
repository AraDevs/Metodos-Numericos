% Ejercicio 4 Guia 3 MEN
clear all
clc
format long
syms t

disp('Ejercicio 4 Guia 3 MEN')
g = -70 + 7.*t + 70*exp(-t./10);
G1 = diff(g,t);
G2 = diff(g,t,2);
T = [9.0,9.8,10.9,11.2,13.5,17.5];
Dt = [21.459876,24.871777,29.835155,31.239586,42.646818,64.664176];

disp('Valor aproximado de la velocidad')
VA1 = diff(Dt)./diff(T)

disp('Valor exacto de la velocidad')
VR1 = subs(G1,t,T(1:end-1))

disp('Valor exacto de la velocidad en cada valor de t')
VR2 = subs(G1,t,T)

disp('Valor aproximado de la aceleracion')
VAA = diff(VA1)./diff(T(1:end-1))