#!/bin/bash

DIRECTORIO=$1
BUCKET=$2

if [ -z "$DIRECTORIO" ] || [ -z "$BUCKET" ]; then
  echo "Uso: bash backup_s3.sh <directorio> <bucket>"
  exit 1
fi

if [ ! -d "$DIRECTORIO" ]; then
  echo "Error: el directorio no existe"
  exit 1
fi

echo "Validación correcta"
