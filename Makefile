
TARGET_S = split_sentence
TARGET_R = random_sentence

# Various configurable paths (remember to edit Makefile.in, not Makefile)
prefix = .

CC = g++ -std=c++11 
LIBS = 
CFLAGS = -I./include  -O3 -Os
CPPFLAGS = 
JSON_FILE = ./include/jsoncpp.cpp
STORM_FILES = Storm.cpp 
SPLITSENTENCE_FILE = SplitSentenceTest.cpp
RANDOMSENTENCE_FILE = random_sentence_test.cpp 
SRCS_S = $(JSON_FILE) $(STORM_FILES) $(SPLITSENTENCE_FILE)
SRCS_R = $(JSON_FILE) $(STORM_FILES) $(RANDOMSENTENCE_FILE)
OBJDIR = .obj
LOBJS_S = $(SRCS_S:%.cpp=$(OBJDIR)/%.o)
LOBJS_R = $(SRCS_R:%.cpp=$(OBJDIR)/%.o)
all: $(TARGET_S) $(TARGET_R)

$(TARGET_S): $(LOBJS_S)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $^ $(LIBS)
$(TARGET_R): $(LOBJS_R)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $^ $(LIBS)

$(OBJDIR)/%.o: %.cpp
	@[ -d $$(dirname $@) ] || \
		(mkdir -p $$(dirname $@))
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(LOBJS_S)
	rm -f $(LOBJS_R)
	rm -f $(TARGET_S) 
	rm -rf $(TARGET_R)
	rm -rf $(TARGET_S) $(OBJDIR)
	rm -rf $(TARGET_R) $(OBJDIR)

