BINDIR = bin
OBJDIR = obj

CXX = g++-8

release: OPTIMISATION := -g0 -O3
release: app.elf

debug: OPTIMISATION := -g3 -O0
debug: app.elf

CXXFLAGS = $(OPTIMISATION) -no-pie -Wall -Werror -Wfatal-errors -pthread -std=c++17 `sdl2-config --cflags`
CCFLAGS  = $(OPTIMISATION) -no-pie -Wall -Werror -Wfatal-errors -pthread -std=c99 -Wno-unused-variable -Wno-unused-result -Wno-unused-function -ldl

INCDIRS = include
LIBDIRS = $(OBJDIR)
LIBS    = SDL2 GL dl stdc++fs

app.elf: | $(BINDIR) $(OBJDIR)
	$(CXX) $(CXXFLAGS) -o $(BINDIR)/app.elf src/compile.cpp $(foreach D,$(INCDIRS),-I$D ) $(foreach D,$(LIBDIRS),-L$D ) $(foreach L,$(LIBS),-l$L )

.PHONY: app.elf

clean:
	rm -f $(BINDIR)/*
	rm -f $(OBJDIR)/*

$(BINDIR):
	mkdir $(BINDIR)

$(OBJDIR):
	mkdir $(OBJDIR)
