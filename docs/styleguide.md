# SSX Decompilation Style Guide

Most of the documentation here is enforced by [clang-format](https://clang.llvm.org/docs/ClangFormat.html).

However, I've written other naming rules which aren't enforced down to make it more obvious, and to aid potentional contributors.

# Code Style

## Braces/Indentation

Any block scopes should have the brace on the next line, ala Allman bracing.

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

## East/West Const/Volatile/...

It seems EA preferred west-const (where semantically possible), so, go west, collect 200$, get out of jail.

## Naming Rules

### Variables

Variable naming is not too complicated; just try to make it understandable. 

There are the following special prefixes, used in certain scenarios:

| Name | Meaning/Scenario                          |
|------|-------------------------------------------|
| `m`  | Class member (or static member) variable. |
| `g`  | Global variable.                          |

### Types

BX/SSX types have a prefix before them, which is:

| Prefix | C++ Type                                        |
|--------|-------------------------------------------------|
| `t`    | `typedef struct`                                |
| `c`    | `class/struct`                                  |
| `T`    | `template<> class/struct` (* Only seen in SSX3) |

Legacy types (REAL/SND) won't/don't need this due diligence, so it's ok to omit with those (as a matter of fact, it'd be more correct).

### Pointer/Reference Types

The pointer/reference goes on the side of the type, ala `T* name` and `T& name`.

### Functions

Function naming is PascalCase wherever possible, except for legacy code (specifically SND & REAL).

In this case, REAL/SND functions follow the following standard:

`[component/namespace, as uppercase]_[lowercase function name]`.

No functions should be annotated as `(void)` unless explicitly decompiled as C or exported in a C header file, as C++ ensures `()` is not surprising.

Member functions can use the longer `this->` access pattern for members if desired, but you don't have to unless you.. well, *have* to.

## Comments

Don't really care. If you think something might not be obvious, feel free to comment describing it.

If there's something surprising (or repulsive, considering 2000 C++), do so too.

## Example

Provided is an example of code fitting the style guide, to hopefully visualize things better.

```cpp
// A basic object.
class cBxObject
{
public:
	int mCounter;
	static int mVar;
    
	uint32_t mUnsignedValue;

	uint16_t mShort;
	int16_t mSignedShort;
    
	static uint16_t mStaticValue;
	static int16_t mStaticSignedValue;
    
	uint64_t mThing;
	int64_t mSignedThing;
	
	static int64_t mThingStatic;
	static uint64_t mThingStatic;
    
	int* mPointerVar;

	// Morph
	void Morph();

	void ReferenceExample(int& output); // only for reference output
};

typedef struct
{
	int Number;
    
	void DoIt();
} tBxStructure;

// example of a legacy function and type name
FILEOP *FILE_dothing();

void cBxObject::Morph()
{
	mCounter++;
	if(mCounter == 32)
	{
		// Do something important.
	}
}
```
