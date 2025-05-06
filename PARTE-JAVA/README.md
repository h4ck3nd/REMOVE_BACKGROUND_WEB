# Explicación del Código de Java

Este proyecto permite quitar el fondo a las imágenes subidas por los usuarios mediante el uso de la API de Remove.bg. A continuación se explican las partes clave del código Java:

## Estructura del Proyecto

### Clases Principales:

1. **UploadServlet.java**: 
   - Este servlet maneja el proceso de subir la imagen y eliminar el fondo usando la API de Remove.bg.
   - La imagen sube al servidor, luego se envía a la API de Remove.bg, que elimina el fondo.
   - El archivo de imagen procesado se devuelve al cliente con la opción de descargarla.

2. **DownloadServlet.java**: 
   - Sirve la imagen procesada al usuario cuando se hace clic en el enlace de descarga.
   - Lee la imagen procesada del sistema de archivos temporal y la envía como respuesta al navegador del usuario.

### Explicación Detallada de `UploadServlet.java`:

- **Método `removeBackground`**: 
  - Este método es una implementación local que usa un umbral de tolerancia para detectar los píxeles de color blanco o casi blanco y los reemplaza por transparencia.
  
- **Método `doPost`**:
  - Primero, recibe la imagen subido por el usuario mediante el parámetro "image".
  - Luego, la guarda temporalmente en el servidor en un archivo temporal.
  - Después, realiza una llamada a la API de Remove.bg usando `curl` para enviar la imagen y eliminar el fondo.
  - Si la llamada es exitosa, guarda el nombre de la imagen procesada en la sesión del usuario para mostrarla en el resultado final y poder realizar un historial de imágenes procesadas.

### Implementación del Token en la API de Remove.bg:

Dentro del método `doPost`, existe una sección donde se llama a la API de Remove.bg usando `curl`. El token de la API es crucial para autenticar las solicitudes. **Debe ser reemplazado con tu propio token**.

```java
String apiKey = "<TOKEN>";  // Cambia <TOKEN> por tu token de la API de Remove.bg
```

- Para obtener tu token de la API:

  - Regístrate en [remove.bg](https://www.remove.bg/api) y obtén un API Key que deberás colocar en <TOKEN>.

## Dependencias:

- Servlet API: Para manejar las solicitudes HTTP y trabajar con servlets.
- API de Remove.bg: Necesitarás tener acceso a esta API para hacer el proceso de eliminación de fondo.

## Configuración de Eclipse:

1. Crear un Proyecto Dynamic Web:

  - En Eclipse, selecciona ``File`` -> ``New`` -> ``Dynamic Web Project``.
  - Asigna un nombre al proyecto y asegúrate de que se añada el soporte de Servlets.

2. Agregar las clases:

  - Crea los servlets ``UploadServlet.java`` y ``DownloadServlet.java``.

3. Configurar el ``web.xml``:

  - Asegúrate de que los servlets estén correctamente configurados en el archivo web.xml de la aplicación web.

4. Corriendo el Proyecto:

  - Después de configurar todo, puedes ejecutar el servidor desde Eclipse y acceder a la aplicación en tu navegador.
