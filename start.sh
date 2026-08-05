#!/bin/bash
set -e

MC_VERSION="1.20.1"
LOADER_VERSION="0.16.10"

echo "=== Limpando mods antigos e incompatíveis ==="
mkdir -p mods
rm -rf mods/*

echo "=== Baixando Mods e Dependências para Minecraft $MC_VERSION ==="

# Função para baixar a versão mais recente compatível via API do Modrinth
download_modrinth() {
    local slug=$1
    echo "Buscando $slug..."
    local url
    url=$(curl -s "https://api.modrinth.com/v2/project/$slug/version?game_versions=%5B%22$MC_VERSION%22%5D&loaders=%5B%22fabric%22%5D" | jq -r '.[0].files[] | select(.primary==true) .url' 2>/dev/null)
    
    if [ -n "$url" ] && [ "$url" != "null" ]; then
        echo "Baixando $slug de $url"
        curl -sL -O --output-dir mods "$url"
    else
        echo "Aviso: Não foi possível obter $slug automaticamente."
    fi
}

# Certifique-se de que o 'jq' esteja instalado no ambiente (Linux/GitHub Actions)
if ! command -v jq &> /dev/null; then
    echo "Instalando jq..."
    sudo apt-get update && sudo apt-get install -y jq
fi

# Lista de mods e dependências corretas para 1.20.1
download_modrinth "fabric-api"
download_modrinth "architectury-api"
download_modrinth "ftb-library-fabric"
download_modrinth "ftb-teams-fabric"
download_modrinth "packetevents"
download_modrinth "grimac"
download_modrinth "cristel-lib"
download_modrinth "towns-and-towers"
download_modrinth "geyser"
download_modrinth "fabric-permissions-api"

echo "=== Aceitando EULA ==="
echo "eula=true" > eula.txt

echo "=== Baixando Fabric Server Installer ==="
curl -sSL -o fabric-installer.jar https://meta.fabricmc.net/v2/versions/installer/1.0.1/server/jar

echo "=== Iniciando o Servidor ==="
java -Xmx2G -jar fabric-installer.jar --mcversion $MC_VERSION --loader $LOADER_VERSION --downloadMinecraft

java -Xmx4G -jar fabric-server-launch.jar nogui