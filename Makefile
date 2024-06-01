# Définir le compilateur
CC = gcc

# Définir les options de compilation
CFLAGS = -Wall -g -I/usr/include

# Définir les fichiers objets
OBJ = src/SWC.o src/TestProtocol.o

# Définir la cible
TARGET = my_project.bin

# Règles de compilation
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ -L/usr/lib -lcunit

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

test:
	./$(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)
