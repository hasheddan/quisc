# Set shell to sh.
SHELL := /bin/sh

# ==============
# Toolchain

# Assembler
AS ?= riscv64-unknown-linux-gnu-as

# Linker
LD ?= riscv64-unknown-linux-gnu-ld

# Debugger
DEBUG ?= riscv64-unknown-linux-gnu-gdb

# Emulator
EMU ?= qemu-riscv64

# ==============
# Targets

a.out: main.S
	@$(AS) main.S

quisc: a.out
	@$(LD) a.out -o quisc

# ==============
# Scripts

run:
	@echo "Running quisc under emultation..."
	@$(EMU) quisc

run-debug:
	@$(EMU) -g 1234 -strace quisc

debug:
	$(DEBUG) quisc
