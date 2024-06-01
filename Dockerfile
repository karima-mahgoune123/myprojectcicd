# Utiliser une image de base appropriée
FROM ubuntu:latest

# Installer les outils nécessaires, y compris QEMU
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    cmake \
    libcunit1 libcunit1-doc libcunit1-dev \
    qemu-system-arm

# Créer un répertoire pour stocker les fichiers QEMU sur le système hôte Windows
RUN mkdir -p /usr/src/myapp/qemu

# Copier les fichiers source dans le conteneur
COPY . .

# Copier le fichier QEMU dans le répertoire créé
COPY /Users/HP/qemu/qemu-system-arm.exe /usr/src/myapp/qemu/qemu-system-arm.exe

# Compiler les fichiers source
RUN gcc -Wall -g -I/usr/include -c SWC.c -o SWC.o
RUN gcc -Wall -g -I/usr/include -c TestProtocol.c -o TestProtocol.o

# Lier les objets compilés
RUN gcc -Wall -g -o my_project.bin SWC.o TestProtocol.o -L/usr/lib -lcunit

# Commande par défaut pour émuler le firmware
CMD ["/usr/src/myapp/qemu/qemu-system-arm.exe", "-M", "versatilepb", "-kernel", "my_project.bin", "-nographic", "-serial", "mon:stdio", "-display", "none"]
