# Utiliser une image de base appropriée
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
RUN arm-linux-gnueabi-gcc -Wall -g -I/usr/include -c SWC.c -o SWC.o
RUN arm-linux-gnueabi-gcc -Wall -g -I/usr/include -c TestProtocol.c -o TestProtocol.o

# Lier les objets compilés
RUN arm-linux-gnueabi-gcc -Wall -g -o my_project_arm.bin SWC.o TestProtocol.o -L/usr/arm-linux-gnueabi/lib -lcunit

# Commande par défaut pour émuler le firmware
CMD ["qemu-arm", "-L", "/usr/arm-linux-gnueabi", "./my_project_arm.bin"]