# Directorios
SRC_DIR = src
BUILD_DIR = build
LIB_DIR = lib
LEXER_DIR = $(SRC_DIR)/lexer
PARSER_DIR = $(SRC_DIR)/parser
MAIN_DIR = $(SRC_DIR)/main

# Archivos
LEXER_FLEX = $(LEXER_DIR)/lexer.flex
PARSER_CUP = $(PARSER_DIR)/parser.cup
MAIN_JAVA = $(MAIN_DIR)/Main.java

# JARs
CUP_JAR = $(LIB_DIR)/java-cup-11b.jar
CUP_RUNTIME_JAR = $(LIB_DIR)/java-cup-11b-runtime.jar

# Classpath
CLASSPATH = $(BUILD_DIR):$(CUP_RUNTIME_JAR)

.PHONY: all clean lexer parser compile run

all: compile

# Generar el lexer
lexer:
	@echo "Generando lexer..."
	jflex -d $(BUILD_DIR) $(LEXER_FLEX)

# Generar el parser
parser:
	@echo "Generando parser..."
	java -jar $(CUP_JAR) -destdir $(BUILD_DIR) $(PARSER_CUP)

# Compilar todo
compile: lexer parser
	@echo "Compilando clases Java..."
	javac -cp $(CLASSPATH) -d $(BUILD_DIR) $(BUILD_DIR)/*.java $(MAIN_JAVA)

# Ejecutar con archivo de ejemplo
run: compile
	@echo "Ejecutando con archivo de ejemplo..."
	java -cp $(CLASSPATH) Main examples/receta_simple.txt

# Limpiar archivos generados
clean:
	@echo "Limpiando archivos generados..."
	rm -rf $(BUILD_DIR)/*

# Crear directorio build si no existe
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
