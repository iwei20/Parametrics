run: main.out
	ifndef script
		@echo "No script name provided"
	else
		h ?= 500
		w ?= 500
		./main.out $(script) $(w) $(h)
	endif

main.out: main.o bin/%.o
	g++ -o main.out main.o bin/%.o

main.o: main.cpp
	g++ -c main.cpp

bin/%.o: src/%.cpp
	mkdir bin
	g++ -c $< -o $@

clean:
	-rm main.out
	-rmdir -r bin
	
.PHONY: run clean