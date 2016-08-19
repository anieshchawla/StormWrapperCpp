
TARGET = split_sentence

# Various configurable paths (remember to edit Makefile.in, not Makefile)
prefix = .

CC = g++ 
LIBS = 
CFLAGS = -I./include  -O3 -Os
CPPFLAGS = 
JSON_FILE = ./include/jsoncpp.cpp
STORM_FILES = Storm.cpp 
SPLITSENTENCE_FILE = SplitSentenceTest.cpp
SRCS = $(JSON_FILE) $(STORM_FILES) $(SPLITSENTENCE_FILE)
OBJDIR = .obj
LOBJS = $(SRCS:%.cpp=$(OBJDIR)/%.o)

all: $(TARGET)

$(TARGET): $(LOBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $^ $(LIBS)

$(OBJDIR)/%.o: %.cpp
	@[ -d $$(dirname $@) ] || \
		(mkdir -p $$(dirname $@))
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(LOBJS)
	rm -f $(TARGET)
	rm -rf $(TARGET) $(OBJDIR)

