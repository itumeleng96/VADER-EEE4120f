#IJ MALEMELA Makefile 

CC := g++ #compiler

SRCDIR := src
BUILDDIR := build
TARGET := uart_program
 
SRCEXT := cpp

SOURCES_UART := $(shell find src -type f -name uart_pc.cpp)


OBJECTS := $(patsubst src/%,build/%,$(SOURCES:.cpp=.o))

CFLAGS := -g # -Wall
LIB := 
INC := -I include

$(TARGET): build/uart_pc.o 
	@echo " Linking..."
	$(CC) $^ -o $(TARGET) $(LIB)

build/uart_pc.o: $(SOURCES_UART)
	@mkdir -p $(BUILDDIR)
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	@echo " Cleaning..."; 
	@echo " $(RM) -r $(BUILDDIR)/ $(TARGET)"; $(RM) -r $(BUILDDIR)/ $(TARGET);


