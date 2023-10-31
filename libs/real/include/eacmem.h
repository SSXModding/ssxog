#ifndef EACMEM_H
#define EACMEM_H

#include <stddef.h>

// MB_... flags definition

// classes
#define MB_RAM 0x0000
#define MB_GLOBAL 0x0001

// default
#define MB_LOW 0x0000
#define MB_HIGH 0x0010
#define MB_LARGEST 0x0020
#define MB_ALIGN 0x0040
#define MB_PERM 0x0080

#define MB_NAME 0x0100
#define MB_SENTINEL 0x0200
#define MB_CALLFILE 0x0400
#define MB_COMMENT 0x0800

#define MB_BREAK 0x2000
#define MB_FREE 0x4000
#define MB_SYSTEM 0x8000

// Memory class functions. These allow initalization of memory

int MEM_createclass(int memclass, char* name, char* memadr, long memlength, int defaultalign, int align, int infosize, int infosentinel, int infocallfile, int nameblocks, int mutex, int(*event)(int eventcode));
int MEM_initadr(char* memadr, int memlength);

void* MEM_alloc(char* tag, size_t size, int flags);
void MEM_free(void* ptr);

#endif // REAL_EACMEM_H
