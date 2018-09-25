Aquí se exponen los scripts que se utilizaron, en el trabajo de mi tesis de maestría, para calcular la filtración de Cech generalizada de un sistema de discos en R^2. Primero damos el código principal para luego ir mostrando una a una cada función realizada.

Las bibliotecas que se utilizaron fueron las siguientes:
- library("gtools") : para calcular las combinaciones.
- library("foreign") : para extraer la filtraci\'on en un archivo .txt.
- library(TDA).
- library(hash) : para almacenar información.

***CechFiltration***

Entrada: Sistema de discos, dimensión máxima y parámetro máximo.

Salida: Archivo .txt con los niveles de la filtración.

El siguiente script es el encargado de generar un sistema de discos arbitrario. El sistema se puede generar en R^n y por cuestiones de experimentación los puntos están en S^n y los radios tienen medida entre [0,1].

***CellsGenerator***

Entrada: Cantidad de discos a crear (r) y la dimensión (n).

Salida: Sistema de r discos en R^n.

El siguiente script es el encargado de generar la filtración del sistema de discos y expulsar el archivo de texto con las especificaciones de PERSEUS. En este algoritmo es donde se crean los simplejos y sus parámetros.

***Filtration***

Entrada: Dimensión máxima, parámetro máximo y sistema de discos.

Salida: Filtración de Cech del sistema de discos.

Este script es el que se utiliza para generar los 1-simplejos del sistema. Cada simplejo tendrá su parámetro y los que cumplan la condición de ser menores o iguales que el máximo serán considerados para la filtración.

***OneEsq***

Entrada: Matriz de distancias, parámetro máximo y radios de los discos del sistema.

Salida: Los 1-simplejos de la filtración y sus parámetros.

Con el siguiente script calculamos los k-simplejos (k>=2) y sus parámetros, estos parámetros deben cumplir la condición del máximo. La salida del algoritmo es una lista.

***Complex***

Entrada: El sistema de discos, dimensión máxima, parámetro máximo, el 1-esqueleto y sus parámetros.

Salida: Simplejos de la filtración y sus parámetros.

El siguiente script muestra como encontrar los discos vecinos de un discos dado. El siguiente script es para encontrar los discos vecinos pero ahora de un simplejo, los cuales son la intersección de los vecinos de cada vértice. Al tener a los vecinos, generas sus supercaras y son los candidatos a ser simplejos de la filtración.

***LowerNbrs***

Entrada: Un vértice u y los 1-simplejos.

Salida: Vértices vecinos a u con etiquetas menores.

***InterLN***

Entrada: Un simplejo s y los simplejos de la misma dimensión.

Salida: Vértices vecinos a todos los vértices de s con etiquetas menores.

Este script nos muestra cómo encontrar la escala de Cech de cualquier simplejo. Aquí es donde utilizamos el Teorema de Helly con k-simplejos donde k>=3. El siguiente script es el encargado de discernir si la escala de Rips es suficiente para ser la escala de Cech o necesitamos utilizar la función rho (más adelante).

***Weight***

Entrada: Sistema de discos, lista de parámetros y simplejo s.

Salida: Escala de Cech del simplejo s.

***CechScale***

Entrada: Un sistema de discos.

Salida: La escala de Cech del sistema.

***RipsScale***

Entrada: Un sistema de discos.

Salida: La escala de Rips del sistema.

El siguiente script muestra cómo calcular el valor de la función rho para un sistema de discos y un parámetro, con este valor es el indicador de si el parámetro es o no la escala de Cech.

***Rho***

Entrada: Un sistema de discos y un parámetro.

Salida: El valor de rho(M_lambda).

Para el script anterior es necesario tener los puntos de intersección entre los discos del sistema, este script identifica el (los) punto(s) de intersección entre dos discos. El algoritmo considera las diferentes configuraciones que pueden tener los discos, dependiendo de la ubicación del punto y los valores de los radios.

***InterPoints***

Entrada: Dos discos del sistema.

Salida: Punto(s) de intersección de los dos discos.

En el siguiente script se presenta el algoritmo para encontrar la raíz de la función rho. Para ello utilizamos el método numérico de bisección y por tanto los valores del intervalo se modifican de esta manera.

***RhoRoot***

Entrada: Un sistema de discos y dos parámetros a, b (donde rho(a) * rho(b)<0).

Salida: La raíz de rho.

Con este script podemos realizar la filtración como la pide PERSEUS, es decir, con los niveles y no los valores de los parámetros de los simplejos. Lo que hace el algoritmo es cambiar el parámetro por el lugar en la lista (de manera creciente).

***Levels***

Entrada: Lista de simplejos con sus parámetros y los parámetros en orden creciente.

Salida: Lista de simplejos con sus niveles.

Al obtener la filtración del sistema de discos, podemos calcular la homología persistente con PERSEUS. Para poder hacer el código de barras de dicha filtración podemos utilizar el siguiente algoritmo.

***Persistence***

Entrada: Archivos "output\_.txt" (salida de PERSEUS).

Salida: Archivo .png con el código de barras.
