#ifndef SSXOG_UTILS_H
#define SSXOG_UTILS_H

// Use REAL to allocate an object.
// Insert into a class body like so:
//
// class cExample
// {
// public:
//  BX_REAL_ALLOC("Example", MB_LOW); // `new cExample()` will use REAL to allocate the class instead of standard malloc
// };
#define BX_REAL_ALLOC(name, flags)            \
	inline void* operator new(size_t size)    \
	{                                         \
		return MEM_alloc(name, size, flags);  \
	}                                         \
                                              \
	inline void operator delete(void* object) \
	{                                         \
		MEM_free(object);                     \
	}

#endif // SSXOG_UTILS_H
