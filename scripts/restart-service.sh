#!/bin/bash

SERVICE_NAME=$1

if [ -z "$SERVICE_NAME" ]; then
  echo "Uso: ./restart-service.sh <nombre-del-servicio>"
  exit 1
fi

echo "Reconstruyendo y desplegando $SERVICE_NAME..."

# Detener solo el servicio específico
docker compose --env-file ../.env.dev -f ../docker-compose.dev.yml stop $SERVICE_NAME

# Reconstruir y levantar solo ese servicio
docker compose --env-file ../.env.dev -f ../docker-compose.dev.yml up -d --build $SERVICE_NAME

echo "Servicio $SERVICE_NAME actualizado!"