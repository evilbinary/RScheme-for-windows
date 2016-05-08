/*-----------------------------------------------------------------*-C-*---
 * File:    shell.h
 *
 *          Copyright (C)2016 evilbinary <rootntsd@163.com>
 *
 * File version:     1.2
 * File mod date:    2016-05-01
 * System build:     v0.7.3.4-b7u,  2016-05-08
 *
 *------------------------------------------------------------------------*/

#ifndef _H_LGH
#define _H_LGH

#include <rscheme/scheme.h>

obj as_eval( char *str );
void as_init(int argc, const char **argv );

#endif /* _H_LGH */
