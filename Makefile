# Makefile für NikaWindows

CXX = g++
CXXFLAGS = -std=c++11 -Wall -g
LDFLAGS = -luser32 -lkernel32 -ld3d11 -ldxgi

SRCDIR = src
INCDIR = include
BUILDDIR = build
IMGUI_DIR = ImGui

TARGET = nika.exe

SOURCES = $(wildcard $(SRCDIR)/*.cpp) $(IMGUI_DIR)/imgui.cpp $(IMGUI_DIR)/imgui_draw.cpp $(IMGUI_DIR)/imgui_tables.cpp $(IMGUI_DIR)/imgui_widgets.cpp $(IMGUI_DIR)/imgui_impl_win32.cpp $(IMGUI_DIR)/imgui_impl_dx11.cpp
OBJECTS = $(patsubst $(SRCDIR)/%.cpp, $(BUILDDIR)/%.o, $(SOURCES))

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) -o $@ $^ $(LDFLAGS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -I$(INCDIR) -I$(IMGUI_DIR) -o $@ -c $<

$(BUILDDIR)/%.o: $(IMGUI_DIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -I$(INCDIR) -I$(IMGUI_DIR) -o $@ -c $<

clean:
	rm -rf $(BUILDDIR) $(TARGET)

.PHONY: all clean
