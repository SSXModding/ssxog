#include "eactask.h"
#include <eekernel.h>

extern "C"
{

	static int mainthread;
    static MUTEX videosema; // ?


    // Mutex

    typedef struct {
        int lockingTid;
        int lockCount;
    } _MUTEX_freelist;

    // that's a big list..
    static _MUTEX_freelist mutexfreelist[274];

    MUTEX MUTEX_alloc() {
        SemaParam param;
        param.initCount = 1;
        param.maxCount = 1;
        int id = CreateSema(&param);
        mutexfreelist[id].lockCount = 0;
        mutexfreelist[id].lockingTid = 0;
        return (MUTEX)id;
    }

    void MUTEX_lock(MUTEX mutex) {
        int self = GetThreadId();
        if(mutexfreelist[mutex].lockingTid != self) {
            WaitSema((int)mutex);
            mutexfreelist[mutex].lockingTid = self;
        }
        mutexfreelist[mutex].lockCount++;
    }

    void MUTEX_unlock(MUTEX mutex) {
        int newCount = mutexfreelist[mutex].lockCount - 1;
        mutexfreelist[mutex].lockCount = newCount;

        if(newCount == 0) {
            mutexfreelist[mutex].lockingTid = 0;
            SignalSema((int)mutex);
            return;
        }
    }


    // Threading


	void THREAD_init(int unused)
	{
        (void)unused;

        mainthread = GetThreadId();
        ChangeThreadPriority(GetThreadId(), 100);
        videosema = MUTEX_alloc();
	}
}