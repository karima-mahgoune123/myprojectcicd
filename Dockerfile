# Utiliser une image de base Ubuntu
FROM ubuntu:latest

# Installer les outils nécessaires, y compris QEMU
RUN apt-get update && apt-get install -y \
    gcc \
    gcc-arm-linux-gnueabi \
    libc6-dev-armel-cross \
    make \
    cmake \
    libcunit1 libcunit1-doc libcunit1-dev \
    qemu-system-arm \
    file

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
CMD ["qemu-system-arm", "-M", "virt", "-kernel", "my_project.bin", "-nographic", "-serial", "mon:stdio", "-display", "none"]