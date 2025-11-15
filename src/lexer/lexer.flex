import java_cup.runtime.*;

%%

%class Lexer
%unicode
%line
%column
%cup

%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}

/* Definiciones de patrones */
LETRA = [a-zA-ZáéíóúÁÉÍÓÚñÑ]
DIGITO = [0-9]
NUMERO = {DIGITO}+
DECIMAL = {NUMERO}"."{NUMERO}
FRACCION = {NUMERO}"/"{NUMERO}
PALABRA = {LETRA}+
CADENA = \"[^\"]*\"
ESPACIO = [ \t\r]+
NUEVA_LINEA = \n

%%

/* Palabras clave */
"RECETA"           { return symbol(sym.RECETA); }
"INGREDIENTES"     { return symbol(sym.INGREDIENTES); }
"PASOS"            { return symbol(sym.PASOS); }
"Tiempo"           { return symbol(sym.TIEMPO); }
"Porciones"        { return symbol(sym.PORCIONES); }
"Calorias"         { return symbol(sym.CALORIAS); }
"Categorias"       { return symbol(sym.CATEGORIAS); }
"Dificultad"       { return symbol(sym.DIFICULTAD); }
"Origen"           { return symbol(sym.ORIGEN); }
"Tipo"             { return symbol(sym.TIPO); }
"Obs"              { return symbol(sym.OBS); }
"Recetas"          { return symbol(sym.RECETAS); }
"relacionadas"     { return symbol(sym.RELACIONADAS); }

/* Unidades de medida */
"g"                { return symbol(sym.GRAMOS); }
"kg"               { return symbol(sym.KILOS); }
"l"                { return symbol(sym.LITROS); }
"ml"               { return symbol(sym.MILILITROS); }
"u"                { return symbol(sym.UNIDADES); }
"min"              { return symbol(sym.MINUTOS); }
"Kcal"             { return symbol(sym.KCAL); }

/* Símbolos */
":"                { return symbol(sym.DOS_PUNTOS); }
"."                { return symbol(sym.PUNTO); }
"="                { return symbol(sym.IGUAL); }
","                { return symbol(sym.COMA); }
"["                { return symbol(sym.CORCHETE_IZQ); }
"]"                { return symbol(sym.CORCHETE_DER); }
"*"                { return symbol(sym.ASTERISCO); }

/* Números y texto */
{NUMERO}           { return symbol(sym.NUMERO, Integer.valueOf(yytext())); }
{DECIMAL}          { return symbol(sym.DECIMAL, Double.valueOf(yytext())); }
{FRACCION}         { return symbol(sym.FRACCION, yytext()); }
{CADENA}           { return symbol(sym.CADENA, yytext()); }
{PALABRA}          { return symbol(sym.PALABRA, yytext()); }

/* Espacios y nueva línea */
{ESPACIO}          { /* ignorar espacios */ }
{NUEVA_LINEA}      { return symbol(sym.NUEVA_LINEA); }

/* Error para caracteres no reconocidos */
.                  { throw new Error("Carácter ilegal: " + yytext()); }
