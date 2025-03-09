# Automated vsftpd Setup on Ubuntu

This repository contains a Bash script that automates the installation, configuration, and verification of the FTP server `vsftpd` on Ubuntu systems. The script enables write permissions on the configuration file (`/etc/vsftpd.conf`), restarts the service, and displays its status.

## Prerequisites

To ensure the script works properly on your system, make sure the following conditions are met:

- **Operating System**: 
Supported Ubuntu or Debian-based distributions that use `apt` as package manager and `systemd` for service management. Ubuntu 18.04 LTS or higher is recommended. Older versions (such as 16.04) or non-Debian-based distributions (e.g. CentOS) will require modifications to the script.

- **User Permissions**: 
The script must be run with superuser privileges. Use `sudo` when running it or log in as `root` user, as it performs tasks such as installing packages, modifying system files, and managing services.

- **Internet connection**: 
Access to the official Ubuntu repositories is required to download the `vsftpd` package via `apt`. Please verify your connectivity before proceeding.

- **Initial system state**: 
If `vsftpd` is already installed or configured, the script will overwrite the existing configuration after creating a backup of the original file (`/etc/vsftpd.conf.bak`). Be sure to review any previous configuration if it is critical for your environment. de cumplir con estas condiciones antes de ejecutar el script para garantizar una instalación y configuración sin inconvenientes.

## Instructions for Use

1. Give execute permissions: chmod +x install_vsftpd.sh 

2. Run the script with sudo: sudo ./install_vsftpd.sh

## Additional Notes

- The script has been tested on Ubuntu 20.04 and 22.04. For other versions, check the compatibility of the apt and systemd commands.

- In case of errors, check the script output or use journalctl -u vsftpd to debug problems with the service.
