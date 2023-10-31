#include <filesys.h>
#include <string.h>

extern "C" {

	char currentdirectory[FILESYS_MAXPATH];

	void FILESYS_getcurrentdirectory(char* outpath)
	{
		strncpy(outpath, currentdirectory, FILESYS_MAXPATH);
	}

}