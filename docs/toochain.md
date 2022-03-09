# Toolchain

A RISC-V toolchain can be acquired from the [RISC-V GNU Toolchain
repository](https://github.com/riscv-collab/riscv-gnu-toolchain). It can be
downloaded from the [release
artifacts](https://github.com/riscv-collab/riscv-gnu-toolchain/releases) or
built from source. Two different toolchains, generic ELF and Linux ELF, are
available. Either one will work for building `quisc`. If you are not sure which
one to pick, choose the latter.

## Tools

The following tools are included in your toolchain:

```
riscv64-unknown-linux-gnu-addr2line      riscv64-unknown-linux-gnu-gcc            riscv64-unknown-linux-gnu-gdb            riscv64-unknown-linux-gnu-objcopy
riscv64-unknown-linux-gnu-ar             riscv64-unknown-linux-gnu-gcc-11.1.0     riscv64-unknown-linux-gnu-gdb-add-index  riscv64-unknown-linux-gnu-objdump
riscv64-unknown-linux-gnu-as             riscv64-unknown-linux-gnu-gcc-ar         riscv64-unknown-linux-gnu-gfortran       riscv64-unknown-linux-gnu-ranlib
riscv64-unknown-linux-gnu-c++            riscv64-unknown-linux-gnu-gcc-nm         riscv64-unknown-linux-gnu-gprof          riscv64-unknown-linux-gnu-readelf
riscv64-unknown-linux-gnu-c++filt        riscv64-unknown-linux-gnu-gcc-ranlib     riscv64-unknown-linux-gnu-ld             riscv64-unknown-linux-gnu-run
riscv64-unknown-linux-gnu-cpp            riscv64-unknown-linux-gnu-gcov           riscv64-unknown-linux-gnu-ld.bfd         riscv64-unknown-linux-gnu-size
riscv64-unknown-linux-gnu-elfedit        riscv64-unknown-linux-gnu-gcov-dump      riscv64-unknown-linux-gnu-lto-dump       riscv64-unknown-linux-gnu-strings
riscv64-unknown-linux-gnu-g++            riscv64-unknown-linux-gnu-gcov-tool      riscv64-unknown-linux-gnu-nm             riscv64-unknown-linux-gnu-strip
```

Though many of these tools _can_ be used with `quisc`, the following are
primarily of interest in the context of building and running the software:

- `as`: The GNU assembler. This is used to convert assembly files into machine
  code object files.
- `ld`: The GNU linker. This is used to stitch together machine code object
  files into a single executable.