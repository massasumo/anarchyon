#!/bin/bash

mkdir -p mods

echo "--- Baixando dependencias e mods compativeis (Minecraft 1.20.1) ---"

# Fabric API 0.92.2+1.20.1
curl -fL -o mods/fabric-api.jar "https://cdn.modrinth.com/data/P7R216yM/versions/K3S2N3gE/fabric-api-0.92.2%2B1.20.1.jar"

# Architectury API 9.2.14
curl -fL -o mods/architectury.jar "https://cdn.modrinth.com/data/lhA11yRo/versions/v4i3f6X6/architectury-9.2.14-fabric.jar"

# FTB Library 2001.2.5
curl -fL -o mods/ftblibrary.jar "https://cdn.modrinth.com/data/S33A8Iic/versions/3W3OQk1F/ftblibrary-fabric-2001.2.5.jar"

# PacketEvents (Necessario para o GrimAC)
curl -fL -o mods/packetevents.jar "https://cdn.modrinth.com/data/2XpI1320/versions/L854fM2X/packetevents-fabric-2.7.0.jar"

# CristelLib (Necessario para Towns and Towers)
curl -fL -o mods/cristellib.jar "https://cdn.modrinth.com/data/01T9S16W/versions/Jb1vXo2V/cristellib-fabric-1.1.5.jar"

# Cobblemon 1.5.2
curl -fL -o mods/Cobblemon-fabric-1.5.2.jar "https://cdn.modrinth.com/data/1K3C899a/versions/9S7kQJvX/Cobblemon-fabric-1.5.2%2B1.20.1.jar"

echo "Aceitando EULA..."
echo "eula=true" > eula.txt

echo "Baixando Fabric Server Installer atualizado (Loader 0.16.10)..."
curl -fL -o fabric-server-launch.jar "https://meta.fabricmc.net/v2/versions/loader/1.20.1/0.16.10/1.0.1/server/jar"

echo "Iniciando Servidor Minecraft..."
java -Xmx6G -Xms2G -jar fabric-server-launch.jar nogui