# SSX Decompilation Style Guide

Most of the documentation here is enforced by [clang-format](https://clang.llvm.org/docs/ClangFormat.html), however I've written things down to make it more obvious.

# Code Style

## Braces/Indentation

Any block scopes should have the brace on the next line, like so:

```cpp
if(1)
{
	// do something
}

try
{
}
catch(...)
{
	// An error occured
}
```

Tabs are used for indentation throughout the codebase.

## Naming Rules

### Variables

Variable names should loosely follow Hungarian Notation.

For quick reference:

| Prefix   | Type                                           |
| -------- | ---------------------------------------------- |
| `b`      | byte (unsigned char, don't do `uc`)            |
| `c`      | char                                           |
| `u`      | Unsigned (prefixed before `i` or `s`)          |
| `s`      | Short                                          |
| `i`      | Integer                                        |
| `p`      | Pointer to (add for every \*)                  |
| `v`      | `void`; should only ever be used for pointers  |
| `sz`     | Null terminated string                         |
| `fl`     | Float                                          |
| `d`      | Double                                         |

Enumerations or structures do not need special notations; naming of variables should be enough (pointers should only need `p`).

Additionally, there are also the following special prefixes:

| Name    | Meaning                                 |
| ------- | --------------------------------------- |
| `m`     | Class member variable.                  |

### Types

Types have a prefix before them.

Legacy types (REAL/SND) won't need this due diligence, so it's ok to omit with those (as a matter of fact, it'd be more correct).

| Prefix   | C++ Type
| -------- | ------------------------------------------------ |
| `t`      | `typedef struct`                                 |
| `c`      | `class`                                          |
| `T`      | `template<> class/struct` (* Only seen in SSX3)  |

### Pointer/Reference Types

The pointer/reference goes on the side of the name, ala `T *name` and `T &name`.

### Functions

Function naming is PascalCase wherever possible, except for legacy code (specifically SND & REAL).

In this case, REAL functions follow the following standard:

`[component as uppercase]_[lowercase name]`.

No functions should be annotated as `(void)` unless explicitly decompiled as C , as C++ ensures `()` is not surprising.

Member functions can use the longer `this->` access pattern for members if desired, but you don't have to unless you.. well, *have* to.

## Comments

Don't really care. If you think something might not be obvious, feel free to comment describing it.

If there's something surprising (or repulsive, considering 2000 C++), do so too.

## Example

Provided is an example of the code style guide, to hopefully visualize things better.

```cpp

// A basic object.
class cBxObject
{
public:
	int miCounter;
	static int miVar;
	uint32_t muiUnsignedValue;

	uint16_t musShort;
	int16_t msSignedShort;

	static uint16_t musStaticValue;
	static int16_t msStaticSignedValue;

	int *mpiVar;

	// Morph
	void Morph();

	void ReferenceExample(int &iOutput); // only for reference output
};

// TODO: probably won't advocate for this unless
// I have to since structs are types in C++
typedef struct
{
	int iNumber;
} tBxStructure;

// example of a legacy function and type name
FILEOP *FILE_dothing();

void cBxObject::Morph()
{
	miCounter++;
	if(miCounter == 32)
	{
		// Do something important.
	}
}
```
