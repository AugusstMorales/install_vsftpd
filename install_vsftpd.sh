#!/bin/bash

# Script to install, configure, and verify vsftpd on Ubuntu
# Author: AugusstMorales
# Date: March 08, 2025

set -e

VSFTPD_CONF="/etc/vsftpd.conf"
VSFTPD_CONF_BACKUP="${VSFTPD_CONF}.bak"
WRITE_ENABLE_LINE="write_enable=YES"

print_message() {
    echo "[INFO] $1"
}

print_error() {
    echo "[ERROR] $1" >&2
    exit 1
}

check_root() {
    if [[ $EUID -ne 0 ]]; then
        print_error "This script must be run as root or with sudo."
    fi
}

update_packages() {
    print_message "Updating package lists..."
    apt update || print_error "Failed to update package lists. Check your internet connection or repositories."
}

install_vsftpd() {
    print_message "Installing vsftpd..."
    apt install -y vsftpd || print_error "Failed to install vsftpd."
}

backup_config() {
    print_message "Creating a backup of ${VSFTPD_CONF}..."
    cp "${VSFTPD_CONF}" "${VSFTPD_CONF_BACKUP}" || print_error "Failed to backup configuration file."
}

configure_vsftpd() {
    print_message "Enabling write permissions in ${VSFTPD_CONF}..."
    if [ ! -f "${VSFTPD_CONF}" ]; then
        print_error "Configuration file ${VSFTPD_CONF} not found."
    fi
    if grep -q "^#${WRITE_ENABLE_LINE}" "${VSFTPD_CONF}"; then
        sed -i "s/^#${WRITE_ENABLE_LINE}/${WRITE_ENABLE_LINE}/" "${VSFTPD_CONF}" || print_error "Failed to modify configuration."
    elif ! grep -q "^${WRITE_ENABLE_LINE}" "${VSFTPD_CONF}"; then
        echo "${WRITE_ENABLE_LINE}" | tee -a "${VSFTPD_CONF}" > /dev/null || print_error "Failed to append configuration."
    fi
}

restart_service() {
    print_message "Restarting vsftpd service..."
    systemctl restart vsftpd || print_error "Failed to restart vsftpd service."
}

check_service_status() {
    print_message "Checking vsftpd service status..."
    systemctl status vsftpd || print_message "Service status check failed, but installation may still be complete."
}

main() {
    check_root
    update_packages
    install_vsftpd
    backup_config
    configure_vsftpd
    restart_service
    check_service_status
    print_message "vsftpd installation and configuration completed successfully!"
}

main
