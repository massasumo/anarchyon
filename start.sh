#!/bin/bash

echo "=== Baixando Cobblemon 1.5.2 ==="
mkdir -p mods
wget -O mods/Cobblemon-Fabric-1.5.2+1.20.1.jar "https://cdn.modrinth.com/data/lhGA9TYQ/versions/U6x3aPzC/Cobblemon-Fabric-1.5.2%2B1.20.1.jar"

echo "=== Aceitando EULA ==="
echo "eula=true" > eula.txt

echo "=== Instalando o Servidor Fabric ==="
wget -O fabric-installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/1.1.2/fabric-installer-1.1.2.jar
java -jar fabric-installer.jar server -mcversion 1.20.1 -downloadMinecraft

echo "=== Iniciando o Servidor ==="
java -Xmx6G -Xms2G -jar fabric-server-launch.jar nogui