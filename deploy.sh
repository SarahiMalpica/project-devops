#!/bin/bash

ACCION=$1
INSTANCE_ID=$2
DIRECTORIO=$3
BUCKET=$4
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
LOG="logs/deploy_$FECHA.log"

if [ -z "$ACCION" ] || [ -z "$INSTANCE_ID" ] || [ -z "$DIRECTORIO" ] || [ -z "$BUCKET" ]; then
  echo "Uso: ./deploy.sh <accion> <instance_id> <directorio> <bucket>" | tee -a "$LOG"
  exit 1
fi

echo "Iniciando proceso de despliegue..." | tee -a "$LOG"

python3 ec2/gestionar_ec2.py "$ACCION" "$INSTANCE_ID" >>"$LOG" 2>&1
if [ $? -ne 0 ]; then
  echo "Error en la operación EC2" | tee -a "$LOG"
  exit 1
fi

./s3/backup_s3.sh "$DIRECTORIO" "$BUCKET" >>"$LOG" 2>&1
if [ $? -ne 0 ]; then
  echo "Error en el backup S3" | tee -a "$LOG"
  exit 1
fi

echo "Proceso completado correctamente" | tee -a "$LOG"
