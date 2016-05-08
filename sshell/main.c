/*-----------------------------------------------------------------*-C-*---
 * File:    main.c
 *
 *          Copyright (C)2016 evilbinary <rootntsd@163.com>
 *
 * File version:     1.2
 * File mod date:    2016-05-01
 * System build:     v0.7.3.4-b7u,  2016-05-08
 *
 *------------------------------------------------------------------------*/

#include "shell.h"
#include <rscheme/scheme.h>
#include <rscheme/smemory.h>
#include <rscheme/vinsns.h>
#include <rscheme/gcserver.h>

int main( int argc, const char **argv )
{
	as_init(argc,argv);
	obj ret=as_eval( "(display \"Hello, RScheme-android\\n\") (display 22)" );
	printf("ret=%s",string_text(ret) );
	ret=as_eval( "(+ 1 2)");
	printf("ret=%s\n",string_text(ret) );

  return 0;
}
