# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug)
  OBJDIR     = obj/Debug/gmsv_cwutil
  TARGETDIR  = ../../release
  TARGET     = $(TARGETDIR)/libgmsv_cwutil_linux.so
  DEFINES   += -DNDEBUG -DGMMODULE
  INCLUDES  += -I../../source/includes -I../../bootil/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -msse -O3 -ffast-math -fPIC -m32 -fPIC -L/usr/lib -ldl -static-libgcc -static-libstdc++ -std=c++0x
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -shared -m32 -fPIC -ldl -lpthread -static-libgcc -static-libstdc++ -std=c++0x -z defs -L../../release/bootil
  LIBS      += -lbootil_static
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../release/bootil/libbootil_static.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = obj/Release/gmsv_cwutil
  TARGETDIR  = ../../release
  TARGET     = $(TARGETDIR)/libgmsv_cwutil_linux.so
  DEFINES   += -DNDEBUG -DGMMODULE
  INCLUDES  += -I../../source/includes -I../../bootil/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -msse -O3 -ffast-math -fPIC -m32 -fPIC -L/usr/lib -ldl -static-libgcc -static-libstdc++ -std=c++0x
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -shared -m32 -fPIC -ldl -lpthread -static-libgcc -static-libstdc++ -std=c++0x -z defs -L../../release/bootil
  LIBS      += -lbootil_static
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../release/bootil/libbootil_static.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/Main.o \
	$(OBJDIR)/WebEasy.o \
	$(OBJDIR)/getopt.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking gmsv_cwutil
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning gmsv_cwutil
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/Main.o: ../../source/Main.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/WebEasy.o: ../../source/WebEasy.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/getopt.o: ../../source/getopt.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
