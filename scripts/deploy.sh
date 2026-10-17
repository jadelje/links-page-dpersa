#!/bin/bash
# Ejecutar directamente en el VPS.
# Primera vez: el script clona el repo.
# Siguientes veces: hace pull y redeploya.
#
# Uso: bash deploy.sh
set -e

REPO="https://github.com/jadelje/links-page-dpersa.git"
APP_DIR="/opt/dpersa-links"

echo "==> Verificando directorio del proyecto..."
if [ -d "$APP_DIR/.git" ]; then
  echo "    Repo existente — actualizando..."
  cd "$APP_DIR"
  git fetch origin
  git reset --hard origin/main
else
  echo "    Inicializando repo en directorio existente..."
  cd "$APP_DIR"
  git init
  git remote add origin "$REPO"
  git fetch origin
  git reset --hard origin/main
fi

echo "==> Construyendo imagen Docker..."
docker compose build --no-cache

echo "==> Reiniciando contenedor..."
docker compose up -d

echo "==> Limpiando imágenes antiguas..."
docker image prune -f

echo ""
echo "✓ Deploy completo."
docker compose ps
