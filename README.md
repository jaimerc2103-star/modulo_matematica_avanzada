# ACTUALIZACIÓN: CORRECCIÓN DE VISUALIZACIÓN (26 DE OCTUBRE DE 2026)

**Para consultar el libro con el diseño completo, haga doble clic en `ABRIR_LIBRO_COMPLETO.html` después de descomprimir el ZIP.** Es un HTML **autosuficiente**: contiene el estilo, los capítulos, las gráficas SVG y el motor de fórmulas matemáticas. No necesita servidor, conexión a Internet ni archivos CSS externos.

También puede entrar en `docs/index.html` y navegar capítulo por capítulo. Ahora todas las páginas HTML incluyen **CSS de respaldo dentro del propio HTML**, y `docs/assets/mathjax/tex-svg.js` permite representar fórmulas sin utilizar un CDN. Para publicar en GitHub Pages, cargue todas las carpetas y seleccione rama `main` + carpeta `/docs`.

**Se repararon** los comandos LaTeX que habían quedado dañados (`\approx`, `\alpha`, `\arctan`, `\tan`, `\tau`, `\ne`) y se conservaron los siete capítulos, ejemplos, ejercicios y actividades de la edición ampliada.

MathJax se redistribuye conforme a su licencia Apache 2.0, que se incluye en `docs/assets/mathjax/LICENSE`.

---

# Matemática Avanzada con MATLAB — Edición ampliada del Bloque 1

**Universidad Católica de Cuenca · Ingeniería Civil · Cuarto ciclo · MT-IC-04**  
**Periodo académico:** septiembre 2026 – febrero 2027.

Proyecto académico preparado para editar los ejemplos en **MATLAB Editor / Live Editor** y publicar una versión web estática en **GitHub Pages**, siguiendo el concepto del módulo de Señales y Sistemas.

## Qué incluye la edición actualizada

- **7 capítulos del Bloque 1**, correspondientes a los apartados 1.1–1.7 del sílabo.
- **21 problemas matemáticos resueltos paso a paso**, tres por capítulo, con comprobación y análisis.
- **98 ejercicios propuestos graduados**, catorce por capítulo, en niveles conceptual, procedimental y aplicado.
- **28 actividades**, cuatro al final de cada capítulo (taller, MATLAB, sensibilidad y aplicación).
- **21 preguntas de autoevaluación conceptual**, con respuestas desplegables en la web.
- **Respuestas seleccionadas**, expresadas como apoyo para verificar resultados, no como sustituto de la resolución.
- **7 scripts MATLAB ampliados**, con experimentos reproducibles, variación de parámetros y validación con `ode45`.
- Índice, navegación entre capítulos, ecuaciones con MathJax y estilo apto para lectura desde móvil o impresión.

Los **Bloques 2, 3 y 4** se muestran en el índice según el sílabo, pero sus capítulos todavía no están desarrollados; no se indica ni simula que están completos.

## Estructura de las carpetas

```text
modulo-matematica-avanzada-EDICION-AMPLIADA/
├── README.md
├── .gitignore
├── publicar_capitulos.m              # MATLAB -> HTML de ejecución
├── sincronizar_codigo.m              # Copia .m a docs/codigo
├── docs/
│   ├── .nojekyll
│   ├── index.html                     # Portada GitHub Pages
│   ├── capitulos/
│   │   ├── cap_01.html
│   │   ├── ...
│   │   └── cap_07.html
│   ├── codigo/                        # Descarga pública de los archivos .m
│   │   └── cap_*.m
│   └── assets/
│       ├── styles.css
│       └── fig_cap_*.svg
├── live_scripts/
│   └── bloque_1/
│       └── cap_*.m                    # Fuente editable en MATLAB
├── funciones/
├── markdown/
└── recursos/
    ├── fuentes.md
    └── indice_ampliado.json
```

## Primeros pasos: abrir en MATLAB

1. Descomprima el ZIP completo (no abra solo un archivo suelto).
2. Abra MATLAB y establezca la carpeta raíz del proyecto como **Current Folder**.
3. Abra `live_scripts/bloque_1/cap_01_intro_edo.m`, por ejemplo con:

   ```matlab
   edit('live_scripts/bloque_1/cap_01_intro_edo.m')
   ```

4. Ejecute cada sección del archivo delimitada con `%%` y revise las figuras y mensajes de resultados.
5. Modifique los parámetros de los experimentos y documente qué cambia matemáticamente y qué cambia físicamente.
6. Si necesita un documento **.mlx**, cree/guarde el archivo como Live Script según las opciones disponibles en su versión de MATLAB. Se proporcionan archivos `.m` originales, no `.mlx` fabricados.

**Requisitos:** MATLAB con funciones matemáticas básicas, gráficos y `ode45`. No es necesario Symbolic Math Toolbox para los ejemplos entregados. **Importante:** esta edición no ha sido ejecutada en MATLAB en el entorno de generación; los procedimientos analíticos y la estructura se han revisado, pero debe realizar una prueba de ejecución en su instalación antes de emplear la salida de los scripts para calificación.

## Publicar los capítulos como web en GitHub Pages

1. Cree un repositorio público `modulo-matematica-avanzada` en la cuenta deseada.
2. Cargue **todo el contenido interno** de esta carpeta a la raíz del repositorio, conservando `docs/index.html` y los demás subdirectorios.
3. En el repositorio, vaya a **Settings > Pages > Build and deployment**.
4. Elija **Deploy from a branch**, rama **main**, carpeta **/docs** y guarde.
5. Una vez GitHub Pages publique el sitio, consulte `https://USUARIO.github.io/modulo-matematica-avanzada/`.
6. Compruebe las siete páginas, los menús, las figuras SVG, las fórmulas MathJax y la descarga de scripts.

**No suba el archivo ZIP sin extraerlo** como sustituto de las carpetas; GitHub Pages necesita encontrar `docs/index.html`.

### Cómo sincronizar los archivos MATLAB y el sitio

El material de lectura está en `docs/capitulos/`. Los scripts originales viven en `live_scripts/bloque_1/`. Cuando cambie un script:

```matlab
sincronizar_codigo
```

Esto actualiza su copia descargable en `docs/codigo/`. Si además quiere generar una página HTML a partir de la ejecución de los scripts:

```matlab
publicar_capitulos
```

La salida generada por `publish` se deposita en `docs/matlab_export/` y **no reemplaza los capítulos didácticos escritos en HTML**, porque estos incluyen teoría, ejemplos y actividades adicionales. Ejecutar `publicar_capitulos` requiere una instalación de MATLAB que soporte `publish` para scripts `.m`.

La configuración con MathJax usa una CDN externa, de modo que los navegadores requieren Internet para renderizar correctamente las fórmulas matemáticas por primera vez. GitHub Pages **no ejecuta MATLAB**: solo sirve contenido estático.

## Criterios didácticos

El capítulo debe recorrerse en este orden: (1) objetivo y definiciones, (2) método y supuestos, (3) tres ejemplos resueltos, (4) experimento de MATLAB, (5) catorce ejercicios, (6) cuatro actividades de aplicación y (7) autoevaluación. Cada actividad incluye una indicación de evidencia mínima.

Hay una rúbrica **orientativa** de 5 puntos en cada capítulo. Esto **no modifica el sílabo**, cuyo esquema evaluativo mantiene: contacto con el docente 30 puntos, trabajo autónomo 20, componente práctico-experimental 20, interciclo 10 y evaluación final 20 (total 100). El trabajo de investigación formativa se conserva como referente del componente correspondiente con 10 puntos, conforme al sílabo adjunto.

## Nota editorial y académica

Los conceptos y métodos se fundamentan en el sílabo oficial, la presentación de la asignatura y la bibliografía mencionada en el sílabo (Calderón, Arango y Gómez, 2023; Zill, 2015). **No se redistribuyen páginas, diagramas ni imágenes del libro protegido por derechos de autor** facilitado como referencia. Los desarrollos matemáticos, ejemplos y actividades se redactaron para este proyecto.

La identificación institucional describe el contexto educativo. Este material no se presenta como una publicación oficial validada o aprobada por la institución.
