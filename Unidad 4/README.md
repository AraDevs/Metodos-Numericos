# Unidad 4: Solución de ecuaciones diferenciales

*Extractos tomados de Análisis Numérico y Visualización Gráfica con Matlab:*

"Las ecuaciones diferenciales se utilizan para poder modelar problemas de ciencia e ingeniería en los cuales se requiere el cambio de variables respecto a otra, en la mayor parte de ellos es necesario resolver un problema de valores iniciales. Los métodos a estudiar no generan una aproximación continua a la solución, sino que se obtienen aproximaciones en algunos puntos o nodos, los cuales están igualmente espaciados. Si se requiere la aproximación en nodos no listados, será necesario utilizar un método de interpolación, entre ellos el mas comúnmente utilizado será el de Hermite".

En esta unidad se verán varios métodos de resolución de ecuaciones diferenciales, estos métodos son los siguientes:

### Para las derivadas:

1. Método de Euler.
2. Método de Taylor de Orden Superior.
3. Métodos de Runge - Kutta (RK):
 	- Punto medio.
	- Modificado de Euler.
	- Método de Heun.
	- RK de orden 4.
	- RK Fehlberg 4.
	- RK Fehlberg 5.
4. Métodos Multipasos (explícito):
 	- Adams-Bashforth de Dos Pasos.
	- Adams-Bashforth de Tres Pasos.
	- Adams-Bashforth de Cuatro Pasos.
	- Adams-Bashforth de Cinco Pasos.
5. Métodos Multipasos (implícito):
 	- Adams-Moulton de Dos Pasos.
	- Adams-Moulton de Tres Pasos.
	- Adams-Moulton de Cuatro Pasos.
6. Método de extrapolación.

En esta unidad aparte de ocupar los métodos antes descritos, también pueden venir ejercicios que involucren ocupar los métodos de aproximación polinomial de la unidad 2, por tanto se tratará de colocar un código estandarizado de los existentes en dicha unidad (en su defecto parchado para estos casos).
