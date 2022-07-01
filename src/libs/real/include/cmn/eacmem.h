#ifndef REAL_EACMEM_H
#define REAL_EACMEM_H

#include <stddef.h>

// MB_... flags definition

// default
#define MB_LOW 0x00
//....

char* MEM_alloc(const char* tag, size_t size, int flags);
void MEM_free(void* ptr);

#endif // REAL_EACMEM_H
