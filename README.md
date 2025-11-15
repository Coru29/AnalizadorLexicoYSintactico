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
make run-decimales    # Ejecuta ejemplo con decimales y fracciones
make run-tiempos      # Ejecuta ejemplos con diferentes formatos de tiempo
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

El compilador reconoce el siguiente formato completo:

```
RECETA "Nombre de la Receta"
INGREDIENTES:
ingrediente cantidad unidad
ingrediente cantidad unidad
PASOS:
1. Paso
2. Paso
Tiempo: cantidad formato_tiempo
Porciones: cantidad
Calorias: cantidad Kcal
Categorias: [categoria1, categoria2]
Dificultad: nivel_o_estrellas
Obs: "Observaciones de la receta"
Recetas relacionadas: "Receta1", "Receta2"
Etiqueta=Valor
```

### Ejemplo Completo:
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
Categorias: [Postre]
Dificultad: FACIL
Obs: "Receta básica y simple"
Recetas relacionadas: "Cookies"
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
- `Categorias`, `Dificultad`, `Obs`, `Recetas relacionadas`

### Unidades de Medida:
- **Ingredientes:** `g` (gramos), `kg` (kilos), `l` (litros), `ml` (mililitros), `u` (unidades)
- **Tiempo:** `min` (minutos), `m` (minutos corto), `h` (horas), `'` (apostrofe)
- **Calorías:** `Kcal` (kilocalorías)

### Tipos de Datos:
- Números enteros
- Números decimales
- Fracciones (ej: 1/2)
- Cadenas entre comillas
- Palabras simples

## Estado Actual

✅ **PROYECTO COMPLETO - Cumple TODOS los requisitos mínimos:**

### **Requisitos Básicos Implementados:**
- ✅ Reconocer el formato básico de un recetario completo
- ✅ Identificar y validar todas las partes de una receta
- ✅ Identificar y validar ingredientes, cantidades y unidades de medida
- ✅ Procesar la lista de pasos numerados
- ✅ Soporte para múltiples recetas en un archivo
- ✅ Permitir información adicional flexible (etiqueta=valor)
- ✅ Reportar errores de formato cuando sea necesario

### **Campos Completos Soportados:**
- ✅ **Nombre de receta** (cadenas entre comillas)
- ✅ **Ingredientes** con cantidades (enteros, decimales, fracciones) y unidades
- ✅ **Pasos de preparación** numerados (hasta 3 palabras por paso)
- ✅ **Tiempo** con múltiples formatos (75 min, 1h 15m, 1.25h, 5/4h, etc.)
- ✅ **Porciones** (números enteros)
- ✅ **Calorías** (números + Kcal)
- ✅ **Categorías** múltiples entre corchetes [Postre, Merienda]
- ✅ **Dificultad** flexible (texto: FACIL/MEDIA/ALTA o estrellas: *//**//***)
- ✅ **Observaciones** (texto libre entre comillas)
- ✅ **Recetas relacionadas** (lista de recetas entre comillas)
- ✅ **Información adicional** (formato clave=valor)

### **Extensiones Implementadas:**
- ✅ **Formatos de tiempo flexibles** (Extensión D): 8 formatos diferentes
- ✅ **Tokenización detallada** con información completa de cada elemento
- ✅ **Múltiples ejemplos** de prueba para cada funcionalidad

### **Características Técnicas:**
- **38 tokens terminales** reconocidos
- **26 símbolos no terminales** en la gramática
- **53 reglas de producción** implementadas
- **Análisis LALR(1)** sin conflictos
- **Manejo de errores** léxicos y sintácticos
- **Separación clara** entre análisis léxico (JFlex) y sintáctico (CUP)

### **Formatos de Tiempo Soportados:**
```
75 min      # Formato básico con minutos
75 m        # Minutos en formato corto
1 h         # Solo horas
1.25 h      # Horas con decimales
5/4 h       # Horas con fracciones
1 h 15 m    # Horas y minutos combinados
1 h 1/4     # Horas y fracciones combinadas
1 15'       # Formato con apostrofe
```


## Archivos Generados

Al compilar, se generan automáticamente:
- `build/Lexer.java` - Analizador léxico
- `build/parser.java` - Analizador sintáctico
- `build/sym.java` - Símbolos terminales
- `build/*.class` - Clases compiladas
