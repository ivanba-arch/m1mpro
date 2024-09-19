#!/bin/bash

# Script para instalar programas básicos en Fedora Asahi Remix

# Actualizar los paquetes del sistema
echo "Actualizando el sistema..."
sudo dnf update -y

# Instalar herramientas esenciales
echo "Instalando herramientas básicas..."
sudo dnf install -y \
  git \
  curl \
  wget \
  vim \
  neofetch \
  htop \
  zsh \
  fzf \
  eza \
  python3 \
  python3-pip

# Instalar flatpak si no está instalado
echo "Instalando Flatpak..."
sudo dnf install -y flatpak

# Añadir repositorio Flathub si no está añadido
echo "Añadiendo repositorio de Flathub..."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instalar algunos programas desde Flatpak
echo "Instalando programas desde Flathub..."
flatpak install -y flathub com.discordapp.Discord \
  com.spotify.Client \
  org.gimp.GIMP \
  org.mozilla.firefox

# Configurar Oh My Zsh si no está instalado
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Instalando Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh ya está instalado."
fi

# Cambiar el shell a Zsh si aún no es el predeterminado
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "Cambiando el shell predeterminado a Zsh..."
  chsh -s $(which zsh)
fi

# Limpiar paquetes no necesarios
echo "Limpiando paquetes..."
sudo dnf autoremove -y

echo "Instalación completa. ¡Disfruta de tu entorno configurado!"
