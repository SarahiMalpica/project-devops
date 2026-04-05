#!/bin/bash

DIRECTORIO=$1
BUCKET=$2
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVO="backup_$FECHA.tar.gz"
LOG="logs/backup_$FECHA.log"

if [ -z "$DIRECTORIO" ] || [ -z "$BUCKET" ]; then
  echo "Uso: bash backup_s3.sh <directorio> <bucket>" | tee -a "$LOG"
  exit 1
fi

if [ ! -d "$DIRECTORIO" ]; then
  echo "Error: el directorio no existe" | tee -a "$LOG"
  exit 1
fi

tar -czf "$ARCHIVO" "$DIRECTORIO" 2>>"$LOG"
aws s3 cp "$ARCHIVO" "s3://$BUCKET/" >>"$LOG" 2>&1

echo "Backup completado correctamente: $ARCHIVO" | tee -a "$LOG"
