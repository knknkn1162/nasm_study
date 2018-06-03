# Assembly

## MacOS

### Environments

Assume to be x86-64:


```bash
% uname -a
Darwin Kenta-Nakajima-no-MacBook-Pro.local 15.6.0 Darwin Kernel Version 15.6.0: Sun Jun  4 21:43:07 PDT 2017; root:xnu-3248.70.3~1/RELEASE_X86_64 x86_64
% sysctl -a machdep.cpu
machdep.cpu.max_basic: 20
machdep.cpu.max_ext: 2147483656
machdep.cpu.vendor: GenuineIntel
machdep.cpu.brand_string: Intel(R) Core(TM) i5-5257U CPU @ 2.70GHz
machdep.cpu.family: 6
machdep.cpu.model: 61
machdep.cpu.extmodel: 3
machdep.cpu.extfamily: 0
machdep.cpu.stepping: 4
machdep.cpu.feature_bits: 9221959987971750911
machdep.cpu.leaf7_feature_bits: 35399595
machdep.cpu.extfeature_bits: 1241984796928
machdep.cpu.signature: 198356
machdep.cpu.brand: 0
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: SMEP ERMS RDWRFSGS TSC_THREAD_OFFSET BMI1 AVX2 BMI2 INVPCID SMAP RDSEED ADX IPT FPU_CSDS
machdep.cpu.extfeatures: SYSCALL XD 1GBPAGE EM64T LAHF LZCNT PREFETCHW RDTSCP TSCI
machdep.cpu.logical_per_package: 16
machdep.cpu.cores_per_package: 8
machdep.cpu.microcode_version: 33
machdep.cpu.processor_flag: 6
machdep.cpu.mwait.linesize_min: 64
machdep.cpu.mwait.linesize_max: 64
machdep.cpu.mwait.extensions: 3
machdep.cpu.mwait.sub_Cstates: 286531872
machdep.cpu.thermal.sensor: 1
machdep.cpu.thermal.dynamic_acceleration: 1
machdep.cpu.thermal.invariant_APIC_timer: 1
machdep.cpu.thermal.thresholds: 2
machdep.cpu.thermal.ACNT_MCNT: 1
machdep.cpu.thermal.core_power_limits: 1
machdep.cpu.thermal.fine_grain_clock_mod: 1
machdep.cpu.thermal.package_thermal_intr: 1
machdep.cpu.thermal.hardware_feedback: 0
machdep.cpu.thermal.energy_policy: 1
machdep.cpu.xsave.extended_state: 7 832 832 0
machdep.cpu.xsave.extended_state1: 1 0 0 0
machdep.cpu.arch_perf.version: 3
machdep.cpu.arch_perf.number: 4
machdep.cpu.arch_perf.width: 48
machdep.cpu.arch_perf.events_number: 7
machdep.cpu.arch_perf.events: 0
machdep.cpu.arch_perf.fixed_number: 3
machdep.cpu.arch_perf.fixed_width: 48
machdep.cpu.cache.linesize: 64
machdep.cpu.cache.L2_associativity: 8
machdep.cpu.cache.size: 256
machdep.cpu.tlb.inst.large: 8
machdep.cpu.tlb.data.small: 64
machdep.cpu.tlb.data.small_level1: 64
machdep.cpu.address_bits.physical: 39
machdep.cpu.address_bits.virtual: 48
machdep.cpu.core_count: 2
machdep.cpu.thread_count: 4
machdep.cpu.tsc_ccc.numerator: 0
machdep.cpu.tsc_ccc.denominator: 0
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

+ General purpose Registers(GPR) is as follows:

|alias|Registers name|Description|Arguments|
|---|---|---|---|
|rax|r0|Kind of an 'accumulator'|ID|
|rbx|r3|Base register||
|rcx|r1|Used for cycles(e.g. loop)||
|rdx|r2|Store data during input/output operations|3|
|rsi|r6|Source index in string manipulatinon commands (e.g `movsd`)|2|
|rdi|r7|Destination index in string manipulation commands|1|
|rbp|r5|Stack frame's base||
|rsp|r4|Stores the address of the topmost element in the hardware stack||
||r8||5|
||r9||6|
||r10|sometimes save the CPU flag when syscall instruction is executed|4|
||r11|||
||r12|||
||r13|||
||r14|||
||r15|||

+ other registers is as follows:

|alias|Description|
|---|---|
|rsp|(ext)Instruction Pointer. It stores address of the next instruction to be executed|
|rflags|(ext)Program Status and Control Register|
|CS, DS, ES, SS, FS, and GS| segment registers|

For more information, see chapter3 in `Intel® 64 and IA-32 Architectures Software Developer’s Manual`

### references

+ The gist page, https://gist.github.com/FiloSottile/7125822, describes the brief code and some references for MacOS.

+ https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master ( Note: MacOS (xnu) BSD syscall numbers are pretty different from Linux based x64 syscall, https://github.com/torvalds/linux/blob/master/arch/x86/entry/syscalls/syscall_64.tbl. )

+ The table-formatted version of the above link is https://sigsegv.pl/osx-bsd-syscalls/.


+ Intel® 64 and IA-32 Architectures Software Developer’s Manual, https://software.intel.com/en-us/download/intel-64-and-ia-32-architectures-sdm-combined-volumes-1-2a-2b-2c-2d-3a-3b-3c-3d-and-4

## ubuntu

### Environments

```bash
$ uname -a
Linux vagrant-ubuntu-trusty-64 3.13.0-149-generic #199-Ubuntu SMP Thu May 17 10:12:50 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
$ cat /proc/cpuinfo
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 61
model name	: Intel(R) Core(TM) i5-5257U CPU @ 2.70GHz
stepping	: 4
cpu MHz		: 2700.120
cache size	: 3072 KB
physical id	: 0
siblings	: 1
core id		: 0
cpu cores	: 1
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 20
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc pni pclmulqdq monitor ssse3 cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx rdrand lahf_lm abm 3dnowprefetch fsgsbase avx2 invpcid rdseed
bogomips	: 5400.24
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:
$ cat /proc/meminfo
MemTotal:         501700 kB
MemFree:           37324 kB
Buffers:           13060 kB
Cached:           318720 kB
SwapCached:            0 kB
Active:           276260 kB
Inactive:         137940 kB
Active(anon):      82528 kB
Inactive(anon):      572 kB
Active(file):     193732 kB
Inactive(file):   137368 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:         82448 kB
Mapped:             9740 kB
Shmem:               680 kB
Slab:              38764 kB
SReclaimable:      30892 kB
SUnreclaim:         7872 kB
KernelStack:         672 kB
PageTables:         2524 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      250848 kB
Committed_AS:     144336 kB
VmallocTotal:   34359738367 kB
VmallocUsed:        7428 kB
VmallocChunk:   34359725564 kB
HardwareCorrupted:     0 kB
AnonHugePages:         0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:       34752 kB
DirectMap2M:      489472 kB
$ sudo apt-get install nasm
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
  nasm
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,503 kB of archives.
After this operation, 3,285 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu/ trusty/main nasm amd64 2.10.09-1 [1,503 kB]
Fetched 1,503 kB in 3s (431 kB/s)
Selecting previously unselected package nasm.
(Reading database ... 63130 files and directories currently installed.)
Preparing to unpack .../nasm_2.10.09-1_amd64.deb ...
Unpacking nasm (2.10.09-1) ...
Processing triggers for man-db (2.6.7.1-1ubuntu1) ...
Processing triggers for install-info (5.2.0.dfsg.1-2) ...
Setting up nasm (2.10.09-1) ...
vagrant@vagrant-ubuntu-trusty-64:~/asm/ubuntu$ nasm -v
NASM version 2.10.09 compiled on Dec 29 2013
```


Like MacOS, `.asm` file compiled via `nasm` except replacing `-o macho64` with `-o elf64`:

```bash
nasm -f elf64 hello.asm && ld -o res hello.o && ./res
```

### References

+ https://github.com/torvalds/linux/blob/master/arch/x86/entry/syscalls/syscall_64.tbl
+ http://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/

## Brief introduction to gdb

The debugger, gdb is to allow you to see what's going on inside step by step.

### Usage

```bash
$ sudo apt-get upgrade
$ sudo apt-get install gdb
# Assume that `./res` is executable file
$ gdb ./res
# To display assembly as intel syntax, put `set disassembly-flavor intel` in the `~/.gdbinit` file
(gdb) break _start
(gdb) start # type n to make breakpoint
# I recommend to enter TUI-mode.
# Type `Ctrl-X + 2` twice and you can see the register information(same as `layout regs`) and the assembly information (`layout asm`)
(gdb) si # have fun!
```

### command

+ si(stepi) .. step unit instruction
+ x [address] .. display address information
