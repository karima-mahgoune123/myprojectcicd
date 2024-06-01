# Utiliser une image de base appropriée
FROM ubuntu:latest

# Installer les outils nécessaires, y compris QEMU
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    cmake \
    libcunit1 libcunit1-doc libcunit1-dev \
    qemu-system-arm

# Créer un répertoire pour stocker l'application QEMU
RUN mkdir -p /usr/src/myapp/qemu

# Copier l'application QEMU dans le répertoire créé
COPY "/Program Files/qemu/qemu-system-arm.exe" /usr/src/myapp/qemu/qemu-system-arm.exe

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Copier les fichiers source dans le conteneur
COPY . .

# Compiler les fichiers source
RUN gcc -Wall -g -I/usr/include -c SWC.c -o SWC.o
RUN gcc -Wall -g -I/usr/include -c TestProtocol.c -o TestProtocol.o

# Lier les objets compilés
RUN gcc -Wall -g -o my_project.bin SWC.o TestProtocol.o -L/usr/lib -lcunit

# Commande par défaut pour émuler le firmware
CMD ["/usr/src/myapp/qemu/qemu-system-arm", "-M", "versatilepb", "-kernel", "my_project.bin", "-nographic", "-serial", "mon:stdio", "-display", "none"]
