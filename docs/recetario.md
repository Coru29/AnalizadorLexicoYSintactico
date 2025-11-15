# Problema: Analizador de Recetario Digital

## Descripción del Dominio

Un **recetario digital** es un archivo con una colección de recetas culinarias que debe procesarse de
manera sistemática. El sistema debe ser capaz de leer recetas con un formato estructurado y validar
que cumplan con ciertos criterios básicos.

## ¿Qué es un Recetario?

Un recetario contiene múltiples recetas, donde cada receta incluye:

```
Nombre de la receta
Lista de ingredientes con cantidades
Pasos de preparación
Tiempo que lleva la preparación
Información sobre porciones
Calorías que provee cada porción de la receta
Categorías de la receta (desayuno, merienda, principal, entrada, colación o postre)
Nivel de dificultad de la receta (cualquier clasificación que permita separar en 5 o 6 niveles,
puede ser con texto, con estrellas, con números, etc)
Origen (opcional): País de origen de la receta.
Tipo (opcional): categorización en tipos de comidas opcional
Observaciones: Texto libre que permite agregar acotaciones.
Recetas relacionadas: Lista de recetas relacionadas
Información adicional (opcional) del tipo etiqueta=valor, por ej. Grasas=Alto o
Habilitado=Diabético, Celíaco o Costo=$$$ o
```

### Ejemplo de Receta

```
RECETA "Brownies de Chocolate"
INGREDIENTES:
harina 200 g
azúcar 0,5 kg
manteca 5 cucharas
aceite 0,3 l
chocolate 1/2 taza
huevo 3 u
vainilla 1 cucharita
PASOS:
```
1. Derretir manteca y chocolate.
2. Agregar azúcar y huevos.
3. Incorporar harina.
4. Hornear 30 min a 180C.
Tiempo: 45 min
Porciones: 8
Calorías: 150 Kcal
Categorías: [Merienda, Postre]
Origen: Italia
Dificultad: MEDIA
Tipo: VEGETARIANO
Recetas relacionadas: "Torta blanda chocolate", "Torta micro chocolate"
Obs: "Ideal para acompañar con helado. Se puede agregar nueces."

```
RECETA "Guiso"
INGREDIENTES:
chorizo 500 g
lentejas 0,5 kg
salsa tomate 0,3 l
cebolla 0.5 kg
morrón 2 u
sal a gusto
pimienta a gusto
PASOS:
```
1. Calentar
2. hervir
3. ...
4. ...
Tiempo: 1h 15 min
Porciones: 20
Calorías: 150 Kcal


```
Categorías: [Principal]
Origen: Uruguay
Dificultad: ***
Tipo: Proteico
Recetas relacionadas: "Torta blanda chocolate", "Torta micro chocolate"
Obs: "Ideal para acompañar con helado. Se puede agregar nueces."
```
## Problema a Resolver

**Objetivo** : Diseñar e implementar un analizador léxico (JFlex) y un analizador sintáctico (CUP) que
procese archivos de recetas y valide su estructura.

### Requisitos Mínimos

1. Reconocer el formato básico de un recetario completo.
2. Identificar y validar todas las partes de una receta
3. Identificar y validar los ingredientes, sus cantidades y unidades de medida
4. Procesar la lista de pasos numerados
5. Soporte para múltiples recetas en un archivo
6. Permitir manejar información adicional de manera flexible. Por ejemplo: Etiqueta=valor, v3 y
    Etiqueta2=otrovalor
7. Reportar errores de formato cuando sea necesario

### Consideraciones de Diseño

```
¿Qué elementos son obligatorios y cuáles opcionales?
¿Cómo manejar diferentes unidades de medida?
¿Qué hacer con las variaciones en el formato?
¿Cómo estructurar la gramática para máxima flexibilidad?
```
## Desafíos Adicionales (Opcionales)

Los estudiantes pueden considerar implementar:


A. **Existencia de recetas relacionadas** Validar que existen en el recetarios todas las recetas
relacionadas
B. **Ingredientes vs. Unidades posibles** Relacionar ingredientes e unidades de medida posibles. Por
ejemplo: la leche puede ser en litros o tazas o ml o cm3 o cucharas, pero no puede ser en cucharitas
ni en kg,
C. **Extensión "Carrito de compras"** : Programar en CUP la lógica para procesar una entrada del tipo
"CARRITO: 20 personas, RECETAS: [brownies, tortilla española, guiso, churrascos]" y generar como
salida una lista consolidada de ingredientes con las cantidades totales calculadas (escalando
porciones y sumando ingredientes comunes).
D. **Aceptar diferentes formatos de tiempos** : Aceptar diferentes formatos de tiempo (1h 15m o 1 15'
1h 1/4 1,25h o 75m o 75min o 5/4h )
E. **Extensión "Resumen de Recetas"** : Programar en CUP la lógica para que al parsear un recetario,
se genere información totalizada. Por ejemplo: Cantidades por tipo de comida, Porcentajes por
procedencia, Cantidad de recetas por nivel de dificultad, Promedio de tiempo de recetas por nivel de
dificultad o por tipo.

F. **Generación automática de un menú semanal** Generar un menú randómico de una cantidad tope
de Calorias por día. Considerando 1 porción para el desayuno, almuerzo, merienda y cena.
Por ejemplo:
Entrada: MENU "ligth", CALORIAS=
Salida:
Lunes= {Queso, Guizo, huevos revueltos, pescado alemán}
...
Domingo= {waffles salados, tarta zapallitos, fiembre y queso, milanesas con puré}

El objetivo es crear un sistema flexible que maneje la información del recetario, permitiendo
diferentes enfoques y niveles de complejidad según los criterios de cada implementación.