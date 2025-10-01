#!/bin/bash

echo "Limpiando ambiente de desarrollo..."

# Detener y remover contenedores
docker compose --env-file ../.env.dev -f ../docker-compose.dev.yml down

# Remover volumenes (opcional - descomentar para resetear BD)
# docker compose --env-file ../.env.dev -f ../docker-compose.dev.yml down -v

echo "Ambiente de desarrollo limpio!"