#!/bin/bash

ACCION=$1
INSTANCE_ID=$2
DIRECTORIO=$3
BUCKET=$4

if [ -z "$ACCION" ] || [ -z "$INSTANCE_ID" ] || [ -z "$DIRECTORIO" ] || [ -z "$BUCKET" ]; then
  echo "Uso: ./deploy.sh <accion> <instance_id> <directorio> <bucket>"
  exit 1
fi

echo "Iniciando proceso de despliegue..."

python3 ec2/gestionar_ec2.py "$ACCION" "$INSTANCE_ID"
if [ $? -ne 0 ]; then
  echo "Error en la operación EC2"
  exit 1
fi

./s3/backup_s3.sh "$DIRECTORIO" "$BUCKET"
if [ $? -ne 0 ]; then
  echo "Error en el backup S3"
  exit 1
fi
