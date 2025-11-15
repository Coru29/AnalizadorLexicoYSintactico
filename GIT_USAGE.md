# Control de Versiones - Guía de Uso

## Estado del Repositorio

✅ **Repositorio Git inicializado**
- Commit inicial realizado con todo el proyecto funcional
- `.gitignore` configurado para ignorar archivos generados
- Configuración local de usuario establecida

## Comandos Útiles

### Ver estado actual
```bash
git status
```

### Ver historial de commits
```bash
git log --oneline
git log --graph --oneline --all
```

### Agregar cambios
```bash
# Agregar archivos específicos
git add archivo.txt

# Agregar todos los cambios
git add .

# Ver qué se va a commitear
git status
```

### Hacer commit
```bash
git commit -m "Descripción del cambio"
```

### Ver diferencias
```bash
# Ver cambios no commiteados
git diff

# Ver cambios en el área de staging
git diff --cached

# Ver cambios entre commits
git diff HEAD~1 HEAD
```

### Branches (para desarrollo futuro)
```bash
# Crear nueva rama
git branch nueva-funcionalidad

# Cambiar a una rama
git checkout nueva-funcionalidad

# Crear y cambiar en un comando
git checkout -b nueva-funcionalidad

# Ver todas las ramas
git branch -a
```

## Flujo de Trabajo Recomendado

1. **Hacer cambios** en el código
2. **Compilar y probar** que funcione
   ```bash
   make clean && make compile && make run
   ```
3. **Ver qué cambió**
   ```bash
   git status
   git diff
   ```
4. **Agregar cambios**
   ```bash
   git add .
   ```
5. **Hacer commit**
   ```bash
   git commit -m "Descripción clara del cambio"
   ```

## Ejemplos de Mensajes de Commit

- `"Agregar soporte para múltiples recetas en un archivo"`
- `"Corregir error en parsing de categorías múltiples"`
- `"Mejorar manejo de errores en analizador léxico"`
- `"Agregar nuevos ejemplos de recetas"`
- `"Actualizar documentación del README"`

## Archivos Ignorados

El `.gitignore` está configurado para ignorar:
- `build/` - Archivos compilados
- `*.class` - Clases Java compiladas
- `*.java~` - Backups de JFlex
- Archivos del sistema (`.DS_Store`, etc.)
- Archivos temporales y de IDEs

## Backup y Seguridad

Para hacer backup del repositorio:
```bash
# Comprimir todo el proyecto (incluyendo .git)
tar -czf recetario-backup-$(date +%Y%m%d).tar.gz .

# O copiar a otra ubicación
cp -r . /ruta/backup/recetario-$(date +%Y%m%d)/
```
