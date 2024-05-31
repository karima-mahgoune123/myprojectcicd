# Utiliser une image de base appropriée
FROM ubuntu:latest

# Installer les outils nécessaires
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    cmake \
    libcunit1 libcunit1-doc libcunit1-dev

# Définir le répertoire de travail
WORKDIR /Users/HP/myprojectcicd

# Copier les fichiers source dans le conteneur
COPY . .

# Compiler les fichiers source
RUN gcc -Wall -g -I/usr/include -c SWC.c -o SWC.o
RUN gcc -Wall -g -I/usr/include -c TestProtocol.c -o TestProtocol.o

# Lier les objets compilés
RUN gcc -Wall -g -o myprojectcicd.bin SWC.o TestProtocol.o -L/usr/lib -lcunit

# Exécuter les tests/unités
CMD ["./myprojectcicd.bin"]