# Définir le compilateur pour ARM
CC = arm-linux-gnueabi-gcc

# Définir les options de compilation
CFLAGS = -Wall -g -I/usr/include

# Définir les fichiers objets
OBJ = SWC.o TestProtocol.o

# Définir la cible
TARGET = my_project_arm.bin

# Règles de compilation
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ -L/usr/lib -lcunit

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

test:
	./my_project_arm.bin

clean:
	rm -f $(OBJ) $(TARGET)
