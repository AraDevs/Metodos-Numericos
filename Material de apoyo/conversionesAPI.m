%Conversiones varias
%Aca se dan conversion de valores para varias mediciones físicas y matemáticas

%MODO DE USO:
% Ingresar el valor a convertir
% Ingresar la opción de conversión (1 - 20)
% El programa retorna el valor convertido en la unidad deseada

%CONTRIBUCIONES:
% Para contribuir al programa se deberán crear los formatos en cada case
% el formato deberá manejarse según lo mostrado a continuación:

% fprintf(valor de entrada en la unidad dada)
% operacion a efectuar de conversion
% fprintf(valor de salida en la unidad buscada)

% Para agregarse una conversión a una unidad buscada
% también deberá agregarse la conversión de vuelta,
% esto con el fin de tener la conversión completa en cada caso

function [output] = conversionesAPI(input, option)

format long
fprintf('Conversion de valores para mediciones varias MATLAB \n\n');

switch option

	% pulgadas -> cm
	case 1
        fprintf('El valor ingresado es: %2.15f pulgadas \n',input);
        output = input*2.540;
        fprintf('El valor de salida es : %2.15f cm \n',output);
    
	% cm -> pulgadas   
	case 2
        fprintf('El valor ingresado es: %2.15f cm \n',input);
        output = input*0.3937007874;
        fprintf('El valor de salida es : %2.15f pulgadas \n',output);
        
	% ft -> m
	case 3
        fprintf('El valor ingresado es: %2.15f ft \n',input);
        output = input*0.3048;
        fprintf('El valor de salida es : %2.15f m \n',output);
        
	% m -> ft
	case 4
        fprintf('El valor ingresado es: %2.15f m \n',input);
        output = input*3.280839895;
        fprintf('El valor de salida es : %2.15f ft \n',output);

	% millas -> km
	case 5
        fprintf('El valor ingresado es: %2.15f millas \n',input);
        output = input*1.609344;
        fprintf('El valor de salida es : %2.15f km \n',output);
        
	% km -> millas
	case 6
        fprintf('El valor ingresado es: %2.15f km \n',input);
        output = input*0.6213711922;
        fprintf('El valor de salida es : %2.15f millas \n',output);
	
	% lb -> kg
	case 7
        fprintf('El valor ingresado es: %2.15f lb \n',input);
        output = input*0.4535924;
        fprintf('El valor de salida es : %2.15f kg \n',output);
        
	% kg -> lb
	case 8
        fprintf('El valor ingresado es: %2.15f kg \n',input);
        output = input*2.204622476;
        fprintf('El valor de salida es : %2.15f lb \n',output);        

	% J -> cal
	case 9
        fprintf('El valor ingresado es: %2.15f J \n',input);
        output = input*0.2389029576;
        fprintf('El valor de salida es : %2.15f cal \n',output);
        
	% cal -> J
	case 10
        fprintf('El valor ingresado es: %2.15f cal \n',input);
        output = input*4.1858;
        fprintf('El valor de salida es : %2.15f J \n',output); 

	% oz -> g
	case 11
        fprintf('El valor ingresado es: %2.15f oz \n',input);
        output = input*28.34952;
        fprintf('El valor de salida es : %2.15f g \n',output);
        
	% g -> oz
	case 12
        fprintf('El valor ingresado es: %2.15f g \n',input);
        output = input*0.03527396584;
        fprintf('El valor de salida es : %2.15f oz \n',output);

	% ft -> pulgadas
	case 13
        fprintf('El valor ingresado es: %2.15f ft \n',input);
        output = input*12;
        fprintf('El valor de salida es : %2.15f pulgadas \n',output);
        
	% pulgadas -> ft
	case 14
        fprintf('El valor ingresado es: %2.15f pulgadas \n',input);
        output = input*0.08333;
        fprintf('El valor de salida es : %2.15f ft \n',output);

	% °C -> °F
	case 15
        fprintf('El valor ingresado es: %2.15f °C \n',input);
        output = input*(9/5) + 32;
        fprintf('El valor de salida es : %2.15f °F \n',output);
        
	% °F -> °C
	case 16
        fprintf('El valor ingresado es: %2.15f °F \n',input);
        output = (input - 32)*(5/9);
        fprintf('El valor de salida es : %2.15f °C \n',output);        

	% °C -> °K
	case 17
        fprintf('El valor ingresado es: %2.15f °C \n',input);
        output = input + 273.15;
        fprintf('El valor de salida es : %2.15f °K \n',output);
        
	% °K -> °C
	case 18
        fprintf('El valor ingresado es: %2.15f °K \n',input);
        output = input - 273.15;
        fprintf('El valor de salida es : %2.15f °C \n',output);  

	% °F -> °K
	case 19
        fprintf('El valor ingresado es: %2.15f °F \n',input);
        input1 = (input - 32)*(5/9);
        output = input1 + 273.15;
        fprintf('El valor de salida es : %2.15f °K \n',output);
        
	% °K -> °F
	case 20
        fprintf('El valor ingresado es: %2.15f °K \n',input);
        input1 = input*(9/5) + 32; 
        output = input - 273.15;
        fprintf('El valor de salida es : %2.15f °F \n',output);

	% km/h -> m/s
	case 19
        fprintf('El valor ingresado es: %2.15f km/h \n',input);
        output = input*1000/3600;
        fprintf('El valor de salida es : %2.15f m/s \n',output);
        
	% m/s -> km/h
	case 20
        fprintf('El valor ingresado es: %2.15f m/s \n',input);
        output = input*3600/1000 
        fprintf('El valor de salida es : %2.15f km/h \n',output);

	otherwise
        disp('Opción no disponible, favor colocar la opción adecuada')
        
end