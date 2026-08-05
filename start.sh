set -e

mkdir -p mods

echo "=== Baixando Cobblemon 1.5.2 ==="
curl -fSL -o mods/Cobblemon-fabric-1.5.2.jar "https://cdn.modrinth.com/data/MdwFAVRL/versions/EVozVxCq/Cobblemon-fabric-1.5.2%2B1.20.1.jar"

echo "=== Aceitando EULA ==="
echo "eula=true" > eula.txt

echo "=== Instalando o Servidor Fabric e baixando o Minecraft Server JAR ==="
java -jar fabric-installer-1.1.2.jar server -mcversion 1.20.1 -loader 0.16.10 -downloadMinecraft

echo "=== Iniciando o Servidor ==="
java -Xmx4G -jar fabric-server-launch.jar nogui