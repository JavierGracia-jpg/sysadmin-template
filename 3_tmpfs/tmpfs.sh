#!/bin/bash

# Crear carpeta
mkdir -p /mnt/tmpfs

# Montar tmpfs de 1 GB
mount -t tmpfs -o size=1G tmpfs /mnt/tmpfs

# Comprobar
df -h /mnt/tmpfs
