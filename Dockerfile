# Utiliser une image de base appropriée
FROM ubuntu:latest

# Installer les outils nécessaires, y compris QEMU
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    cmake \
    libcunit1 libcunit1-doc libcunit1-dev \
    qemu-system-arm

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Copier les fichiers source dans le conteneur
COPY . .

# Compiler les fichiers source
RUN gcc -Wall -g -I/usr/include -c src/SWC.c -o src/SWC.o
RUN gcc -Wall -g -I/usr/include -c src/TestProtocol.c -o src/TestProtocol.o

# Lier les objets compilés
RUN gcc -Wall -g -o my_project.bin src/SWC.o src/TestProtocol.o -L/usr/lib -lcunit

# Commande par défaut pour émuler le firmware
CMD ["qemu-system-arm", "-M", "versatilepb", "-kernel", "my_project.bin", "-nographic", "-serial", "mon:stdio", "-display", "none"]
