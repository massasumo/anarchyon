#!/bin/bash
set -e

mkdir -p mods

echo "=== Baixando Cobblemon 1.5.2 (Minecraft 1.20.1) ==="
# Link direto e permanente da versão oficial do Cobblemon 1.5.2 para Fabric 1.20.1
curl -fSL -o mods/Cobblemon-fabric-1.5.2.jar "https://cdn.modrinth.com/data/1K3C899a/versions/9S7kQJvX/Cobblemon-fabric-1.5.2%2B1.20.1.jar"

echo "=== Aceitando EULA ==="
echo "eula=true" > eula.txt

echo "=== Baixando Fabric Server Installer ==="
curl -fSL -o fabric-installer.jar https://meta.fabricmc.net/v2/versions/installer/1.0.1/server/jar

echo "=== Instalando e Iniciando o Servidor ==="
java -Xmx2G -jar fabric-installer.jar --mcversion 1.20.1 --loader 0.16.10 --downloadMinecraft

java -Xmx4G -jar fabric-server-launch.jar nogui