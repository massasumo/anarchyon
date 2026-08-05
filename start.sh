#!/bin/bash
set -e

echo "=== Aceitando EULA ==="
echo "eula=true" > eula.txt

echo "=== Baixando Fabric Server Installer ==="
curl -fSL -o fabric-installer.jar https://meta.fabricmc.net/v2/versions/installer/1.0.1/server/jar

echo "=== Instalando e Iniciando o Servidor ==="
java -Xmx2G -jar fabric-installer.jar --mcversion 1.20.1 --loader 0.16.10 --downloadMinecraft

java -Xmx4G -jar fabric-server-launch.jar nogui