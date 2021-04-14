sourcedir = src
objdir = obj
targetdir = bin

deps = main.o parametric.o matrix.o parser.o screen.o transform_manager.o
list = $(addprefix $(objdir)/,$(deps))

h ?= 800
w ?= 800
script ?= script
pic ?= face

run: $(targetdir)/main.out
	./$(targetdir)/main.out $(script) $(w) $(h)
	-display $(pic).ppm
	@echo $(pic).ppm

$(targetdir)/main.out: $(list) | $(targetdir)
	g++ -o $@ $(list)

$(list): $(objdir)/%.o : $(sourcedir)/%.cpp | $(objdir)
	g++ -c $< -o $@

$(objdir):
	mkdir -p $@

$(targetdir):
	mkdir -p $@

clean:
	-rm -r $(objdir)

remove: clean
	-rm -r $(targetdir)
	-rm $(pic).ppm
	
.PHONY: run clean remove