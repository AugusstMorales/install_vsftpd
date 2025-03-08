# Condiciones para que el script funcione sin problemas

A continuación se detallan los requisitos y condiciones necesarios para que el script de instalación y configuración de `vsftpd` funcione correctamente:

- **Sistema operativo**:  
  Debe ser Ubuntu o una distribución basada en Debian que utilice `apt` como gestor de paquetes y `systemd` para la gestión de servicios. Si utilizas una versión muy antigua (por ejemplo, Ubuntu 16.04) o una distribución diferente (como CentOS), el script requerirá ajustes específicos.

- **Permisos**:  
  Es necesario ejecutarlo con privilegios de superusuario, ya sea utilizando `sudo` o directamente como usuario `root`. Esto se debe a que el script instala paquetes, modifica archivos del sistema y gestiona servicios.

- **Conexión a internet**:  
  Se requiere acceso a los repositorios oficiales de Ubuntu para descargar el paquete `vsftpd` mediante `apt`. Sin conexión, la instalación fallará.

- **Estado inicial**:  
  Si `vsftpd` ya está instalado o configurado de manera diferente en el sistema, el script asumirá que puede sobrescribir la configuración existente. Antes de realizar cambios, se creará una copia de seguridad del archivo de configuración original.

Asegúrate de cumplir con estas condiciones antes de ejecutar el script para garantizar una instalación y configuración sin inconvenientes.
