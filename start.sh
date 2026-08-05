#!/bin/bash
set -e

MC_VERSION="1.20.1"
LOADER_VERSION="0.16.10"

echo "=== Limpando diretório de mods ==="
mkdir -p mods
rm -rf mods/*

echo "=== Baixando Mods e Dependências para Minecraft $MC_VERSION ==="

# Função para baixar via URL direta de forma segura
download_file() {
    local name=$1
    local url=$2
    echo "Baixando $name..."
    if curl -fSL -s -o "mods/$name.jar" "$url"; then
        echo " -> $name baixado com sucesso."
    else
        echo " Erro ao baixar $name ($url)."
        exit 1
    fi
}

# 1. Fabric API (1.20.1)
download_file "fabric-api" "https://cdn.modrinth.com/data/P7dR8mSH/versions/xhLT3C5f/fabric-api-0.92.11%2B1.20.1.jar"

# 2. Architectury API (1.20.1)
download_file "architectury" "https://cdn.modrinth.com/data/lhGA9TYQ/versions/WbL7MStR/architectury-9.2.14-fabric.jar"

# 3. FTB Library (1.20.1 Fabric v2001.2.5)
download_file "ftb-library" "https://cdn.modrinth.com/data/Ch21O3I3/versions/r3RkXz8M/ftb-library-fabric-2001.2.5.jar"

# 4. FTB Teams (1.20.1 Fabric v2001.3.0)
download_file "ftb-teams" "https://cdn.modrinth.com/data/14Bimfbf/versions/T210fX1P/ftb-teams-fabric-2001.3.0.jar"

# 5. PacketEvents (v2.7.0 / Fabric)
download_file "packetevents" "https://github.com/retrooper/packetevents/releases/download/v2.7.0/packetevents-fabric-2.7.0.jar"

# 6. GrimAC (1.20.1 Fabric v2.3.65)
download_file "grimac" "https://cdn.modrinth.com/data/9eGK36P1/versions/Bms7534q/GrimAC-2.3.65.jar"

# 7. Cristel Lib (1.20.1 v1.1.5)
download_file "cristel-lib" "https://cdn.modrinth.com/data/1e243A26/versions/jR76EwXv/cristellib-fabric-1.1.5.jar"

# 8. Towns and Towers (1.20.1 v1.10.2)
download_file "towns-and-towers" "https://cdn.modrinth.com/data/K3A3423L/versions/K37z0c8T/Towns-and-Towers-1.10.2%2B1.20.1.jar"

# 9. Geyser Fabric (1.20.1 / GeyserMC API)
download_file "geyser" "https://download.geysermc.org/v2/projects/geyser/versions/2.2.0/builds/380/downloads/fabric"

# 10. Fabric Permissions API (v0.3.1)
download_file "fabric-permissions-api" "https://cdn.modrinth.com/data/pA3B9R7T/versions/R4fD4n4p/fabric-permissions-api-0.3.1.jar"

echo "=== Aceitando EULA ==="
echo "eula=true" > eula.txt

echo "=== Baixando Fabric Server Installer ==="
curl -fSL -s -o fabric-installer.jar https://meta.fabricmc.net/v2/versions/installer/1.0.1/server/jar

echo "=== Instalando e Iniciando o Servidor ==="
java -Xmx2G -jar fabric-installer.jar --mcversion $MC_VERSION --loader $LOADER_VERSION --downloadMinecraft

java -Xmx4G -jar fabric-server-launch.jar nogui