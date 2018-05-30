# Assembly

## MacOS

### Environments

Assume to be x86-64:


```bash
% uname -a
Darwin mob07207.intranet.globis.jp 17.4.0 Darwin Kernel Version 17.4.0: Sun Dec 17 09:19:54 PST 2017; root:xnu-4570.41.2~1/RELEASE_X86_64 x86_64
% nasm -v
NASM version 2.13.03 compiled on Feb  8 2018
% nasm -hf
// skip

valid output formats for -f are (`*' denotes default):
  * bin       flat-form binary files (e.g. DOS .COM, .SYS)
    ith       Intel hex
    srec      Motorola S-records
    aout      Linux a.out object files
    aoutb     NetBSD/FreeBSD a.out object files
    coff      COFF (i386) object files (e.g. DJGPP for DOS)
    elf32     ELF32 (i386) object files (e.g. Linux)
    elf64     ELF64 (x86_64) object files (e.g. Linux)
    elfx32    ELFX32 (x86_64) object files (e.g. Linux)
    as86      Linux as86 (bin86 version 0.3) object files
    obj       MS-DOS 16-bit/32-bit OMF object files
    win32     Microsoft Win32 (i386) object files
    win64     Microsoft Win64 (x86-64) object files
    rdf       Relocatable Dynamic Object File Format v2.0
    ieee      IEEE-695 (LADsoft variant) object file format
    macho32   NeXTstep/OpenStep/Rhapsody/Darwin/MacOS X (i386) object files
    macho64   NeXTstep/OpenStep/Rhapsody/Darwin/MacOS X (x86_64) object files
    dbg       Trace of all info passed to output stage
    elf       ELF (short name for ELF32)
    macho     MACHO (short name for MACHO32)
    win       WIN (short name for WIN32)
```

We can compile with `nasm`, which can be installed via Homebrew. Here is the way to compile `.asm` file:

```bash
nasm -f macho64 hello.asm && ld -o res hello.o && ./res
```

### Registers

|Registers||Arguments|
|---|---|---|
||rax|ID|
||rbx||
||rcx||
||rdx|3|
||rsi|2|
||rdi|1|
||rdp||
||rsp||
||r8|5|
||r9|6|
||r10|4|
||r11||
||r12||
||r13||
||r14||
||r15||

### references

+ The gist page, https://gist.github.com/FiloSottile/7125822, describes the brief code and some references for MacOS.

+ https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master ( Note: MacOS (xnu) BSD syscall numbers are pretty different from Linux based x64 syscall, https://github.com/torvalds/linux/blob/master/arch/x86/entry/syscalls/syscall_64.tbl. )

+ The table-formatted version of the above link is https://sigsegv.pl/osx-bsd-syscalls/.
