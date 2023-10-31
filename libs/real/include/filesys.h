#ifndef REALFILE_FILESYS_H
#define REALFILE_FILESYS_H

// the max size of a path
#define FILESYS_MAXPATH 64


#ifdef __cplusplus
extern "C" {
#endif

	/**
	 * Get the current configured FILESYS path.
	 */
	void FILESYS_getcurrentpath(char* out);


#ifdef __cplusplus
}
#endif


#endif