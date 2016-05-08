# This is the preamble.mak used when building packages and other addons
# INSTALL_DIR=/usr/local/lib/rs/0.7.3.4-b7u
IFLAGS=$(USR_IFLAGS) -I. $(SYS_IFLAGS) -I$(INSTALL_DIR)/include
SUBPROJ_LD=ld
SUBPROJ_LD_FLAGS=-r
LDX_FLAGS=-L$(INSTALL_DIR)/lib -lrs -ldl -lm -lpsapi
CC=gcc
CFLAGS1=-g -O2 -DNDEBUG -DINLINES -DGC_MACROS -Wall -Wno-unused
CFLAGS=$(CFLAGS1) $(XCFLAGS) $(IFLAGS)
