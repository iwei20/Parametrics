sourcedir = src
targetdir = bin

deps = parametric.o matrix.o parser.o screen.o transform_manager.o
list = $(addprefix $(targetdir)/,$(deps))

h ?= 800
w ?= 800
script ?= script

run: main.out
	./main.out $(script) $(w) $(h)
	-display face.ppm
	@echo face.ppm

main.out: $(list) main.o
	g++ -o $@ main.o $(list)

main.o: main.cpp
	g++ -c main.cpp

$(targetdir):
	mkdir -p $@

$(list): $(targetdir)/%.o : $(sourcedir)/%.cpp | $(targetdir)
	g++ -c $< -o $@

clean:
	-rm main.out
	-rm main.o
	-rm -r bin
	
.PHONY: run clean