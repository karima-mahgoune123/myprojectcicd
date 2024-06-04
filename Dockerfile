# Utiliser une image de base avec les outils nécessaires déjà installés
FROM ubuntu:20.04

# Installer les outils nécessaires, y compris QEMU
RUN apt-get update && apt-get install -y \
    gcc \
    libc6-dev \
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
RUN gcc -Wall -g -I/usr/include -c SWC.c -o SWC.o
RUN gcc -Wall -g -I/usr/include -c TestProtocol.c -o TestProtocol.o

# Lier les objets compilés
RUN gcc -Wall -g -o my_project.bin SWC.o TestProtocol.o -L/usr/lib -lcunit

# Exposer le répertoire de travail par défaut
CMD ["make"]
