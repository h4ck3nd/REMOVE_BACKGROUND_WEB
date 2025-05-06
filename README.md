# Proyecto: Eliminar Fondo de Imágenes con IA

## Descripción General

Este proyecto proporciona una página web donde los usuarios pueden subir imágenes y eliminar el fondo automáticamente mediante el uso de la API de Remove.bg. La eliminación de fondo es realizada por una inteligencia artificial, que procesa la imagen en tiempo real. El usuario puede descargar la imagen procesada o continuar subiendo más imágenes.

## Funcionalidad de la Página:

1. **Subir una Imagen**: 
   - El usuario selecciona una imagen desde su dispositivo y la sube al servidor a través de un formulario.

2. **Proceso de Eliminación de Fondo**:
   - Una vez que la imagen se sube, el backend (en Java) utiliza la API de Remove.bg para eliminar el fondo de la imagen.

3. **Resultado Final**:
   - Después de procesar la imagen, el usuario ve la imagen sin fondo en una vista previa. También se le ofrece un enlace para descargar la imagen procesada.

4. **Historial de Imágenes**:
   - Las imágenes procesadas se mantienen en un historial en la sesión para que el usuario pueda acceder a ellas en el futuro.

## ¿Cómo Funciona?

1. **Subir una Imagen**:
   - El usuario sube una imagen en formato `jpg` o `png`.

2. **Procesamiento**:
   - La imagen es enviada al servidor, donde se ejecuta un proceso en segundo plano para eliminar el fondo.
   - Esto se logra utilizando la API de Remove.bg, que proporciona una solución basada en inteligencia artificial para detectar y eliminar el fondo.

3. **Mostrar Resultado**:
   - Cuando el proceso termina, la imagen procesada se muestra al usuario con la opción de descargarla.

## Instrucciones para Implementación en Eclipse

1. **Crear un Proyecto Dynamic Web**:
   - En Eclipse, selecciona `File -> New -> Dynamic Web Project`.
   - Asigna un nombre y crea el proyecto.

2. **Agregar Dependencias**:
   - Asegúrate de tener las dependencias necesarias para Servlets en tu proyecto.

3. **Configurar Servlets**:
   - Crea los servlets `UploadServlet` y `DownloadServlet`, y configúralos en `web.xml`.

4. **Obtener el Token de la API de Remove.bg**:
   - Regístrate en la [página oficial de Remove.bg](https://www.remove.bg/api) y obtén un token de API.
   - Coloca este token en el código en el lugar indicado: `<TOKEN>`.

5. **Desplegar en un Servidor**:
   - Puedes ejecutar el proyecto en un servidor como Apache Tomcat desde Eclipse.
   - Una vez que el servidor esté corriendo, accede a la página web para probar la funcionalidad.
