#!/bin/bash

# Crear grupo
groupadd profes

# Crear usuarios
useradd ferran
useradd pablo
useradd oriol

# Añadir usuarios al grupo profes
usermod -G profes ferran
usermod -G profes pablo
usermod -G profes oriol

# Crear carpeta compartida
mkdir /tmp/prac3
chown root:profes /tmp/prac3
chmod 2770 /tmp/prac3

# Crear archivo compartido
echo "Archivo compartido" > /tmp/prac3/compartido.txt
chown ferran:profes /tmp/prac3/compartido.txt
chmod 770 /tmp/prac3/compartido.txt

# Crear archivos privados
echo "Archivo privado de Ferran" > /tmp/prac3/ferran.txt
echo "Archivo privado de Pablo" > /tmp/prac3/pablo.txt
echo "Archivo privado de Oriol" > /tmp/prac3/oriol.txt

# Asignar propietarios y grupos
chown ferran:profes /tmp/prac3/ferran.txt
chown pablo:profes /tmp/prac3/pablo.txt
chown oriol:profes /tmp/prac3/oriol.txt

# Permisos privados
chmod 700 /tmp/prac3/ferran.txt
chmod 700 /tmp/prac3/pablo.txt
chmod 700 /tmp/prac3/oriol.txt

# Mostrar resultados
ls -ld /tmp/prac3
ls -l /tmp/prac3
