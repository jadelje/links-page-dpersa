#!/bin/bash
# Ejecutar UNA SOLA VEZ en el VPS como root o con sudo.
# Instala Docker y prepara el directorio del proyecto.
set -e

echo "==> Actualizando paquetes..."
apt-get update -qq

echo "==> Instalando dependencias..."
apt-get install -y -qq ca-certificates curl gnupg

echo "==> Agregando repositorio oficial de Docker..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -qq

echo "==> Instalando Docker Engine..."
apt-get install -y -qq docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "==> Habilitando Docker al inicio..."
systemctl enable --now docker

echo "==> Abriendo puerto 80 en el firewall (ufw)..."
ufw allow 80/tcp || true
ufw allow 22/tcp || true   # SSH — no cerrar nunca
ufw --force enable || true

echo "==> Creando directorio del proyecto..."
mkdir -p /opt/dpersa-links

echo ""
echo "✓ VPS listo. Ahora corre el script deploy.sh desde tu máquina local."
