# Utiliser une image de base avec les outils nécessaires déjà installés
FROM ubuntu:20.04

# Installer les outils nécessaires, y compris QEMU et les compilateurs ARM
RUN apt-get update && apt-get install -y \
    gcc \
    gcc-arm-linux-gnueabi \
    libc6-dev-armel-cross \
    make \
    cmake \
    libcunit1 libcunit1-doc libcunit1-dev \
    qemu-user \
    file

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Copier le reste des fichiers du projet
COPY . .

# Compiler les fichiers source
RUN arm-linux-gnueabi-gcc -Wall -g -I/usr/include -c SWC.c -o SWC.o
RUN arm-linux-gnueabi-gcc -Wall -g -I/usr/include -c TestProtocol.c -o TestProtocol.o

# Lier les objets compilés
RUN arm-linux-gnueabi-gcc -Wall -g -o my_project_arm.bin SWC.o TestProtocol.o -L/usr/lib -lcunit

# Exposer le répertoire de travail par défaut
CMD ["make"]
