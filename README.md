# SSX (2000) Decompilation

This repository contains a work-in-progress functional decompilation of SSX (2000) on the PlayStation 2.

The binary being used is the US game binary, original filename `SLUS_200.95`, however multiple game builds might be considered later.

**NOTICE:** NO DATA FILES TO PLAY THE GAME ARE PROVIDED IN THIS REPOSITORY. THEY ARE PROTECTED BY COPYRIGHT. DO NOT REQUEST FOR THEM TO BE PROVIDED.

# FAQ

## Why not a matching decompilation?

While this was briefly considered, the time it would take is far greater, let alone the fact that tooling for matching decompilations
is nearly nonexistant and would have to be written from scratch specifically for this project.

Later on, it might be worth considering again, however, for now, a functional decompilation will mean faster, more promising results.

## How can I help?

Contributions are greatly accepted, if not valued in the early stage of this project.

Documentation for the styleguide used in the project is below, and a Ghidra server for the project is also available.

# Building

You will need:

- A Linux machine
- CMake
- the SCE PS2 SDK (PS2SDK support may be considered later), 2.5.5 at least.

You'll need to export SCE to point to your SCE root. This is always /usr/local/sce, and some of the scripts assume so, but for posterity, I don't hardcode it.

The SCE EE and IOP tools will also need to be in your PATH.

## Build Hacks

The crt0.s needs to be built in $SCE/ee/lib, due to a weird issue (and CMake building binaries before the actual compilation stage).

This can be done like so (do not run this as root. You should have $SCE chowned to yourself.):

```bash
$ ee-gcc -c -xassembler-with-cpp crt0.s -o crt0.o
```

Finally, you'll need to then edit app.cmd (in the same directory) to replace all indirect mentions of `crt0.o` with the path to the crt0.o you just assembled. This is the final hack in the build process.

## Actually Building

Then, it's as easy as:

```bash
$ cmake -Bbuild --toolchain cmake/Toolchain/ps2.cmake
$ cd build
$ make
```

Note that the Ninja CMake generator does not work with the SCE SDK, and should not be used if using it.

# Documentation

[Style Guide](docs/styleguide.md)
