#!/bin/bash

mkdir -p mods

echo "Baixando dependencias do Fabric e Cobblemon..."

# Fabric API 0.92.2+1.20.1
curl -fL -o mods/fabric-api.jar https://cdn.modrinth.com/data/P7R216yM/versions/K3S2N3gE/fabric-api-0.92.2%2B1.20.1.jar

# Architecture API
curl -fL -o mods/architectury.jar https://cdn.modrinth.com/data/lhA11yRo/versions/v4i3f6X6/architectury-9.2.14-fabric.jar

# Cobblemon 1.5.2 (1.20.1)
curl -fL -o mods/Cobblemon-fabric-1.5.2+1.20.1.jar https://cdn.modrinth.com/data/1K3C899a/versions/9S7kQJvX/Cobblemon-fabric-1.5.2%2B1.20.1.jar

echo "Aceitando EULA..."
echo "eula=true" > eula.txt

echo "Baixando Fabric Server Installer..."
curl -fL -o fabric-server-launch.jar https://meta.fabricmc.net/v2/versions/loader/1.20.1/0.15.11/1.0.1/server/jar

echo "Iniciando Servidor Minecraft..."
java -Xmx6G -Xms2G -jar fabric-server-launch.jar nogui