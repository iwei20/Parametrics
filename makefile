sourcedir = src
objdir = obj
targetdir = bin

list = $(subst $(sourcedir),$(objdir),$(subst .cpp,.o,$(wildcard $(sourcedir)/*.cpp)))

h ?= 800
w ?= 800
script ?= script
pic ?= face

run: build
	@echo "Running executable..."
	@./$(targetdir)/main.out $(script) $(w) $(h)
	@echo "Displaying picture..."
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