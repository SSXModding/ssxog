#ifndef EACTASK_H
#define EACTASK_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    int item;
    int stacksize;
    int priority;
    int processor; /* zero-filled */
    int id; /* EE kernel thread ID */
    int unknown1;
    int unknown2;
} THREAD;

typedef void(THREADPROC)();
typedef void(THREAD2PROC)(void* param);

// Mutex functions
typedef int MUTEX;

MUTEX MUTEX_alloc();
void MUTEX_lock(MUTEX mutex);
void MUTEX_unlock(MUTEX mutex);

void THREAD_init(int unused);

int THREAD_create(THREADPROC* func, int ssize, int prio, int proc, THREAD* tstruct);
int THREAD_createparam(THREAD2PROC* func, void* param, int ssize, int priority, int proc, THREAD* tstruct);

int THREAD_iscurrent(THREAD* tstruct);


#ifdef __cplusplus
};
#endif


#endif