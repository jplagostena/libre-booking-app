# Notas LibreBooking - 20230708

## Instalación

- Configurar la base de datos
- modificar el Dockerfile para poder correr composer y sus dependencias
- cambiar user y passwords de database en docker-compose por los de root para facilitar la puesta de prueba
- meterse dentro del contenedor y ejecutar composer install
- ir http://HOST:PUERTO/Web/install/configure.php, tener el valor de settings install.password a mano (ojo que la entrada puede estar duplicada)
- cambiar la carpeta de logs para alguna que se tenga permiso
- ahora si ir a http://HOST:PUERTO/Web/install/
- cambiar la script.url setting a http://HOST:PUERTO:8080/Web y el default.language a "es"
- clickear en creacion de base de datos y usuario en la web de instalación
- al darle click debería correr las migraciones
- mover el install a otro directorio, para que no vuelvan a ejecutarse
