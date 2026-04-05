#!/usr/bin/env python3

import sys
import boto3

def listar_instancias():
    ec2 = boto3.client('ec2')
    response = ec2.describe_instances()
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            print(f"ID: {instance['InstanceId']} | Estado: {instance['State']['Name']}")

def iniciar_instancia(instance_id):
    ec2 = boto3.client('ec2')
    ec2.start_instances(InstanceIds=[instance_id])
    print(f"Instancia {instance_id} iniciada correctamente")

def detener_instancia(instance_id):
    ec2 = boto3.client('ec2')
    ec2.stop_instances(InstanceIds=[instance_id])
    print(f"Instancia {instance_id} detenida correctamente")

def terminar_instancia(instance_id):
    ec2 = boto3.client('ec2')
    ec2.terminate_instances(InstanceIds=[instance_id])
    print(f"Instancia {instance_id} terminada correctamente")

def main():
    if len(sys.argv) < 2:
        print("Uso: python3 gestionar_ec2.py [listar|iniciar|detener|terminar] [instance_id]")
        sys.exit(1)

    accion = sys.argv[1]

    if accion == "listar":
        listar_instancias()
    elif accion == "iniciar":
        if len(sys.argv) < 3:
            print("Debes proporcionar un instance_id")
            sys.exit(1)
        iniciar_instancia(sys.argv[2])
    elif accion == "detener":
        if len(sys.argv) < 3:
            print("Debes proporcionar un instance_id")
            sys.exit(1)
        detener_instancia(sys.argv[2])
    elif accion == "terminar":
        if len(sys.argv) < 3:
            print("Debes proporcionar un instance_id")
            sys.exit(1)
        terminar_instancia(sys.argv[2])
    else:
        print("Acción aún no implementada")

if __name__ == "__main__":
    main()

