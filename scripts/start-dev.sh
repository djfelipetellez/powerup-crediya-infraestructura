#!/bin/bash

echo "Iniciando ambiente de desarrollo..."

# Iniciar servicios directamente (sin -d para ver logs)
docker compose --env-file ../.env.dev -f ../docker-compose.dev.yml up --build

