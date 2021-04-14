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
	@echo "Running executable..."
	@./$(targetdir)/main.out $(script) $(w) $(h)
	-@display $(pic).ppm
	@echo "Picture can be found at $(pic).ppm"

build: $(targetdir)/main.out
	@echo "Build finished"

$(targetdir)/main.out: $(list) | $(targetdir)
	@echo "Linking to executable..."
	@g++ -o $@ $(list)
	@echo "Executable $@ linked"

$(list): $(objdir)/%.o : $(sourcedir)/%.cpp | $(objdir)
	@echo "Compiling $(<F)"
	@g++ -c $< -o $@

$(objdir):
	@echo "Making object directory..."
	@mkdir -p $@

$(targetdir):
	@echo "Making binary directory..."
	@mkdir -p $@

clean:
	@echo "Removing object directory..."
	-@rm -r $(objdir)

remove: clean
	@echo "Removing target directory..."
	-@rm -r $(targetdir)
	@echo "Removing picture..."
	-@rm $(pic).ppm
	
.PHONY: run build clean remove