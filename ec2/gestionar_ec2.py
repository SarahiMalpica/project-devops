#!/usr/bin/env python3

import sys
import boto3

def listar_instancias():
    ec2 = boto3.client('ec2')
    response = ec2.describe_instances()
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            print(f"ID: {instance['InstanceId']} | Estado: {instance['State']['Name']}")

def main():
    if len(sys.argv) < 2:
        print("Uso: python3 gestionar_ec2.py listar")
        sys.exit(1)

    accion = sys.argv[1]

    if accion == "listar":
        listar_instancias()
    else:
        print("Acción aún no implementada")

if __name__ == "__main__":
    main()
