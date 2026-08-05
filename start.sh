#!/bin/bash
# Garantir que a pasta mods existe
mkdir -p mods

# Baixar o Cobblemon diretamente da CDN do Modrinth se não estiver presente
COBBLEMON_JAR="mods/Cobblemon-fabric-1.5.2+1.20.1.jar"
if [ ! -f "$COBBLEMON_JAR" ]; then
    echo "Baixando o mod Cobblemon (104MB)..."
    curl -L -o "$COBBLEMON_JAR" "https://cdn.modrinth.com/data/lhGA9vAc/versions/wK15fOag/Cobblemon-fabric-1.5.2%2B1.20.1.jar"
fi

# Download do Fabric Server Launcher 1.20.1
if [ ! -f fabric-server-launch.jar ]; then
    echo "Baixando Fabric Server 1.20.1..."
    curl -o fabric-server-launch.jar https://meta.fabricmc.net/v2/versions/loader/1.20.1/0.15.11/1.0.1/server/jar
fi

# Aceitar EULA
echo "eula=true" > eula.txt

# Iniciar servidor com otimização de RAM (4GB)
java -Xms2048M -Xmx4096M -jar fabric-server-launch.jar nogui
