# Utiliser une image de base appropriée pour ARM (par exemple Debian)
FROM arm32v7/debian:latest

# Installer les outils nécessaires, y compris QEMU pour ARM
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    cmake \
    libcunit1 libcunit1-doc libcunit1-dev \
    qemu-user-static \
    file

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Copier les fichiers source dans le conteneur
COPY . .

# Compiler les fichiers source
RUN gcc -Wall -g -I/usr/include -c SWC.c -o SWC.o
RUN gcc -Wall -g -I/usr/include -c TestProtocol.c -o TestProtocol.o

# Lier les objets compilés
RUN gcc -Wall -g -o my_project_arm.bin SWC.o TestProtocol.o -L/usr/lib -lcunit

# Commande par défaut pour émuler le firmware
CMD ["qemu-arm", "./my_project_arm.bin"]
