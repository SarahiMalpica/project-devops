# Project DevOps

Este proyecto fue desarrollado como una práctica de automatización y despliegue controlado en AWS con enfoque DevOps.

## Objetivo
Automatizar tareas básicas sobre infraestructura en AWS utilizando scripts y buenas prácticas de control de versiones.

## Estructura del proyecto
- `ec2/gestionar_ec2.py`: administra instancias EC2
- `s3/backup_s3.sh`: realiza respaldo y subida a S3
- `deploy.sh`: orquesta el flujo completo
- `config/config.env`: contiene variables de configuración
- `logs/`: almacena bitácoras de ejecución

## Requisitos
- AWS CLI
- Git
- GitHub CLI
- Python 3
- boto3

## Uso
### Listar instancias
```bash
python3 ec2/gestionar_ec2.py listar
```

### Iniciar una instancia
```bash
python3 ec2/gestionar_ec2.py iniciar i-xxxxxxxxxxxx
```

### Ejecutar backup
```bash
./s3/backup_s3.sh ./data tu-bucket
```

### Ejecutar flujo completo
```bash
./deploy.sh iniciar i-xxxxxxxxxxxx ./data tu-bucket
```

## Flujo Git
Se trabajó con ramas `main`, `develop` y `feature/*`, realizando commits progresivos para documentar cada avance.

## Buenas prácticas aplicadas
- separación de configuración y lógica
- uso de parámetros en lugar de hardcoding
- generación de logs
- organización por módulos
