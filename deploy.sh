#!/bin/bash

ACCION=$1
INSTANCE_ID=$2
DIRECTORIO=$3
BUCKET=$4

echo "Iniciando proceso de despliegue..."
python3 ec2/gestionar_ec2.py "$ACCION" "$INSTANCE_ID"
./s3/backup_s3.sh "$DIRECTORIO" "$BUCKET"
