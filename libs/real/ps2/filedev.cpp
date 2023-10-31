
#include <string.h>

extern "C"
{

	int fileModeTemp = 0; // TODO, also probably an Enum!!!

	void iFILEDEV_makepath(const char* input, char* output, int* filemode)
	{
		int mode = fileModeTemp;

		// explicit device specification?
		if(strchr(input, ':') != NULL)
		{
			// nasty.
#define TEST_FILE_MODE(str, newMode) if(!strncmp(input, str, sizeof(str)-1)) { mode = newMode; input += sizeof(str)-1; }

			// use CD
			TEST_FILE_MODE("cd:", 1)
			else
			{
				// use Host0
				TEST_FILE_MODE("host0:", 2)
				else
				{
					if(fileModeTemp == 1)
						return;

					if(input[2] != ':')
						return;
				}
			}
		}

		if(fileModeTemp == 2)
			strcat(output, "host0:");




	}
}