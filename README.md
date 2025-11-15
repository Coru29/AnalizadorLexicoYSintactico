# Compilador de Recetario Digital

Un analizador léxico y sintáctico para procesar archivos de recetas culinarias, implementado con JFlex y CUP.

## Estructura del Proyecto

```
recetario#3/
├── src/
│   ├── lexer/          # Analizador léxico (JFlex)
│   ├── parser/         # Analizador sintáctico (CUP)
│   └── main/           # Clase principal
├── lib/                # Librerías JAR (CUP)
├── build/              # Archivos compilados
├── examples/           # Archivos de ejemplo
├── docs/               # Documentación
├── Makefile           # Automatización
├── GIT_USAGE.md       # Guía de control de versiones
└── .gitignore         # Archivos ignorados por Git
```

## Requisitos

- Java 8 o superior
- JFlex (instalado en el sistema)
- CUP (incluido en lib/)

## Compilación y Ejecución

### Compilar todo el proyecto:
```bash
make compile
```

### Ejecutar con archivo de ejemplo:
```bash
make run              # Ejecuta ejemplo básico (ensalada)
make run-brownies     # Ejecuta ejemplo de brownies completo
make run-guiso        # Ejecuta ejemplo de guiso con estrellas
make run-ensalada     # Ejecuta ejemplo de ensalada básica
make test-all         # Ejecuta TODOS los ejemplos
```

### Limpiar archivos generados:
```bash
make clean
```

### Ejecutar manualmente:
```bash
java -cp build:lib/java-cup-11b-runtime.jar Main examples/brownies_completo.txt
java -cp build:lib/java-cup-11b-runtime.jar Main examples/guiso_completo.txt
java -cp build:lib/java-cup-11b-runtime.jar Main examples/ensalada_basica.txt
```

## Formato de Receta Soportado

El compilador actualmente reconoce el siguiente formato básico:

```
RECETA "Nombre de la Receta"
INGREDIENTES:
ingrediente cantidad unidad
ingrediente cantidad unidad
PASOS:
1. Paso
2. Paso
Tiempo: cantidad min
Porciones: cantidad
Calorias: cantidad Kcal
```

### Ejemplo:
```
RECETA "Brownies Simples"
INGREDIENTES:
harina 200 g
azucar 150 g
huevo 2 u
PASOS:
1. Mezclar
2. Hornear
Tiempo: 45 min
Porciones: 8
Calorias: 150 Kcal
```

## Ejemplos Disponibles

El proyecto incluye varios ejemplos completos en la carpeta `examples/`:

### 1. `brownies_completo.txt` - Ejemplo completo con todos los campos
```
RECETA "Brownies de Chocolate"
INGREDIENTES:
harina 200 g
azucar 500 g
manteca 5 u
aceite 300 ml
chocolate 100 g
huevo 3 u
vainilla 1 u
PASOS:
1. Derretir
2. Agregar
3. Incorporar
4. Hornear
Tiempo: 45 min
Porciones: 8
Calorias: 150 Kcal
Categorias: [Merienda, Postre]
Dificultad: MEDIA
Obs: "Ideal para acompañar con helado. Se puede agregar nueces."
Recetas relacionadas: "Torta blanda chocolate", "Torta micro chocolate"
Grasas=Alto
Vegetariano=Si
```

### 2. `guiso_completo.txt` - Ejemplo con dificultad por estrellas
```
RECETA "Guiso de Lentejas"
...
Dificultad: ***
...
```

### 3. `ensalada_basica.txt` - Ejemplo básico sin información adicional
```
RECETA "Ensalada Verde"
...
(sin información adicional al final)
```

### Probar ejemplos:
```bash
java -cp build:lib/java-cup-11b-runtime.jar Main examples/brownies_completo.txt
java -cp build:lib/java-cup-11b-runtime.jar Main examples/guiso_completo.txt
java -cp build:lib/java-cup-11b-runtime.jar Main examples/ensalada_basica.txt
```

## Tokens Reconocidos

### Palabras Clave:
- `RECETA`, `INGREDIENTES`, `PASOS`
- `Tiempo`, `Porciones`, `Calorias`

### Unidades de Medida:
- `g` (gramos), `kg` (kilos)
- `l` (litros), `ml` (mililitros)
- `u` (unidades), `min` (minutos), `Kcal` (kilocalorías)

### Tipos de Datos:
- Números enteros
- Números decimales
- Fracciones (ej: 1/2)
- Cadenas entre comillas
- Palabras simples

## Estado Actual

✅ **Implementado (Cumple requisitos mínimos):**
- ✅ Reconocer el formato básico de un recetario completo
- ✅ Identificar y validar todas las partes de una receta
- ✅ Identificar y validar ingredientes, cantidades y unidades de medida
- ✅ Procesar la lista de pasos numerados
- ✅ Permitir información adicional flexible (etiqueta=valor)
- ✅ Reportar errores de formato cuando sea necesario
- ✅ Soporte para todos los campos obligatorios:
  - Nombre de receta
  - Ingredientes con cantidades y unidades
  - Pasos de preparación
  - Tiempo, Porciones, Calorías
  - Categorías (desayuno, merienda, principal, entrada, colación, postre)
  - Nivel de dificultad (texto o estrellas)
  - Observaciones (texto libre)
  - Recetas relacionadas

🔄 **Limitaciones actuales:**
- ⚠️ Soporte para múltiples recetas en un archivo (problema con parsing)
- ⚠️ Información adicional funciona pero puede causar errores al final
- ⚠️ Pasos limitados a pocas palabras por paso


## Archivos Generados

Al compilar, se generan automáticamente:
- `build/Lexer.java` - Analizador léxico
- `build/parser.java` - Analizador sintáctico
- `build/sym.java` - Símbolos terminales
- `build/*.class` - Clases compiladas
