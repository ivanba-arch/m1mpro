#!/bin/bash

# Script para instalar programas básicos en Fedora Asahi Remix

# Actualizar los paquetes del sistema
echo "Updating system..."
sudo dnf upgrade -y

# Instalar herramientas esenciales
echo "Instalando herramientas básicas..."
sudo dnf install -y \
  git \
  curl \
  wget \
  vim \
  neofetch \
  htop \
  Zim \
  python3 \
  python3-pip

# Instalar algunos programas desde Flatpak
echo "Instalando programas desde Flathub..."
flatpak install -y flathub com.discordapp.Discord \
  com.spotify.Client

# Limpiar paquetes no necesarios
echo "Limpiando paquetes..."
sudo dnf autoremove -y

echo "Instalación completa. ¡Disfruta de tu entorno configurado!"
