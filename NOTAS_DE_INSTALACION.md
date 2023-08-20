# Notas LibreBooking - 20230708

## Instalación

- correr `docker compose up`
- instalar base de datos en http://HOST:PORT/Web/install/index.php
- clickear en creacion de base de datos y usuario en la web de instalación, al darle Aceptar, debería correr las migraciones que crean nuestro esquema
- configurar en http://HOST:PORT/Web/install/configure.php (password: hdLbzuZMHNYUJRzE)

## Anotaciones

- el docker compose incluye una base de datos MariaDB, se puede configurar otra en tanto y cuanto se llegue desde el contenedor.
- también se monta como volumen la carpeta de los logs, para que sean persistentes. Ojo esta carpeta tiene que ser accesible por el usuario www-data del contenedor (o sea, 777 o un uuid/gid adecuado, recordando que los ids en docker se mantienen entre host y contenedor).
- una vez que sepamos que está andando, mover el install a otro directorio (o directamente eliminarlo), para que no vuelvan a ejecutarse (esto se puede hacer con `docker compose exec lb rm -rf /var/www/librebooking/Web/install`)
