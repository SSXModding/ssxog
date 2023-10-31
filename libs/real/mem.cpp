#include "eacmem.h"
#include "include/eacmem.h"

char* mem_begin = NULL;

static int default_event(int eventtype) {
    return 0;
}

int MEM_createclass(int memclass, char *name, char *memadr, long memlength, int defaultalign, int align, int infosize, int infosentinel, int infocallfile, int nameblocks, int mutex, int (*event)(int)) {
    
}

int MEM_initadr(char* memadr, int memlength) {
    int res = MEM_createclass(MB_RAM, "RAM", memadr, memlength, 64, 128, 0, 0, 0, 0, 1, default_event);
    if(mem_begin == NULL) {
        mem_begin = memadr;
    }

    // TODO: read from memclass internals

    return res;

}

void* MEM_alloc(char* tag, size_t size, int flags);
void MEM_free(void* ptr);