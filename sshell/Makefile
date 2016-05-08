MD=$(INSTALL_DIR)/resource/modules
LB=$(INSTALL_DIR)/lib
PRODUCT=sshell
PRODIMG=sshell.orig.fas
LINKM=boot.scm
XLDX= -lz

all:: $(PRODUCT) $(PRODIMG)

XCFLAGS='-DINSTALL_DIR="$(INSTALL_DIR)"'

include $(INSTALL_DIR)/resource/buildenv/preamble.mak

CFILES=main.c shell.c
INSTALL=cp -p

OFILES=$(CFILES:.c=.o)
LIB_RS=$(LB)/librs.a
$(PRODUCT): $(OFILES) $(PKGS) $(LIB_RS)
	$(CC) -I.  $(CFLAGS) $(OFILES) $(PKGS) -o  $(PRODUCT) $(LDX_FLAGS) $(XLDX)

$(PRODIMG): $(PRODUCT)
	rs  $(LINKM) -c.repl $(PRODIMG) -exit

install:: $(INSTALL_DIR)/bin
	$(INSTALL) $(PRODUCT) $(INSTALL_DIR)/bin
	$(INSTALL) $(PRODIMG) $(INSTALL_DIR)/resource

$(INSTALL_DIR)/bin:
	mkdir $(INSTALL_DIR)/bin


clean::
	rm -f $(OFILES) $(PRODUCT)

depend::
	$(CC) $(CFLAGS) -MM -I. $(CFILES) > depends
