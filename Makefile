# Définir le compilateur
CC = gcc

# Définir les options de compilation
CFLAGS = -Wall -g -I/usr/include

# Définir les fichiers objets
OBJ = SWC.o TestProtocol.o

# Définir la cible
TARGET = myprojectcicd.bin

# Règles de compilation
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ -L/usr/lib -lcunit

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

test:
	./myprojectcicd.bin

clean:
	rm -f $(OBJ) $(TARGET)