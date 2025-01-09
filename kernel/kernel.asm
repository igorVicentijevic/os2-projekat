
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000e117          	auipc	sp,0xe
    80000004:	fb013103          	ld	sp,-80(sp) # 8000dfb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1a4000ef          	jal	800001ba <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
#ifndef __ASSEMBLER__

// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002a:	fe843783          	ld	a5,-24(s0)
}
    8000002e:	853e                	mv	a0,a5
    80000030:	6462                	ld	s0,24(sp)
    80000032:	6105                	addi	sp,sp,32
    80000034:	8082                	ret

0000000080000036 <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    80000036:	1101                	addi	sp,sp,-32
    80000038:	ec22                	sd	s0,24(sp)
    8000003a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    8000003c:	300027f3          	csrr	a5,mstatus
    80000040:	fef43423          	sd	a5,-24(s0)
  return x;
    80000044:	fe843783          	ld	a5,-24(s0)
}
    80000048:	853e                	mv	a0,a5
    8000004a:	6462                	ld	s0,24(sp)
    8000004c:	6105                	addi	sp,sp,32
    8000004e:	8082                	ret

0000000080000050 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000050:	1101                	addi	sp,sp,-32
    80000052:	ec22                	sd	s0,24(sp)
    80000054:	1000                	addi	s0,sp,32
    80000056:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    8000005a:	fe843783          	ld	a5,-24(s0)
    8000005e:	30079073          	csrw	mstatus,a5
}
    80000062:	0001                	nop
    80000064:	6462                	ld	s0,24(sp)
    80000066:	6105                	addi	sp,sp,32
    80000068:	8082                	ret

000000008000006a <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    8000006a:	1101                	addi	sp,sp,-32
    8000006c:	ec22                	sd	s0,24(sp)
    8000006e:	1000                	addi	s0,sp,32
    80000070:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000074:	fe843783          	ld	a5,-24(s0)
    80000078:	34179073          	csrw	mepc,a5
}
    8000007c:	0001                	nop
    8000007e:	6462                	ld	s0,24(sp)
    80000080:	6105                	addi	sp,sp,32
    80000082:	8082                	ret

0000000080000084 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000084:	1101                	addi	sp,sp,-32
    80000086:	ec22                	sd	s0,24(sp)
    80000088:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000008a:	104027f3          	csrr	a5,sie
    8000008e:	fef43423          	sd	a5,-24(s0)
  return x;
    80000092:	fe843783          	ld	a5,-24(s0)
}
    80000096:	853e                	mv	a0,a5
    80000098:	6462                	ld	s0,24(sp)
    8000009a:	6105                	addi	sp,sp,32
    8000009c:	8082                	ret

000000008000009e <w_sie>:

static inline void 
w_sie(uint64 x)
{
    8000009e:	1101                	addi	sp,sp,-32
    800000a0:	ec22                	sd	s0,24(sp)
    800000a2:	1000                	addi	s0,sp,32
    800000a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000a8:	fe843783          	ld	a5,-24(s0)
    800000ac:	10479073          	csrw	sie,a5
}
    800000b0:	0001                	nop
    800000b2:	6462                	ld	s0,24(sp)
    800000b4:	6105                	addi	sp,sp,32
    800000b6:	8082                	ret

00000000800000b8 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000b8:	1101                	addi	sp,sp,-32
    800000ba:	ec22                	sd	s0,24(sp)
    800000bc:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000be:	304027f3          	csrr	a5,mie
    800000c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800000c6:	fe843783          	ld	a5,-24(s0)
}
    800000ca:	853e                	mv	a0,a5
    800000cc:	6462                	ld	s0,24(sp)
    800000ce:	6105                	addi	sp,sp,32
    800000d0:	8082                	ret

00000000800000d2 <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000d2:	1101                	addi	sp,sp,-32
    800000d4:	ec22                	sd	s0,24(sp)
    800000d6:	1000                	addi	s0,sp,32
    800000d8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000dc:	fe843783          	ld	a5,-24(s0)
    800000e0:	30479073          	csrw	mie,a5
}
    800000e4:	0001                	nop
    800000e6:	6462                	ld	s0,24(sp)
    800000e8:	6105                	addi	sp,sp,32
    800000ea:	8082                	ret

00000000800000ec <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    800000ec:	1101                	addi	sp,sp,-32
    800000ee:	ec22                	sd	s0,24(sp)
    800000f0:	1000                	addi	s0,sp,32
    800000f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    800000f6:	fe843783          	ld	a5,-24(s0)
    800000fa:	30279073          	csrw	medeleg,a5
}
    800000fe:	0001                	nop
    80000100:	6462                	ld	s0,24(sp)
    80000102:	6105                	addi	sp,sp,32
    80000104:	8082                	ret

0000000080000106 <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    80000106:	1101                	addi	sp,sp,-32
    80000108:	ec22                	sd	s0,24(sp)
    8000010a:	1000                	addi	s0,sp,32
    8000010c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000110:	fe843783          	ld	a5,-24(s0)
    80000114:	30379073          	csrw	mideleg,a5
}
    80000118:	0001                	nop
    8000011a:	6462                	ld	s0,24(sp)
    8000011c:	6105                	addi	sp,sp,32
    8000011e:	8082                	ret

0000000080000120 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000120:	1101                	addi	sp,sp,-32
    80000122:	ec22                	sd	s0,24(sp)
    80000124:	1000                	addi	s0,sp,32
    80000126:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    8000012a:	fe843783          	ld	a5,-24(s0)
    8000012e:	30579073          	csrw	mtvec,a5
}
    80000132:	0001                	nop
    80000134:	6462                	ld	s0,24(sp)
    80000136:	6105                	addi	sp,sp,32
    80000138:	8082                	ret

000000008000013a <w_pmpcfg0>:

// Physical Memory Protection
static inline void
w_pmpcfg0(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	3a079073          	csrw	pmpcfg0,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_pmpaddr0>:

static inline void
w_pmpaddr0(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	3b079073          	csrw	pmpaddr0,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	18079073          	csrw	satp,a5
}
    80000180:	0001                	nop
    80000182:	6462                	ld	s0,24(sp)
    80000184:	6105                	addi	sp,sp,32
    80000186:	8082                	ret

0000000080000188 <w_mscratch>:
  return x;
}

static inline void 
w_mscratch(uint64 x)
{
    80000188:	1101                	addi	sp,sp,-32
    8000018a:	ec22                	sd	s0,24(sp)
    8000018c:	1000                	addi	s0,sp,32
    8000018e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    80000192:	fe843783          	ld	a5,-24(s0)
    80000196:	34079073          	csrw	mscratch,a5
}
    8000019a:	0001                	nop
    8000019c:	6462                	ld	s0,24(sp)
    8000019e:	6105                	addi	sp,sp,32
    800001a0:	8082                	ret

00000000800001a2 <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    800001a2:	1101                	addi	sp,sp,-32
    800001a4:	ec22                	sd	s0,24(sp)
    800001a6:	1000                	addi	s0,sp,32
    800001a8:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    800001ac:	fe843783          	ld	a5,-24(s0)
    800001b0:	823e                	mv	tp,a5
}
    800001b2:	0001                	nop
    800001b4:	6462                	ld	s0,24(sp)
    800001b6:	6105                	addi	sp,sp,32
    800001b8:	8082                	ret

00000000800001ba <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    800001ba:	1101                	addi	sp,sp,-32
    800001bc:	ec06                	sd	ra,24(sp)
    800001be:	e822                	sd	s0,16(sp)
    800001c0:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    800001c2:	00000097          	auipc	ra,0x0
    800001c6:	e74080e7          	jalr	-396(ra) # 80000036 <r_mstatus>
    800001ca:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    800001ce:	fe843703          	ld	a4,-24(s0)
    800001d2:	77f9                	lui	a5,0xffffe
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffd6dbf>
    800001d8:	8ff9                	and	a5,a5,a4
    800001da:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001de:	fe843703          	ld	a4,-24(s0)
    800001e2:	6785                	lui	a5,0x1
    800001e4:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001e8:	8fd9                	or	a5,a5,a4
    800001ea:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ee:	fe843503          	ld	a0,-24(s0)
    800001f2:	00000097          	auipc	ra,0x0
    800001f6:	e5e080e7          	jalr	-418(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001fa:	00001797          	auipc	a5,0x1
    800001fe:	7ee78793          	addi	a5,a5,2030 # 800019e8 <main>
    80000202:	853e                	mv	a0,a5
    80000204:	00000097          	auipc	ra,0x0
    80000208:	e66080e7          	jalr	-410(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    8000020c:	4501                	li	a0,0
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	f60080e7          	jalr	-160(ra) # 8000016e <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    80000216:	67c1                	lui	a5,0x10
    80000218:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000021c:	00000097          	auipc	ra,0x0
    80000220:	ed0080e7          	jalr	-304(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    80000224:	67c1                	lui	a5,0x10
    80000226:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000022a:	00000097          	auipc	ra,0x0
    8000022e:	edc080e7          	jalr	-292(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    80000232:	00000097          	auipc	ra,0x0
    80000236:	e52080e7          	jalr	-430(ra) # 80000084 <r_sie>
    8000023a:	87aa                	mv	a5,a0
    8000023c:	2227e793          	ori	a5,a5,546
    80000240:	853e                	mv	a0,a5
    80000242:	00000097          	auipc	ra,0x0
    80000246:	e5c080e7          	jalr	-420(ra) # 8000009e <w_sie>

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  w_pmpaddr0(0x3fffffffffffffull);
    8000024a:	57fd                	li	a5,-1
    8000024c:	00a7d513          	srli	a0,a5,0xa
    80000250:	00000097          	auipc	ra,0x0
    80000254:	f04080e7          	jalr	-252(ra) # 80000154 <w_pmpaddr0>
  w_pmpcfg0(0xf);
    80000258:	453d                	li	a0,15
    8000025a:	00000097          	auipc	ra,0x0
    8000025e:	ee0080e7          	jalr	-288(ra) # 8000013a <w_pmpcfg0>

  // ask for clock interrupts.
  timerinit();
    80000262:	00000097          	auipc	ra,0x0
    80000266:	032080e7          	jalr	50(ra) # 80000294 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000026a:	00000097          	auipc	ra,0x0
    8000026e:	db2080e7          	jalr	-590(ra) # 8000001c <r_mhartid>
    80000272:	87aa                	mv	a5,a0
    80000274:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    80000278:	fe442783          	lw	a5,-28(s0)
    8000027c:	853e                	mv	a0,a5
    8000027e:	00000097          	auipc	ra,0x0
    80000282:	f24080e7          	jalr	-220(ra) # 800001a2 <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    80000286:	30200073          	mret
}
    8000028a:	0001                	nop
    8000028c:	60e2                	ld	ra,24(sp)
    8000028e:	6442                	ld	s0,16(sp)
    80000290:	6105                	addi	sp,sp,32
    80000292:	8082                	ret

0000000080000294 <timerinit>:
// at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000294:	1101                	addi	sp,sp,-32
    80000296:	ec06                	sd	ra,24(sp)
    80000298:	e822                	sd	s0,16(sp)
    8000029a:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    8000029c:	00000097          	auipc	ra,0x0
    800002a0:	d80080e7          	jalr	-640(ra) # 8000001c <r_mhartid>
    800002a4:	87aa                	mv	a5,a0
    800002a6:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 100000; // cycles; about 1/100th second in qemu.
    800002aa:	67e1                	lui	a5,0x18
    800002ac:	6a078793          	addi	a5,a5,1696 # 186a0 <_entry-0x7ffe7960>
    800002b0:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    800002b4:	0200c7b7          	lui	a5,0x200c
    800002b8:	17e1                	addi	a5,a5,-8 # 200bff8 <_entry-0x7dff4008>
    800002ba:	6398                	ld	a4,0(a5)
    800002bc:	fe842783          	lw	a5,-24(s0)
    800002c0:	fec42683          	lw	a3,-20(s0)
    800002c4:	0036969b          	slliw	a3,a3,0x3
    800002c8:	2681                	sext.w	a3,a3
    800002ca:	8636                	mv	a2,a3
    800002cc:	020046b7          	lui	a3,0x2004
    800002d0:	96b2                	add	a3,a3,a2
    800002d2:	97ba                	add	a5,a5,a4
    800002d4:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    800002d6:	fec42703          	lw	a4,-20(s0)
    800002da:	87ba                	mv	a5,a4
    800002dc:	078a                	slli	a5,a5,0x2
    800002de:	97ba                	add	a5,a5,a4
    800002e0:	078e                	slli	a5,a5,0x3
    800002e2:	00016717          	auipc	a4,0x16
    800002e6:	d1e70713          	addi	a4,a4,-738 # 80016000 <timer_scratch>
    800002ea:	97ba                	add	a5,a5,a4
    800002ec:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002f0:	fec42783          	lw	a5,-20(s0)
    800002f4:	0037979b          	slliw	a5,a5,0x3
    800002f8:	2781                	sext.w	a5,a5
    800002fa:	873e                	mv	a4,a5
    800002fc:	020047b7          	lui	a5,0x2004
    80000300:	973e                	add	a4,a4,a5
    80000302:	fe043783          	ld	a5,-32(s0)
    80000306:	07e1                	addi	a5,a5,24 # 2004018 <_entry-0x7dffbfe8>
    80000308:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    8000030a:	fe043783          	ld	a5,-32(s0)
    8000030e:	02078793          	addi	a5,a5,32
    80000312:	fe842703          	lw	a4,-24(s0)
    80000316:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    80000318:	fe043783          	ld	a5,-32(s0)
    8000031c:	853e                	mv	a0,a5
    8000031e:	00000097          	auipc	ra,0x0
    80000322:	e6a080e7          	jalr	-406(ra) # 80000188 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    80000326:	00009797          	auipc	a5,0x9
    8000032a:	91a78793          	addi	a5,a5,-1766 # 80008c40 <timervec>
    8000032e:	853e                	mv	a0,a5
    80000330:	00000097          	auipc	ra,0x0
    80000334:	df0080e7          	jalr	-528(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    80000338:	00000097          	auipc	ra,0x0
    8000033c:	cfe080e7          	jalr	-770(ra) # 80000036 <r_mstatus>
    80000340:	87aa                	mv	a5,a0
    80000342:	0087e793          	ori	a5,a5,8
    80000346:	853e                	mv	a0,a5
    80000348:	00000097          	auipc	ra,0x0
    8000034c:	d08080e7          	jalr	-760(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000350:	00000097          	auipc	ra,0x0
    80000354:	d68080e7          	jalr	-664(ra) # 800000b8 <r_mie>
    80000358:	87aa                	mv	a5,a0
    8000035a:	0807e793          	ori	a5,a5,128
    8000035e:	853e                	mv	a0,a5
    80000360:	00000097          	auipc	ra,0x0
    80000364:	d72080e7          	jalr	-654(ra) # 800000d2 <w_mie>
}
    80000368:	0001                	nop
    8000036a:	60e2                	ld	ra,24(sp)
    8000036c:	6442                	ld	s0,16(sp)
    8000036e:	6105                	addi	sp,sp,32
    80000370:	8082                	ret

0000000080000372 <consputc>:
// called by printf(), and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000372:	1101                	addi	sp,sp,-32
    80000374:	ec06                	sd	ra,24(sp)
    80000376:	e822                	sd	s0,16(sp)
    80000378:	1000                	addi	s0,sp,32
    8000037a:	87aa                	mv	a5,a0
    8000037c:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000380:	fec42783          	lw	a5,-20(s0)
    80000384:	0007871b          	sext.w	a4,a5
    80000388:	10000793          	li	a5,256
    8000038c:	02f71363          	bne	a4,a5,800003b2 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000390:	4521                	li	a0,8
    80000392:	00001097          	auipc	ra,0x1
    80000396:	b6a080e7          	jalr	-1174(ra) # 80000efc <uartputc_sync>
    8000039a:	02000513          	li	a0,32
    8000039e:	00001097          	auipc	ra,0x1
    800003a2:	b5e080e7          	jalr	-1186(ra) # 80000efc <uartputc_sync>
    800003a6:	4521                	li	a0,8
    800003a8:	00001097          	auipc	ra,0x1
    800003ac:	b54080e7          	jalr	-1196(ra) # 80000efc <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    800003b0:	a801                	j	800003c0 <consputc+0x4e>
    uartputc_sync(c);
    800003b2:	fec42783          	lw	a5,-20(s0)
    800003b6:	853e                	mv	a0,a5
    800003b8:	00001097          	auipc	ra,0x1
    800003bc:	b44080e7          	jalr	-1212(ra) # 80000efc <uartputc_sync>
}
    800003c0:	0001                	nop
    800003c2:	60e2                	ld	ra,24(sp)
    800003c4:	6442                	ld	s0,16(sp)
    800003c6:	6105                	addi	sp,sp,32
    800003c8:	8082                	ret

00000000800003ca <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    800003ca:	7179                	addi	sp,sp,-48
    800003cc:	f406                	sd	ra,40(sp)
    800003ce:	f022                	sd	s0,32(sp)
    800003d0:	1800                	addi	s0,sp,48
    800003d2:	87aa                	mv	a5,a0
    800003d4:	fcb43823          	sd	a1,-48(s0)
    800003d8:	8732                	mv	a4,a2
    800003da:	fcf42e23          	sw	a5,-36(s0)
    800003de:	87ba                	mv	a5,a4
    800003e0:	fcf42c23          	sw	a5,-40(s0)
  int i;

  for(i = 0; i < n; i++){
    800003e4:	fe042623          	sw	zero,-20(s0)
    800003e8:	a0a1                	j	80000430 <consolewrite+0x66>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003ea:	fec42703          	lw	a4,-20(s0)
    800003ee:	fd043783          	ld	a5,-48(s0)
    800003f2:	00f70633          	add	a2,a4,a5
    800003f6:	fdc42703          	lw	a4,-36(s0)
    800003fa:	feb40793          	addi	a5,s0,-21
    800003fe:	4685                	li	a3,1
    80000400:	85ba                	mv	a1,a4
    80000402:	853e                	mv	a0,a5
    80000404:	00003097          	auipc	ra,0x3
    80000408:	57e080e7          	jalr	1406(ra) # 80003982 <either_copyin>
    8000040c:	87aa                	mv	a5,a0
    8000040e:	873e                	mv	a4,a5
    80000410:	57fd                	li	a5,-1
    80000412:	02f70963          	beq	a4,a5,80000444 <consolewrite+0x7a>
      break;
    uartputc(c);
    80000416:	feb44783          	lbu	a5,-21(s0)
    8000041a:	2781                	sext.w	a5,a5
    8000041c:	853e                	mv	a0,a5
    8000041e:	00001097          	auipc	ra,0x1
    80000422:	a1e080e7          	jalr	-1506(ra) # 80000e3c <uartputc>
  for(i = 0; i < n; i++){
    80000426:	fec42783          	lw	a5,-20(s0)
    8000042a:	2785                	addiw	a5,a5,1
    8000042c:	fef42623          	sw	a5,-20(s0)
    80000430:	fec42783          	lw	a5,-20(s0)
    80000434:	873e                	mv	a4,a5
    80000436:	fd842783          	lw	a5,-40(s0)
    8000043a:	2701                	sext.w	a4,a4
    8000043c:	2781                	sext.w	a5,a5
    8000043e:	faf746e3          	blt	a4,a5,800003ea <consolewrite+0x20>
    80000442:	a011                	j	80000446 <consolewrite+0x7c>
      break;
    80000444:	0001                	nop
  }

  return i;
    80000446:	fec42783          	lw	a5,-20(s0)
}
    8000044a:	853e                	mv	a0,a5
    8000044c:	70a2                	ld	ra,40(sp)
    8000044e:	7402                	ld	s0,32(sp)
    80000450:	6145                	addi	sp,sp,48
    80000452:	8082                	ret

0000000080000454 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000454:	7179                	addi	sp,sp,-48
    80000456:	f406                	sd	ra,40(sp)
    80000458:	f022                	sd	s0,32(sp)
    8000045a:	1800                	addi	s0,sp,48
    8000045c:	87aa                	mv	a5,a0
    8000045e:	fcb43823          	sd	a1,-48(s0)
    80000462:	8732                	mv	a4,a2
    80000464:	fcf42e23          	sw	a5,-36(s0)
    80000468:	87ba                	mv	a5,a4
    8000046a:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    8000046e:	fd842783          	lw	a5,-40(s0)
    80000472:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000476:	00016517          	auipc	a0,0x16
    8000047a:	cca50513          	addi	a0,a0,-822 # 80016140 <cons>
    8000047e:	00001097          	auipc	ra,0x1
    80000482:	eb2080e7          	jalr	-334(ra) # 80001330 <acquire>
  while(n > 0){
    80000486:	a23d                	j	800005b4 <consoleread+0x160>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(killed(myproc())){
    80000488:	00002097          	auipc	ra,0x2
    8000048c:	676080e7          	jalr	1654(ra) # 80002afe <myproc>
    80000490:	87aa                	mv	a5,a0
    80000492:	853e                	mv	a0,a5
    80000494:	00003097          	auipc	ra,0x3
    80000498:	43a080e7          	jalr	1082(ra) # 800038ce <killed>
    8000049c:	87aa                	mv	a5,a0
    8000049e:	cb99                	beqz	a5,800004b4 <consoleread+0x60>
        release(&cons.lock);
    800004a0:	00016517          	auipc	a0,0x16
    800004a4:	ca050513          	addi	a0,a0,-864 # 80016140 <cons>
    800004a8:	00001097          	auipc	ra,0x1
    800004ac:	eec080e7          	jalr	-276(ra) # 80001394 <release>
        return -1;
    800004b0:	57fd                	li	a5,-1
    800004b2:	aa25                	j	800005ea <consoleread+0x196>
      }
      sleep(&cons.r, &cons.lock);
    800004b4:	00016597          	auipc	a1,0x16
    800004b8:	c8c58593          	addi	a1,a1,-884 # 80016140 <cons>
    800004bc:	00016517          	auipc	a0,0x16
    800004c0:	d1c50513          	addi	a0,a0,-740 # 800161d8 <cons+0x98>
    800004c4:	00003097          	auipc	ra,0x3
    800004c8:	1fc080e7          	jalr	508(ra) # 800036c0 <sleep>
    while(cons.r == cons.w){
    800004cc:	00016797          	auipc	a5,0x16
    800004d0:	c7478793          	addi	a5,a5,-908 # 80016140 <cons>
    800004d4:	0987a703          	lw	a4,152(a5)
    800004d8:	00016797          	auipc	a5,0x16
    800004dc:	c6878793          	addi	a5,a5,-920 # 80016140 <cons>
    800004e0:	09c7a783          	lw	a5,156(a5)
    800004e4:	faf702e3          	beq	a4,a5,80000488 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF_SIZE];
    800004e8:	00016797          	auipc	a5,0x16
    800004ec:	c5878793          	addi	a5,a5,-936 # 80016140 <cons>
    800004f0:	0987a783          	lw	a5,152(a5)
    800004f4:	2781                	sext.w	a5,a5
    800004f6:	0017871b          	addiw	a4,a5,1
    800004fa:	0007069b          	sext.w	a3,a4
    800004fe:	00016717          	auipc	a4,0x16
    80000502:	c4270713          	addi	a4,a4,-958 # 80016140 <cons>
    80000506:	08d72c23          	sw	a3,152(a4)
    8000050a:	07f7f793          	andi	a5,a5,127
    8000050e:	2781                	sext.w	a5,a5
    80000510:	00016717          	auipc	a4,0x16
    80000514:	c3070713          	addi	a4,a4,-976 # 80016140 <cons>
    80000518:	1782                	slli	a5,a5,0x20
    8000051a:	9381                	srli	a5,a5,0x20
    8000051c:	97ba                	add	a5,a5,a4
    8000051e:	0187c783          	lbu	a5,24(a5)
    80000522:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    80000526:	fe842783          	lw	a5,-24(s0)
    8000052a:	0007871b          	sext.w	a4,a5
    8000052e:	4791                	li	a5,4
    80000530:	02f71963          	bne	a4,a5,80000562 <consoleread+0x10e>
      if(n < target){
    80000534:	fd842703          	lw	a4,-40(s0)
    80000538:	fec42783          	lw	a5,-20(s0)
    8000053c:	2781                	sext.w	a5,a5
    8000053e:	08f77163          	bgeu	a4,a5,800005c0 <consoleread+0x16c>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    80000542:	00016797          	auipc	a5,0x16
    80000546:	bfe78793          	addi	a5,a5,-1026 # 80016140 <cons>
    8000054a:	0987a783          	lw	a5,152(a5)
    8000054e:	37fd                	addiw	a5,a5,-1
    80000550:	0007871b          	sext.w	a4,a5
    80000554:	00016797          	auipc	a5,0x16
    80000558:	bec78793          	addi	a5,a5,-1044 # 80016140 <cons>
    8000055c:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    80000560:	a085                	j	800005c0 <consoleread+0x16c>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    80000562:	fe842783          	lw	a5,-24(s0)
    80000566:	0ff7f793          	zext.b	a5,a5
    8000056a:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    8000056e:	fe740713          	addi	a4,s0,-25
    80000572:	fdc42783          	lw	a5,-36(s0)
    80000576:	4685                	li	a3,1
    80000578:	863a                	mv	a2,a4
    8000057a:	fd043583          	ld	a1,-48(s0)
    8000057e:	853e                	mv	a0,a5
    80000580:	00003097          	auipc	ra,0x3
    80000584:	38e080e7          	jalr	910(ra) # 8000390e <either_copyout>
    80000588:	87aa                	mv	a5,a0
    8000058a:	873e                	mv	a4,a5
    8000058c:	57fd                	li	a5,-1
    8000058e:	02f70b63          	beq	a4,a5,800005c4 <consoleread+0x170>
      break;

    dst++;
    80000592:	fd043783          	ld	a5,-48(s0)
    80000596:	0785                	addi	a5,a5,1
    80000598:	fcf43823          	sd	a5,-48(s0)
    --n;
    8000059c:	fd842783          	lw	a5,-40(s0)
    800005a0:	37fd                	addiw	a5,a5,-1
    800005a2:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    800005a6:	fe842783          	lw	a5,-24(s0)
    800005aa:	0007871b          	sext.w	a4,a5
    800005ae:	47a9                	li	a5,10
    800005b0:	00f70c63          	beq	a4,a5,800005c8 <consoleread+0x174>
  while(n > 0){
    800005b4:	fd842783          	lw	a5,-40(s0)
    800005b8:	2781                	sext.w	a5,a5
    800005ba:	f0f049e3          	bgtz	a5,800004cc <consoleread+0x78>
    800005be:	a031                	j	800005ca <consoleread+0x176>
      break;
    800005c0:	0001                	nop
    800005c2:	a021                	j	800005ca <consoleread+0x176>
      break;
    800005c4:	0001                	nop
    800005c6:	a011                	j	800005ca <consoleread+0x176>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    800005c8:	0001                	nop
    }
  }
  release(&cons.lock);
    800005ca:	00016517          	auipc	a0,0x16
    800005ce:	b7650513          	addi	a0,a0,-1162 # 80016140 <cons>
    800005d2:	00001097          	auipc	ra,0x1
    800005d6:	dc2080e7          	jalr	-574(ra) # 80001394 <release>

  return target - n;
    800005da:	fd842783          	lw	a5,-40(s0)
    800005de:	fec42703          	lw	a4,-20(s0)
    800005e2:	40f707bb          	subw	a5,a4,a5
    800005e6:	2781                	sext.w	a5,a5
    800005e8:	2781                	sext.w	a5,a5
}
    800005ea:	853e                	mv	a0,a5
    800005ec:	70a2                	ld	ra,40(sp)
    800005ee:	7402                	ld	s0,32(sp)
    800005f0:	6145                	addi	sp,sp,48
    800005f2:	8082                	ret

00000000800005f4 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005f4:	1101                	addi	sp,sp,-32
    800005f6:	ec06                	sd	ra,24(sp)
    800005f8:	e822                	sd	s0,16(sp)
    800005fa:	1000                	addi	s0,sp,32
    800005fc:	87aa                	mv	a5,a0
    800005fe:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000602:	00016517          	auipc	a0,0x16
    80000606:	b3e50513          	addi	a0,a0,-1218 # 80016140 <cons>
    8000060a:	00001097          	auipc	ra,0x1
    8000060e:	d26080e7          	jalr	-730(ra) # 80001330 <acquire>

  switch(c){
    80000612:	fec42783          	lw	a5,-20(s0)
    80000616:	0007871b          	sext.w	a4,a5
    8000061a:	07f00793          	li	a5,127
    8000061e:	0cf70763          	beq	a4,a5,800006ec <consoleintr+0xf8>
    80000622:	fec42783          	lw	a5,-20(s0)
    80000626:	0007871b          	sext.w	a4,a5
    8000062a:	07f00793          	li	a5,127
    8000062e:	10e7c363          	blt	a5,a4,80000734 <consoleintr+0x140>
    80000632:	fec42783          	lw	a5,-20(s0)
    80000636:	0007871b          	sext.w	a4,a5
    8000063a:	47d5                	li	a5,21
    8000063c:	06f70163          	beq	a4,a5,8000069e <consoleintr+0xaa>
    80000640:	fec42783          	lw	a5,-20(s0)
    80000644:	0007871b          	sext.w	a4,a5
    80000648:	47d5                	li	a5,21
    8000064a:	0ee7c563          	blt	a5,a4,80000734 <consoleintr+0x140>
    8000064e:	fec42783          	lw	a5,-20(s0)
    80000652:	0007871b          	sext.w	a4,a5
    80000656:	47a1                	li	a5,8
    80000658:	08f70a63          	beq	a4,a5,800006ec <consoleintr+0xf8>
    8000065c:	fec42783          	lw	a5,-20(s0)
    80000660:	0007871b          	sext.w	a4,a5
    80000664:	47c1                	li	a5,16
    80000666:	0cf71763          	bne	a4,a5,80000734 <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    8000066a:	00003097          	auipc	ra,0x3
    8000066e:	38c080e7          	jalr	908(ra) # 800039f6 <procdump>
    break;
    80000672:	aad9                	j	80000848 <consoleintr+0x254>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
      cons.e--;
    80000674:	00016797          	auipc	a5,0x16
    80000678:	acc78793          	addi	a5,a5,-1332 # 80016140 <cons>
    8000067c:	0a07a783          	lw	a5,160(a5)
    80000680:	37fd                	addiw	a5,a5,-1
    80000682:	0007871b          	sext.w	a4,a5
    80000686:	00016797          	auipc	a5,0x16
    8000068a:	aba78793          	addi	a5,a5,-1350 # 80016140 <cons>
    8000068e:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000692:	10000513          	li	a0,256
    80000696:	00000097          	auipc	ra,0x0
    8000069a:	cdc080e7          	jalr	-804(ra) # 80000372 <consputc>
    while(cons.e != cons.w &&
    8000069e:	00016797          	auipc	a5,0x16
    800006a2:	aa278793          	addi	a5,a5,-1374 # 80016140 <cons>
    800006a6:	0a07a703          	lw	a4,160(a5)
    800006aa:	00016797          	auipc	a5,0x16
    800006ae:	a9678793          	addi	a5,a5,-1386 # 80016140 <cons>
    800006b2:	09c7a783          	lw	a5,156(a5)
    800006b6:	18f70463          	beq	a4,a5,8000083e <consoleintr+0x24a>
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
    800006ba:	00016797          	auipc	a5,0x16
    800006be:	a8678793          	addi	a5,a5,-1402 # 80016140 <cons>
    800006c2:	0a07a783          	lw	a5,160(a5)
    800006c6:	37fd                	addiw	a5,a5,-1
    800006c8:	2781                	sext.w	a5,a5
    800006ca:	07f7f793          	andi	a5,a5,127
    800006ce:	2781                	sext.w	a5,a5
    800006d0:	00016717          	auipc	a4,0x16
    800006d4:	a7070713          	addi	a4,a4,-1424 # 80016140 <cons>
    800006d8:	1782                	slli	a5,a5,0x20
    800006da:	9381                	srli	a5,a5,0x20
    800006dc:	97ba                	add	a5,a5,a4
    800006de:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006e2:	873e                	mv	a4,a5
    800006e4:	47a9                	li	a5,10
    800006e6:	f8f717e3          	bne	a4,a5,80000674 <consoleintr+0x80>
    }
    break;
    800006ea:	aa91                	j	8000083e <consoleintr+0x24a>
  case C('H'): // Backspace
  case '\x7f': // Delete key
    if(cons.e != cons.w){
    800006ec:	00016797          	auipc	a5,0x16
    800006f0:	a5478793          	addi	a5,a5,-1452 # 80016140 <cons>
    800006f4:	0a07a703          	lw	a4,160(a5)
    800006f8:	00016797          	auipc	a5,0x16
    800006fc:	a4878793          	addi	a5,a5,-1464 # 80016140 <cons>
    80000700:	09c7a783          	lw	a5,156(a5)
    80000704:	12f70f63          	beq	a4,a5,80000842 <consoleintr+0x24e>
      cons.e--;
    80000708:	00016797          	auipc	a5,0x16
    8000070c:	a3878793          	addi	a5,a5,-1480 # 80016140 <cons>
    80000710:	0a07a783          	lw	a5,160(a5)
    80000714:	37fd                	addiw	a5,a5,-1
    80000716:	0007871b          	sext.w	a4,a5
    8000071a:	00016797          	auipc	a5,0x16
    8000071e:	a2678793          	addi	a5,a5,-1498 # 80016140 <cons>
    80000722:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000726:	10000513          	li	a0,256
    8000072a:	00000097          	auipc	ra,0x0
    8000072e:	c48080e7          	jalr	-952(ra) # 80000372 <consputc>
    }
    break;
    80000732:	aa01                	j	80000842 <consoleintr+0x24e>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF_SIZE){
    80000734:	fec42783          	lw	a5,-20(s0)
    80000738:	2781                	sext.w	a5,a5
    8000073a:	10078663          	beqz	a5,80000846 <consoleintr+0x252>
    8000073e:	00016797          	auipc	a5,0x16
    80000742:	a0278793          	addi	a5,a5,-1534 # 80016140 <cons>
    80000746:	0a07a703          	lw	a4,160(a5)
    8000074a:	00016797          	auipc	a5,0x16
    8000074e:	9f678793          	addi	a5,a5,-1546 # 80016140 <cons>
    80000752:	0987a783          	lw	a5,152(a5)
    80000756:	40f707bb          	subw	a5,a4,a5
    8000075a:	2781                	sext.w	a5,a5
    8000075c:	873e                	mv	a4,a5
    8000075e:	07f00793          	li	a5,127
    80000762:	0ee7e263          	bltu	a5,a4,80000846 <consoleintr+0x252>
      c = (c == '\r') ? '\n' : c;
    80000766:	fec42783          	lw	a5,-20(s0)
    8000076a:	0007871b          	sext.w	a4,a5
    8000076e:	47b5                	li	a5,13
    80000770:	00f70563          	beq	a4,a5,8000077a <consoleintr+0x186>
    80000774:	fec42783          	lw	a5,-20(s0)
    80000778:	a011                	j	8000077c <consoleintr+0x188>
    8000077a:	47a9                	li	a5,10
    8000077c:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    80000780:	fec42783          	lw	a5,-20(s0)
    80000784:	853e                	mv	a0,a5
    80000786:	00000097          	auipc	ra,0x0
    8000078a:	bec080e7          	jalr	-1044(ra) # 80000372 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF_SIZE] = c;
    8000078e:	00016797          	auipc	a5,0x16
    80000792:	9b278793          	addi	a5,a5,-1614 # 80016140 <cons>
    80000796:	0a07a783          	lw	a5,160(a5)
    8000079a:	2781                	sext.w	a5,a5
    8000079c:	0017871b          	addiw	a4,a5,1
    800007a0:	0007069b          	sext.w	a3,a4
    800007a4:	00016717          	auipc	a4,0x16
    800007a8:	99c70713          	addi	a4,a4,-1636 # 80016140 <cons>
    800007ac:	0ad72023          	sw	a3,160(a4)
    800007b0:	07f7f793          	andi	a5,a5,127
    800007b4:	2781                	sext.w	a5,a5
    800007b6:	fec42703          	lw	a4,-20(s0)
    800007ba:	0ff77713          	zext.b	a4,a4
    800007be:	00016697          	auipc	a3,0x16
    800007c2:	98268693          	addi	a3,a3,-1662 # 80016140 <cons>
    800007c6:	1782                	slli	a5,a5,0x20
    800007c8:	9381                	srli	a5,a5,0x20
    800007ca:	97b6                	add	a5,a5,a3
    800007cc:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e-cons.r == INPUT_BUF_SIZE){
    800007d0:	fec42783          	lw	a5,-20(s0)
    800007d4:	0007871b          	sext.w	a4,a5
    800007d8:	47a9                	li	a5,10
    800007da:	02f70d63          	beq	a4,a5,80000814 <consoleintr+0x220>
    800007de:	fec42783          	lw	a5,-20(s0)
    800007e2:	0007871b          	sext.w	a4,a5
    800007e6:	4791                	li	a5,4
    800007e8:	02f70663          	beq	a4,a5,80000814 <consoleintr+0x220>
    800007ec:	00016797          	auipc	a5,0x16
    800007f0:	95478793          	addi	a5,a5,-1708 # 80016140 <cons>
    800007f4:	0a07a703          	lw	a4,160(a5)
    800007f8:	00016797          	auipc	a5,0x16
    800007fc:	94878793          	addi	a5,a5,-1720 # 80016140 <cons>
    80000800:	0987a783          	lw	a5,152(a5)
    80000804:	40f707bb          	subw	a5,a4,a5
    80000808:	2781                	sext.w	a5,a5
    8000080a:	873e                	mv	a4,a5
    8000080c:	08000793          	li	a5,128
    80000810:	02f71b63          	bne	a4,a5,80000846 <consoleintr+0x252>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000814:	00016797          	auipc	a5,0x16
    80000818:	92c78793          	addi	a5,a5,-1748 # 80016140 <cons>
    8000081c:	0a07a703          	lw	a4,160(a5)
    80000820:	00016797          	auipc	a5,0x16
    80000824:	92078793          	addi	a5,a5,-1760 # 80016140 <cons>
    80000828:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000082c:	00016517          	auipc	a0,0x16
    80000830:	9ac50513          	addi	a0,a0,-1620 # 800161d8 <cons+0x98>
    80000834:	00003097          	auipc	ra,0x3
    80000838:	f08080e7          	jalr	-248(ra) # 8000373c <wakeup>
      }
    }
    break;
    8000083c:	a029                	j	80000846 <consoleintr+0x252>
    break;
    8000083e:	0001                	nop
    80000840:	a021                	j	80000848 <consoleintr+0x254>
    break;
    80000842:	0001                	nop
    80000844:	a011                	j	80000848 <consoleintr+0x254>
    break;
    80000846:	0001                	nop
  }
  
  release(&cons.lock);
    80000848:	00016517          	auipc	a0,0x16
    8000084c:	8f850513          	addi	a0,a0,-1800 # 80016140 <cons>
    80000850:	00001097          	auipc	ra,0x1
    80000854:	b44080e7          	jalr	-1212(ra) # 80001394 <release>
}
    80000858:	0001                	nop
    8000085a:	60e2                	ld	ra,24(sp)
    8000085c:	6442                	ld	s0,16(sp)
    8000085e:	6105                	addi	sp,sp,32
    80000860:	8082                	ret

0000000080000862 <consoleinit>:

void
consoleinit(void)
{
    80000862:	1141                	addi	sp,sp,-16
    80000864:	e406                	sd	ra,8(sp)
    80000866:	e022                	sd	s0,0(sp)
    80000868:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    8000086a:	0000a597          	auipc	a1,0xa
    8000086e:	79658593          	addi	a1,a1,1942 # 8000b000 <etext>
    80000872:	00016517          	auipc	a0,0x16
    80000876:	8ce50513          	addi	a0,a0,-1842 # 80016140 <cons>
    8000087a:	00001097          	auipc	ra,0x1
    8000087e:	a86080e7          	jalr	-1402(ra) # 80001300 <initlock>

  uartinit();
    80000882:	00000097          	auipc	ra,0x0
    80000886:	540080e7          	jalr	1344(ra) # 80000dc2 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000088a:	00026797          	auipc	a5,0x26
    8000088e:	a5678793          	addi	a5,a5,-1450 # 800262e0 <devsw>
    80000892:	00000717          	auipc	a4,0x0
    80000896:	bc270713          	addi	a4,a4,-1086 # 80000454 <consoleread>
    8000089a:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000089c:	00026797          	auipc	a5,0x26
    800008a0:	a4478793          	addi	a5,a5,-1468 # 800262e0 <devsw>
    800008a4:	00000717          	auipc	a4,0x0
    800008a8:	b2670713          	addi	a4,a4,-1242 # 800003ca <consolewrite>
    800008ac:	ef98                	sd	a4,24(a5)
}
    800008ae:	0001                	nop
    800008b0:	60a2                	ld	ra,8(sp)
    800008b2:	6402                	ld	s0,0(sp)
    800008b4:	0141                	addi	sp,sp,16
    800008b6:	8082                	ret

00000000800008b8 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    800008b8:	7139                	addi	sp,sp,-64
    800008ba:	fc06                	sd	ra,56(sp)
    800008bc:	f822                	sd	s0,48(sp)
    800008be:	0080                	addi	s0,sp,64
    800008c0:	87aa                	mv	a5,a0
    800008c2:	86ae                	mv	a3,a1
    800008c4:	8732                	mv	a4,a2
    800008c6:	fcf42623          	sw	a5,-52(s0)
    800008ca:	87b6                	mv	a5,a3
    800008cc:	fcf42423          	sw	a5,-56(s0)
    800008d0:	87ba                	mv	a5,a4
    800008d2:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    800008d6:	fc442783          	lw	a5,-60(s0)
    800008da:	2781                	sext.w	a5,a5
    800008dc:	c78d                	beqz	a5,80000906 <printint+0x4e>
    800008de:	fcc42783          	lw	a5,-52(s0)
    800008e2:	01f7d79b          	srliw	a5,a5,0x1f
    800008e6:	0ff7f793          	zext.b	a5,a5
    800008ea:	fcf42223          	sw	a5,-60(s0)
    800008ee:	fc442783          	lw	a5,-60(s0)
    800008f2:	2781                	sext.w	a5,a5
    800008f4:	cb89                	beqz	a5,80000906 <printint+0x4e>
    x = -xx;
    800008f6:	fcc42783          	lw	a5,-52(s0)
    800008fa:	40f007bb          	negw	a5,a5
    800008fe:	2781                	sext.w	a5,a5
    80000900:	fef42423          	sw	a5,-24(s0)
    80000904:	a029                	j	8000090e <printint+0x56>
  else
    x = xx;
    80000906:	fcc42783          	lw	a5,-52(s0)
    8000090a:	fef42423          	sw	a5,-24(s0)

  i = 0;
    8000090e:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    80000912:	fc842783          	lw	a5,-56(s0)
    80000916:	fe842703          	lw	a4,-24(s0)
    8000091a:	02f777bb          	remuw	a5,a4,a5
    8000091e:	0007861b          	sext.w	a2,a5
    80000922:	fec42783          	lw	a5,-20(s0)
    80000926:	0017871b          	addiw	a4,a5,1
    8000092a:	fee42623          	sw	a4,-20(s0)
    8000092e:	0000d697          	auipc	a3,0xd
    80000932:	52268693          	addi	a3,a3,1314 # 8000de50 <digits>
    80000936:	02061713          	slli	a4,a2,0x20
    8000093a:	9301                	srli	a4,a4,0x20
    8000093c:	9736                	add	a4,a4,a3
    8000093e:	00074703          	lbu	a4,0(a4)
    80000942:	17c1                	addi	a5,a5,-16
    80000944:	97a2                	add	a5,a5,s0
    80000946:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    8000094a:	fc842783          	lw	a5,-56(s0)
    8000094e:	fe842703          	lw	a4,-24(s0)
    80000952:	02f757bb          	divuw	a5,a4,a5
    80000956:	fef42423          	sw	a5,-24(s0)
    8000095a:	fe842783          	lw	a5,-24(s0)
    8000095e:	2781                	sext.w	a5,a5
    80000960:	fbcd                	bnez	a5,80000912 <printint+0x5a>

  if(sign)
    80000962:	fc442783          	lw	a5,-60(s0)
    80000966:	2781                	sext.w	a5,a5
    80000968:	cb95                	beqz	a5,8000099c <printint+0xe4>
    buf[i++] = '-';
    8000096a:	fec42783          	lw	a5,-20(s0)
    8000096e:	0017871b          	addiw	a4,a5,1
    80000972:	fee42623          	sw	a4,-20(s0)
    80000976:	17c1                	addi	a5,a5,-16
    80000978:	97a2                	add	a5,a5,s0
    8000097a:	02d00713          	li	a4,45
    8000097e:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    80000982:	a829                	j	8000099c <printint+0xe4>
    consputc(buf[i]);
    80000984:	fec42783          	lw	a5,-20(s0)
    80000988:	17c1                	addi	a5,a5,-16
    8000098a:	97a2                	add	a5,a5,s0
    8000098c:	fe87c783          	lbu	a5,-24(a5)
    80000990:	2781                	sext.w	a5,a5
    80000992:	853e                	mv	a0,a5
    80000994:	00000097          	auipc	ra,0x0
    80000998:	9de080e7          	jalr	-1570(ra) # 80000372 <consputc>
  while(--i >= 0)
    8000099c:	fec42783          	lw	a5,-20(s0)
    800009a0:	37fd                	addiw	a5,a5,-1
    800009a2:	fef42623          	sw	a5,-20(s0)
    800009a6:	fec42783          	lw	a5,-20(s0)
    800009aa:	2781                	sext.w	a5,a5
    800009ac:	fc07dce3          	bgez	a5,80000984 <printint+0xcc>
}
    800009b0:	0001                	nop
    800009b2:	0001                	nop
    800009b4:	70e2                	ld	ra,56(sp)
    800009b6:	7442                	ld	s0,48(sp)
    800009b8:	6121                	addi	sp,sp,64
    800009ba:	8082                	ret

00000000800009bc <printptr>:

static void
printptr(uint64 x)
{
    800009bc:	7179                	addi	sp,sp,-48
    800009be:	f406                	sd	ra,40(sp)
    800009c0:	f022                	sd	s0,32(sp)
    800009c2:	1800                	addi	s0,sp,48
    800009c4:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    800009c8:	03000513          	li	a0,48
    800009cc:	00000097          	auipc	ra,0x0
    800009d0:	9a6080e7          	jalr	-1626(ra) # 80000372 <consputc>
  consputc('x');
    800009d4:	07800513          	li	a0,120
    800009d8:	00000097          	auipc	ra,0x0
    800009dc:	99a080e7          	jalr	-1638(ra) # 80000372 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009e0:	fe042623          	sw	zero,-20(s0)
    800009e4:	a81d                	j	80000a1a <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009e6:	fd843783          	ld	a5,-40(s0)
    800009ea:	93f1                	srli	a5,a5,0x3c
    800009ec:	0000d717          	auipc	a4,0xd
    800009f0:	46470713          	addi	a4,a4,1124 # 8000de50 <digits>
    800009f4:	97ba                	add	a5,a5,a4
    800009f6:	0007c783          	lbu	a5,0(a5)
    800009fa:	2781                	sext.w	a5,a5
    800009fc:	853e                	mv	a0,a5
    800009fe:	00000097          	auipc	ra,0x0
    80000a02:	974080e7          	jalr	-1676(ra) # 80000372 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    80000a06:	fec42783          	lw	a5,-20(s0)
    80000a0a:	2785                	addiw	a5,a5,1
    80000a0c:	fef42623          	sw	a5,-20(s0)
    80000a10:	fd843783          	ld	a5,-40(s0)
    80000a14:	0792                	slli	a5,a5,0x4
    80000a16:	fcf43c23          	sd	a5,-40(s0)
    80000a1a:	fec42783          	lw	a5,-20(s0)
    80000a1e:	873e                	mv	a4,a5
    80000a20:	47bd                	li	a5,15
    80000a22:	fce7f2e3          	bgeu	a5,a4,800009e6 <printptr+0x2a>
}
    80000a26:	0001                	nop
    80000a28:	0001                	nop
    80000a2a:	70a2                	ld	ra,40(sp)
    80000a2c:	7402                	ld	s0,32(sp)
    80000a2e:	6145                	addi	sp,sp,48
    80000a30:	8082                	ret

0000000080000a32 <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    80000a32:	7119                	addi	sp,sp,-128
    80000a34:	fc06                	sd	ra,56(sp)
    80000a36:	f822                	sd	s0,48(sp)
    80000a38:	0080                	addi	s0,sp,64
    80000a3a:	fca43423          	sd	a0,-56(s0)
    80000a3e:	e40c                	sd	a1,8(s0)
    80000a40:	e810                	sd	a2,16(s0)
    80000a42:	ec14                	sd	a3,24(s0)
    80000a44:	f018                	sd	a4,32(s0)
    80000a46:	f41c                	sd	a5,40(s0)
    80000a48:	03043823          	sd	a6,48(s0)
    80000a4c:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a50:	00015797          	auipc	a5,0x15
    80000a54:	79878793          	addi	a5,a5,1944 # 800161e8 <pr>
    80000a58:	4f9c                	lw	a5,24(a5)
    80000a5a:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a5e:	fdc42783          	lw	a5,-36(s0)
    80000a62:	2781                	sext.w	a5,a5
    80000a64:	cb89                	beqz	a5,80000a76 <printf+0x44>
    acquire(&pr.lock);
    80000a66:	00015517          	auipc	a0,0x15
    80000a6a:	78250513          	addi	a0,a0,1922 # 800161e8 <pr>
    80000a6e:	00001097          	auipc	ra,0x1
    80000a72:	8c2080e7          	jalr	-1854(ra) # 80001330 <acquire>

  if (fmt == 0)
    80000a76:	fc843783          	ld	a5,-56(s0)
    80000a7a:	eb89                	bnez	a5,80000a8c <printf+0x5a>
    panic("null fmt");
    80000a7c:	0000a517          	auipc	a0,0xa
    80000a80:	58c50513          	addi	a0,a0,1420 # 8000b008 <etext+0x8>
    80000a84:	00000097          	auipc	ra,0x0
    80000a88:	204080e7          	jalr	516(ra) # 80000c88 <panic>

  va_start(ap, fmt);
    80000a8c:	04040793          	addi	a5,s0,64
    80000a90:	fcf43023          	sd	a5,-64(s0)
    80000a94:	fc043783          	ld	a5,-64(s0)
    80000a98:	fc878793          	addi	a5,a5,-56
    80000a9c:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000aa0:	fe042623          	sw	zero,-20(s0)
    80000aa4:	a24d                	j	80000c46 <printf+0x214>
    if(c != '%'){
    80000aa6:	fd842783          	lw	a5,-40(s0)
    80000aaa:	0007871b          	sext.w	a4,a5
    80000aae:	02500793          	li	a5,37
    80000ab2:	00f70a63          	beq	a4,a5,80000ac6 <printf+0x94>
      consputc(c);
    80000ab6:	fd842783          	lw	a5,-40(s0)
    80000aba:	853e                	mv	a0,a5
    80000abc:	00000097          	auipc	ra,0x0
    80000ac0:	8b6080e7          	jalr	-1866(ra) # 80000372 <consputc>
      continue;
    80000ac4:	aaa5                	j	80000c3c <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000ac6:	fec42783          	lw	a5,-20(s0)
    80000aca:	2785                	addiw	a5,a5,1
    80000acc:	fef42623          	sw	a5,-20(s0)
    80000ad0:	fec42783          	lw	a5,-20(s0)
    80000ad4:	fc843703          	ld	a4,-56(s0)
    80000ad8:	97ba                	add	a5,a5,a4
    80000ada:	0007c783          	lbu	a5,0(a5)
    80000ade:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000ae2:	fd842783          	lw	a5,-40(s0)
    80000ae6:	2781                	sext.w	a5,a5
    80000ae8:	16078e63          	beqz	a5,80000c64 <printf+0x232>
      break;
    switch(c){
    80000aec:	fd842783          	lw	a5,-40(s0)
    80000af0:	0007871b          	sext.w	a4,a5
    80000af4:	07800793          	li	a5,120
    80000af8:	08f70963          	beq	a4,a5,80000b8a <printf+0x158>
    80000afc:	fd842783          	lw	a5,-40(s0)
    80000b00:	0007871b          	sext.w	a4,a5
    80000b04:	07800793          	li	a5,120
    80000b08:	10e7cc63          	blt	a5,a4,80000c20 <printf+0x1ee>
    80000b0c:	fd842783          	lw	a5,-40(s0)
    80000b10:	0007871b          	sext.w	a4,a5
    80000b14:	07300793          	li	a5,115
    80000b18:	0af70563          	beq	a4,a5,80000bc2 <printf+0x190>
    80000b1c:	fd842783          	lw	a5,-40(s0)
    80000b20:	0007871b          	sext.w	a4,a5
    80000b24:	07300793          	li	a5,115
    80000b28:	0ee7cc63          	blt	a5,a4,80000c20 <printf+0x1ee>
    80000b2c:	fd842783          	lw	a5,-40(s0)
    80000b30:	0007871b          	sext.w	a4,a5
    80000b34:	07000793          	li	a5,112
    80000b38:	06f70863          	beq	a4,a5,80000ba8 <printf+0x176>
    80000b3c:	fd842783          	lw	a5,-40(s0)
    80000b40:	0007871b          	sext.w	a4,a5
    80000b44:	07000793          	li	a5,112
    80000b48:	0ce7cc63          	blt	a5,a4,80000c20 <printf+0x1ee>
    80000b4c:	fd842783          	lw	a5,-40(s0)
    80000b50:	0007871b          	sext.w	a4,a5
    80000b54:	02500793          	li	a5,37
    80000b58:	0af70d63          	beq	a4,a5,80000c12 <printf+0x1e0>
    80000b5c:	fd842783          	lw	a5,-40(s0)
    80000b60:	0007871b          	sext.w	a4,a5
    80000b64:	06400793          	li	a5,100
    80000b68:	0af71c63          	bne	a4,a5,80000c20 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b6c:	fd043783          	ld	a5,-48(s0)
    80000b70:	00878713          	addi	a4,a5,8
    80000b74:	fce43823          	sd	a4,-48(s0)
    80000b78:	439c                	lw	a5,0(a5)
    80000b7a:	4605                	li	a2,1
    80000b7c:	45a9                	li	a1,10
    80000b7e:	853e                	mv	a0,a5
    80000b80:	00000097          	auipc	ra,0x0
    80000b84:	d38080e7          	jalr	-712(ra) # 800008b8 <printint>
      break;
    80000b88:	a855                	j	80000c3c <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b8a:	fd043783          	ld	a5,-48(s0)
    80000b8e:	00878713          	addi	a4,a5,8
    80000b92:	fce43823          	sd	a4,-48(s0)
    80000b96:	439c                	lw	a5,0(a5)
    80000b98:	4605                	li	a2,1
    80000b9a:	45c1                	li	a1,16
    80000b9c:	853e                	mv	a0,a5
    80000b9e:	00000097          	auipc	ra,0x0
    80000ba2:	d1a080e7          	jalr	-742(ra) # 800008b8 <printint>
      break;
    80000ba6:	a859                	j	80000c3c <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000ba8:	fd043783          	ld	a5,-48(s0)
    80000bac:	00878713          	addi	a4,a5,8
    80000bb0:	fce43823          	sd	a4,-48(s0)
    80000bb4:	639c                	ld	a5,0(a5)
    80000bb6:	853e                	mv	a0,a5
    80000bb8:	00000097          	auipc	ra,0x0
    80000bbc:	e04080e7          	jalr	-508(ra) # 800009bc <printptr>
      break;
    80000bc0:	a8b5                	j	80000c3c <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000bc2:	fd043783          	ld	a5,-48(s0)
    80000bc6:	00878713          	addi	a4,a5,8
    80000bca:	fce43823          	sd	a4,-48(s0)
    80000bce:	639c                	ld	a5,0(a5)
    80000bd0:	fef43023          	sd	a5,-32(s0)
    80000bd4:	fe043783          	ld	a5,-32(s0)
    80000bd8:	e79d                	bnez	a5,80000c06 <printf+0x1d4>
        s = "(null)";
    80000bda:	0000a797          	auipc	a5,0xa
    80000bde:	43e78793          	addi	a5,a5,1086 # 8000b018 <etext+0x18>
    80000be2:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000be6:	a005                	j	80000c06 <printf+0x1d4>
        consputc(*s);
    80000be8:	fe043783          	ld	a5,-32(s0)
    80000bec:	0007c783          	lbu	a5,0(a5)
    80000bf0:	2781                	sext.w	a5,a5
    80000bf2:	853e                	mv	a0,a5
    80000bf4:	fffff097          	auipc	ra,0xfffff
    80000bf8:	77e080e7          	jalr	1918(ra) # 80000372 <consputc>
      for(; *s; s++)
    80000bfc:	fe043783          	ld	a5,-32(s0)
    80000c00:	0785                	addi	a5,a5,1
    80000c02:	fef43023          	sd	a5,-32(s0)
    80000c06:	fe043783          	ld	a5,-32(s0)
    80000c0a:	0007c783          	lbu	a5,0(a5)
    80000c0e:	ffe9                	bnez	a5,80000be8 <printf+0x1b6>
      break;
    80000c10:	a035                	j	80000c3c <printf+0x20a>
    case '%':
      consputc('%');
    80000c12:	02500513          	li	a0,37
    80000c16:	fffff097          	auipc	ra,0xfffff
    80000c1a:	75c080e7          	jalr	1884(ra) # 80000372 <consputc>
      break;
    80000c1e:	a839                	j	80000c3c <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000c20:	02500513          	li	a0,37
    80000c24:	fffff097          	auipc	ra,0xfffff
    80000c28:	74e080e7          	jalr	1870(ra) # 80000372 <consputc>
      consputc(c);
    80000c2c:	fd842783          	lw	a5,-40(s0)
    80000c30:	853e                	mv	a0,a5
    80000c32:	fffff097          	auipc	ra,0xfffff
    80000c36:	740080e7          	jalr	1856(ra) # 80000372 <consputc>
      break;
    80000c3a:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c3c:	fec42783          	lw	a5,-20(s0)
    80000c40:	2785                	addiw	a5,a5,1
    80000c42:	fef42623          	sw	a5,-20(s0)
    80000c46:	fec42783          	lw	a5,-20(s0)
    80000c4a:	fc843703          	ld	a4,-56(s0)
    80000c4e:	97ba                	add	a5,a5,a4
    80000c50:	0007c783          	lbu	a5,0(a5)
    80000c54:	fcf42c23          	sw	a5,-40(s0)
    80000c58:	fd842783          	lw	a5,-40(s0)
    80000c5c:	2781                	sext.w	a5,a5
    80000c5e:	e40794e3          	bnez	a5,80000aa6 <printf+0x74>
    80000c62:	a011                	j	80000c66 <printf+0x234>
      break;
    80000c64:	0001                	nop
    }
  }
  va_end(ap);

  if(locking)
    80000c66:	fdc42783          	lw	a5,-36(s0)
    80000c6a:	2781                	sext.w	a5,a5
    80000c6c:	cb89                	beqz	a5,80000c7e <printf+0x24c>
    release(&pr.lock);
    80000c6e:	00015517          	auipc	a0,0x15
    80000c72:	57a50513          	addi	a0,a0,1402 # 800161e8 <pr>
    80000c76:	00000097          	auipc	ra,0x0
    80000c7a:	71e080e7          	jalr	1822(ra) # 80001394 <release>
}
    80000c7e:	0001                	nop
    80000c80:	70e2                	ld	ra,56(sp)
    80000c82:	7442                	ld	s0,48(sp)
    80000c84:	6109                	addi	sp,sp,128
    80000c86:	8082                	ret

0000000080000c88 <panic>:

void
panic(char *s)
{
    80000c88:	1101                	addi	sp,sp,-32
    80000c8a:	ec06                	sd	ra,24(sp)
    80000c8c:	e822                	sd	s0,16(sp)
    80000c8e:	1000                	addi	s0,sp,32
    80000c90:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c94:	00015797          	auipc	a5,0x15
    80000c98:	55478793          	addi	a5,a5,1364 # 800161e8 <pr>
    80000c9c:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000ca0:	0000a517          	auipc	a0,0xa
    80000ca4:	38050513          	addi	a0,a0,896 # 8000b020 <etext+0x20>
    80000ca8:	00000097          	auipc	ra,0x0
    80000cac:	d8a080e7          	jalr	-630(ra) # 80000a32 <printf>
  printf(s);
    80000cb0:	fe843503          	ld	a0,-24(s0)
    80000cb4:	00000097          	auipc	ra,0x0
    80000cb8:	d7e080e7          	jalr	-642(ra) # 80000a32 <printf>
  printf("\n");
    80000cbc:	0000a517          	auipc	a0,0xa
    80000cc0:	36c50513          	addi	a0,a0,876 # 8000b028 <etext+0x28>
    80000cc4:	00000097          	auipc	ra,0x0
    80000cc8:	d6e080e7          	jalr	-658(ra) # 80000a32 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000ccc:	0000d797          	auipc	a5,0xd
    80000cd0:	30478793          	addi	a5,a5,772 # 8000dfd0 <panicked>
    80000cd4:	4705                	li	a4,1
    80000cd6:	c398                	sw	a4,0(a5)
  for(;;)
    80000cd8:	0001                	nop
    80000cda:	bffd                	j	80000cd8 <panic+0x50>

0000000080000cdc <panic_concat>:
    ;
}

void
panic_concat(int count, ...)
{
    80000cdc:	7119                	addi	sp,sp,-128
    80000cde:	fc06                	sd	ra,56(sp)
    80000ce0:	f822                	sd	s0,48(sp)
    80000ce2:	0080                	addi	s0,sp,64
    80000ce4:	e40c                	sd	a1,8(s0)
    80000ce6:	e810                	sd	a2,16(s0)
    80000ce8:	ec14                	sd	a3,24(s0)
    80000cea:	f018                	sd	a4,32(s0)
    80000cec:	f41c                	sd	a5,40(s0)
    80000cee:	03043823          	sd	a6,48(s0)
    80000cf2:	03143c23          	sd	a7,56(s0)
    80000cf6:	87aa                	mv	a5,a0
    80000cf8:	fcf42623          	sw	a5,-52(s0)
  pr.locking = 0;
    80000cfc:	00015797          	auipc	a5,0x15
    80000d00:	4ec78793          	addi	a5,a5,1260 # 800161e8 <pr>
    80000d04:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000d08:	0000a517          	auipc	a0,0xa
    80000d0c:	31850513          	addi	a0,a0,792 # 8000b020 <etext+0x20>
    80000d10:	00000097          	auipc	ra,0x0
    80000d14:	d22080e7          	jalr	-734(ra) # 80000a32 <printf>
  va_list ap;
  va_start(ap, count);
    80000d18:	04040793          	addi	a5,s0,64
    80000d1c:	fcf43023          	sd	a5,-64(s0)
    80000d20:	fc043783          	ld	a5,-64(s0)
    80000d24:	fc878793          	addi	a5,a5,-56
    80000d28:	fcf43c23          	sd	a5,-40(s0)
  for(int i = 0; i < count; i++){
    80000d2c:	fe042623          	sw	zero,-20(s0)
    80000d30:	a02d                	j	80000d5a <panic_concat+0x7e>
    char *s = va_arg(ap, char*);
    80000d32:	fd843783          	ld	a5,-40(s0)
    80000d36:	00878713          	addi	a4,a5,8
    80000d3a:	fce43c23          	sd	a4,-40(s0)
    80000d3e:	639c                	ld	a5,0(a5)
    80000d40:	fef43023          	sd	a5,-32(s0)
    printf(s);
    80000d44:	fe043503          	ld	a0,-32(s0)
    80000d48:	00000097          	auipc	ra,0x0
    80000d4c:	cea080e7          	jalr	-790(ra) # 80000a32 <printf>
  for(int i = 0; i < count; i++){
    80000d50:	fec42783          	lw	a5,-20(s0)
    80000d54:	2785                	addiw	a5,a5,1
    80000d56:	fef42623          	sw	a5,-20(s0)
    80000d5a:	fec42783          	lw	a5,-20(s0)
    80000d5e:	873e                	mv	a4,a5
    80000d60:	fcc42783          	lw	a5,-52(s0)
    80000d64:	2701                	sext.w	a4,a4
    80000d66:	2781                	sext.w	a5,a5
    80000d68:	fcf745e3          	blt	a4,a5,80000d32 <panic_concat+0x56>
  }
  va_end(ap);
  printf("\n");
    80000d6c:	0000a517          	auipc	a0,0xa
    80000d70:	2bc50513          	addi	a0,a0,700 # 8000b028 <etext+0x28>
    80000d74:	00000097          	auipc	ra,0x0
    80000d78:	cbe080e7          	jalr	-834(ra) # 80000a32 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000d7c:	0000d797          	auipc	a5,0xd
    80000d80:	25478793          	addi	a5,a5,596 # 8000dfd0 <panicked>
    80000d84:	4705                	li	a4,1
    80000d86:	c398                	sw	a4,0(a5)
  for(;;)
    80000d88:	0001                	nop
    80000d8a:	bffd                	j	80000d88 <panic_concat+0xac>

0000000080000d8c <printfinit>:
    ;
}

void
printfinit(void)
{
    80000d8c:	1141                	addi	sp,sp,-16
    80000d8e:	e406                	sd	ra,8(sp)
    80000d90:	e022                	sd	s0,0(sp)
    80000d92:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000d94:	0000a597          	auipc	a1,0xa
    80000d98:	29c58593          	addi	a1,a1,668 # 8000b030 <etext+0x30>
    80000d9c:	00015517          	auipc	a0,0x15
    80000da0:	44c50513          	addi	a0,a0,1100 # 800161e8 <pr>
    80000da4:	00000097          	auipc	ra,0x0
    80000da8:	55c080e7          	jalr	1372(ra) # 80001300 <initlock>
  pr.locking = 1;
    80000dac:	00015797          	auipc	a5,0x15
    80000db0:	43c78793          	addi	a5,a5,1084 # 800161e8 <pr>
    80000db4:	4705                	li	a4,1
    80000db6:	cf98                	sw	a4,24(a5)
}
    80000db8:	0001                	nop
    80000dba:	60a2                	ld	ra,8(sp)
    80000dbc:	6402                	ld	s0,0(sp)
    80000dbe:	0141                	addi	sp,sp,16
    80000dc0:	8082                	ret

0000000080000dc2 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000dc2:	1141                	addi	sp,sp,-16
    80000dc4:	e406                	sd	ra,8(sp)
    80000dc6:	e022                	sd	s0,0(sp)
    80000dc8:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000dca:	100007b7          	lui	a5,0x10000
    80000dce:	0785                	addi	a5,a5,1 # 10000001 <_entry-0x6fffffff>
    80000dd0:	00078023          	sb	zero,0(a5)

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000dd4:	100007b7          	lui	a5,0x10000
    80000dd8:	078d                	addi	a5,a5,3 # 10000003 <_entry-0x6ffffffd>
    80000dda:	f8000713          	li	a4,-128
    80000dde:	00e78023          	sb	a4,0(a5)

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000de2:	100007b7          	lui	a5,0x10000
    80000de6:	470d                	li	a4,3
    80000de8:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000dec:	100007b7          	lui	a5,0x10000
    80000df0:	0785                	addi	a5,a5,1 # 10000001 <_entry-0x6fffffff>
    80000df2:	00078023          	sb	zero,0(a5)

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000df6:	100007b7          	lui	a5,0x10000
    80000dfa:	078d                	addi	a5,a5,3 # 10000003 <_entry-0x6ffffffd>
    80000dfc:	470d                	li	a4,3
    80000dfe:	00e78023          	sb	a4,0(a5)

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000e02:	100007b7          	lui	a5,0x10000
    80000e06:	0789                	addi	a5,a5,2 # 10000002 <_entry-0x6ffffffe>
    80000e08:	471d                	li	a4,7
    80000e0a:	00e78023          	sb	a4,0(a5)

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000e0e:	100007b7          	lui	a5,0x10000
    80000e12:	0785                	addi	a5,a5,1 # 10000001 <_entry-0x6fffffff>
    80000e14:	470d                	li	a4,3
    80000e16:	00e78023          	sb	a4,0(a5)

  initlock(&uart_tx_lock, "uart");
    80000e1a:	0000a597          	auipc	a1,0xa
    80000e1e:	21e58593          	addi	a1,a1,542 # 8000b038 <etext+0x38>
    80000e22:	00015517          	auipc	a0,0x15
    80000e26:	3e650513          	addi	a0,a0,998 # 80016208 <uart_tx_lock>
    80000e2a:	00000097          	auipc	ra,0x0
    80000e2e:	4d6080e7          	jalr	1238(ra) # 80001300 <initlock>
}
    80000e32:	0001                	nop
    80000e34:	60a2                	ld	ra,8(sp)
    80000e36:	6402                	ld	s0,0(sp)
    80000e38:	0141                	addi	sp,sp,16
    80000e3a:	8082                	ret

0000000080000e3c <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000e3c:	1101                	addi	sp,sp,-32
    80000e3e:	ec06                	sd	ra,24(sp)
    80000e40:	e822                	sd	s0,16(sp)
    80000e42:	1000                	addi	s0,sp,32
    80000e44:	87aa                	mv	a5,a0
    80000e46:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000e4a:	00015517          	auipc	a0,0x15
    80000e4e:	3be50513          	addi	a0,a0,958 # 80016208 <uart_tx_lock>
    80000e52:	00000097          	auipc	ra,0x0
    80000e56:	4de080e7          	jalr	1246(ra) # 80001330 <acquire>

  if(panicked){
    80000e5a:	0000d797          	auipc	a5,0xd
    80000e5e:	17678793          	addi	a5,a5,374 # 8000dfd0 <panicked>
    80000e62:	439c                	lw	a5,0(a5)
    80000e64:	2781                	sext.w	a5,a5
    80000e66:	cf99                	beqz	a5,80000e84 <uartputc+0x48>
    for(;;)
    80000e68:	0001                	nop
    80000e6a:	bffd                	j	80000e68 <uartputc+0x2c>
      ;
  }
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    // buffer is full.
    // wait for uartstart() to open up space in the buffer.
    sleep(&uart_tx_r, &uart_tx_lock);
    80000e6c:	00015597          	auipc	a1,0x15
    80000e70:	39c58593          	addi	a1,a1,924 # 80016208 <uart_tx_lock>
    80000e74:	0000d517          	auipc	a0,0xd
    80000e78:	16c50513          	addi	a0,a0,364 # 8000dfe0 <uart_tx_r>
    80000e7c:	00003097          	auipc	ra,0x3
    80000e80:	844080e7          	jalr	-1980(ra) # 800036c0 <sleep>
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000e84:	0000d797          	auipc	a5,0xd
    80000e88:	15c78793          	addi	a5,a5,348 # 8000dfe0 <uart_tx_r>
    80000e8c:	639c                	ld	a5,0(a5)
    80000e8e:	02078713          	addi	a4,a5,32
    80000e92:	0000d797          	auipc	a5,0xd
    80000e96:	14678793          	addi	a5,a5,326 # 8000dfd8 <uart_tx_w>
    80000e9a:	639c                	ld	a5,0(a5)
    80000e9c:	fcf708e3          	beq	a4,a5,80000e6c <uartputc+0x30>
  }
  uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000ea0:	0000d797          	auipc	a5,0xd
    80000ea4:	13878793          	addi	a5,a5,312 # 8000dfd8 <uart_tx_w>
    80000ea8:	639c                	ld	a5,0(a5)
    80000eaa:	8bfd                	andi	a5,a5,31
    80000eac:	fec42703          	lw	a4,-20(s0)
    80000eb0:	0ff77713          	zext.b	a4,a4
    80000eb4:	00015697          	auipc	a3,0x15
    80000eb8:	36c68693          	addi	a3,a3,876 # 80016220 <uart_tx_buf>
    80000ebc:	97b6                	add	a5,a5,a3
    80000ebe:	00e78023          	sb	a4,0(a5)
  uart_tx_w += 1;
    80000ec2:	0000d797          	auipc	a5,0xd
    80000ec6:	11678793          	addi	a5,a5,278 # 8000dfd8 <uart_tx_w>
    80000eca:	639c                	ld	a5,0(a5)
    80000ecc:	00178713          	addi	a4,a5,1
    80000ed0:	0000d797          	auipc	a5,0xd
    80000ed4:	10878793          	addi	a5,a5,264 # 8000dfd8 <uart_tx_w>
    80000ed8:	e398                	sd	a4,0(a5)
  uartstart();
    80000eda:	00000097          	auipc	ra,0x0
    80000ede:	086080e7          	jalr	134(ra) # 80000f60 <uartstart>
  release(&uart_tx_lock);
    80000ee2:	00015517          	auipc	a0,0x15
    80000ee6:	32650513          	addi	a0,a0,806 # 80016208 <uart_tx_lock>
    80000eea:	00000097          	auipc	ra,0x0
    80000eee:	4aa080e7          	jalr	1194(ra) # 80001394 <release>
}
    80000ef2:	0001                	nop
    80000ef4:	60e2                	ld	ra,24(sp)
    80000ef6:	6442                	ld	s0,16(sp)
    80000ef8:	6105                	addi	sp,sp,32
    80000efa:	8082                	ret

0000000080000efc <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000efc:	1101                	addi	sp,sp,-32
    80000efe:	ec06                	sd	ra,24(sp)
    80000f00:	e822                	sd	s0,16(sp)
    80000f02:	1000                	addi	s0,sp,32
    80000f04:	87aa                	mv	a5,a0
    80000f06:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000f0a:	00000097          	auipc	ra,0x0
    80000f0e:	524080e7          	jalr	1316(ra) # 8000142e <push_off>

  if(panicked){
    80000f12:	0000d797          	auipc	a5,0xd
    80000f16:	0be78793          	addi	a5,a5,190 # 8000dfd0 <panicked>
    80000f1a:	439c                	lw	a5,0(a5)
    80000f1c:	2781                	sext.w	a5,a5
    80000f1e:	c399                	beqz	a5,80000f24 <uartputc_sync+0x28>
    for(;;)
    80000f20:	0001                	nop
    80000f22:	bffd                	j	80000f20 <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000f24:	0001                	nop
    80000f26:	100007b7          	lui	a5,0x10000
    80000f2a:	0795                	addi	a5,a5,5 # 10000005 <_entry-0x6ffffffb>
    80000f2c:	0007c783          	lbu	a5,0(a5)
    80000f30:	0ff7f793          	zext.b	a5,a5
    80000f34:	2781                	sext.w	a5,a5
    80000f36:	0207f793          	andi	a5,a5,32
    80000f3a:	2781                	sext.w	a5,a5
    80000f3c:	d7ed                	beqz	a5,80000f26 <uartputc_sync+0x2a>
    ;
  WriteReg(THR, c);
    80000f3e:	100007b7          	lui	a5,0x10000
    80000f42:	fec42703          	lw	a4,-20(s0)
    80000f46:	0ff77713          	zext.b	a4,a4
    80000f4a:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000f4e:	00000097          	auipc	ra,0x0
    80000f52:	538080e7          	jalr	1336(ra) # 80001486 <pop_off>
}
    80000f56:	0001                	nop
    80000f58:	60e2                	ld	ra,24(sp)
    80000f5a:	6442                	ld	s0,16(sp)
    80000f5c:	6105                	addi	sp,sp,32
    80000f5e:	8082                	ret

0000000080000f60 <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000f60:	1101                	addi	sp,sp,-32
    80000f62:	ec06                	sd	ra,24(sp)
    80000f64:	e822                	sd	s0,16(sp)
    80000f66:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000f68:	0000d797          	auipc	a5,0xd
    80000f6c:	07078793          	addi	a5,a5,112 # 8000dfd8 <uart_tx_w>
    80000f70:	6398                	ld	a4,0(a5)
    80000f72:	0000d797          	auipc	a5,0xd
    80000f76:	06e78793          	addi	a5,a5,110 # 8000dfe0 <uart_tx_r>
    80000f7a:	639c                	ld	a5,0(a5)
    80000f7c:	06f70a63          	beq	a4,a5,80000ff0 <uartstart+0x90>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000f80:	100007b7          	lui	a5,0x10000
    80000f84:	0795                	addi	a5,a5,5 # 10000005 <_entry-0x6ffffffb>
    80000f86:	0007c783          	lbu	a5,0(a5)
    80000f8a:	0ff7f793          	zext.b	a5,a5
    80000f8e:	2781                	sext.w	a5,a5
    80000f90:	0207f793          	andi	a5,a5,32
    80000f94:	2781                	sext.w	a5,a5
    80000f96:	cfb9                	beqz	a5,80000ff4 <uartstart+0x94>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    80000f98:	0000d797          	auipc	a5,0xd
    80000f9c:	04878793          	addi	a5,a5,72 # 8000dfe0 <uart_tx_r>
    80000fa0:	639c                	ld	a5,0(a5)
    80000fa2:	8bfd                	andi	a5,a5,31
    80000fa4:	00015717          	auipc	a4,0x15
    80000fa8:	27c70713          	addi	a4,a4,636 # 80016220 <uart_tx_buf>
    80000fac:	97ba                	add	a5,a5,a4
    80000fae:	0007c783          	lbu	a5,0(a5)
    80000fb2:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000fb6:	0000d797          	auipc	a5,0xd
    80000fba:	02a78793          	addi	a5,a5,42 # 8000dfe0 <uart_tx_r>
    80000fbe:	639c                	ld	a5,0(a5)
    80000fc0:	00178713          	addi	a4,a5,1
    80000fc4:	0000d797          	auipc	a5,0xd
    80000fc8:	01c78793          	addi	a5,a5,28 # 8000dfe0 <uart_tx_r>
    80000fcc:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000fce:	0000d517          	auipc	a0,0xd
    80000fd2:	01250513          	addi	a0,a0,18 # 8000dfe0 <uart_tx_r>
    80000fd6:	00002097          	auipc	ra,0x2
    80000fda:	766080e7          	jalr	1894(ra) # 8000373c <wakeup>
    
    WriteReg(THR, c);
    80000fde:	100007b7          	lui	a5,0x10000
    80000fe2:	fec42703          	lw	a4,-20(s0)
    80000fe6:	0ff77713          	zext.b	a4,a4
    80000fea:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000fee:	bfad                	j	80000f68 <uartstart+0x8>
      return;
    80000ff0:	0001                	nop
    80000ff2:	a011                	j	80000ff6 <uartstart+0x96>
      return;
    80000ff4:	0001                	nop
  }
}
    80000ff6:	60e2                	ld	ra,24(sp)
    80000ff8:	6442                	ld	s0,16(sp)
    80000ffa:	6105                	addi	sp,sp,32
    80000ffc:	8082                	ret

0000000080000ffe <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000ffe:	1141                	addi	sp,sp,-16
    80001000:	e422                	sd	s0,8(sp)
    80001002:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80001004:	100007b7          	lui	a5,0x10000
    80001008:	0795                	addi	a5,a5,5 # 10000005 <_entry-0x6ffffffb>
    8000100a:	0007c783          	lbu	a5,0(a5)
    8000100e:	0ff7f793          	zext.b	a5,a5
    80001012:	2781                	sext.w	a5,a5
    80001014:	8b85                	andi	a5,a5,1
    80001016:	2781                	sext.w	a5,a5
    80001018:	cb89                	beqz	a5,8000102a <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    8000101a:	100007b7          	lui	a5,0x10000
    8000101e:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80001022:	0ff7f793          	zext.b	a5,a5
    80001026:	2781                	sext.w	a5,a5
    80001028:	a011                	j	8000102c <uartgetc+0x2e>
  } else {
    return -1;
    8000102a:	57fd                	li	a5,-1
  }
}
    8000102c:	853e                	mv	a0,a5
    8000102e:	6422                	ld	s0,8(sp)
    80001030:	0141                	addi	sp,sp,16
    80001032:	8082                	ret

0000000080001034 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from devintr().
void
uartintr(void)
{
    80001034:	1101                	addi	sp,sp,-32
    80001036:	ec06                	sd	ra,24(sp)
    80001038:	e822                	sd	s0,16(sp)
    8000103a:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    8000103c:	00000097          	auipc	ra,0x0
    80001040:	fc2080e7          	jalr	-62(ra) # 80000ffe <uartgetc>
    80001044:	87aa                	mv	a5,a0
    80001046:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    8000104a:	fec42783          	lw	a5,-20(s0)
    8000104e:	0007871b          	sext.w	a4,a5
    80001052:	57fd                	li	a5,-1
    80001054:	00f70a63          	beq	a4,a5,80001068 <uartintr+0x34>
      break;
    consoleintr(c);
    80001058:	fec42783          	lw	a5,-20(s0)
    8000105c:	853e                	mv	a0,a5
    8000105e:	fffff097          	auipc	ra,0xfffff
    80001062:	596080e7          	jalr	1430(ra) # 800005f4 <consoleintr>
  while(1){
    80001066:	bfd9                	j	8000103c <uartintr+0x8>
      break;
    80001068:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    8000106a:	00015517          	auipc	a0,0x15
    8000106e:	19e50513          	addi	a0,a0,414 # 80016208 <uart_tx_lock>
    80001072:	00000097          	auipc	ra,0x0
    80001076:	2be080e7          	jalr	702(ra) # 80001330 <acquire>
  uartstart();
    8000107a:	00000097          	auipc	ra,0x0
    8000107e:	ee6080e7          	jalr	-282(ra) # 80000f60 <uartstart>
  release(&uart_tx_lock);
    80001082:	00015517          	auipc	a0,0x15
    80001086:	18650513          	addi	a0,a0,390 # 80016208 <uart_tx_lock>
    8000108a:	00000097          	auipc	ra,0x0
    8000108e:	30a080e7          	jalr	778(ra) # 80001394 <release>
}
    80001092:	0001                	nop
    80001094:	60e2                	ld	ra,24(sp)
    80001096:	6442                	ld	s0,16(sp)
    80001098:	6105                	addi	sp,sp,32
    8000109a:	8082                	ret

000000008000109c <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    8000109c:	1141                	addi	sp,sp,-16
    8000109e:	e406                	sd	ra,8(sp)
    800010a0:	e022                	sd	s0,0(sp)
    800010a2:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    800010a4:	0000a597          	auipc	a1,0xa
    800010a8:	f9c58593          	addi	a1,a1,-100 # 8000b040 <etext+0x40>
    800010ac:	00015517          	auipc	a0,0x15
    800010b0:	19450513          	addi	a0,a0,404 # 80016240 <kmem>
    800010b4:	00000097          	auipc	ra,0x0
    800010b8:	24c080e7          	jalr	588(ra) # 80001300 <initlock>
  freerange(end, (void*)PHYSTOP);
    800010bc:	08100793          	li	a5,129
    800010c0:	01879593          	slli	a1,a5,0x18
    800010c4:	00027517          	auipc	a0,0x27
    800010c8:	97c50513          	addi	a0,a0,-1668 # 80027a40 <end>
    800010cc:	00000097          	auipc	ra,0x0
    800010d0:	012080e7          	jalr	18(ra) # 800010de <freerange>
}
    800010d4:	0001                	nop
    800010d6:	60a2                	ld	ra,8(sp)
    800010d8:	6402                	ld	s0,0(sp)
    800010da:	0141                	addi	sp,sp,16
    800010dc:	8082                	ret

00000000800010de <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    800010de:	7179                	addi	sp,sp,-48
    800010e0:	f406                	sd	ra,40(sp)
    800010e2:	f022                	sd	s0,32(sp)
    800010e4:	1800                	addi	s0,sp,48
    800010e6:	fca43c23          	sd	a0,-40(s0)
    800010ea:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    800010ee:	fd843703          	ld	a4,-40(s0)
    800010f2:	6785                	lui	a5,0x1
    800010f4:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800010f6:	973e                	add	a4,a4,a5
    800010f8:	77fd                	lui	a5,0xfffff
    800010fa:	8ff9                	and	a5,a5,a4
    800010fc:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001100:	a829                	j	8000111a <freerange+0x3c>
    kfree(p);
    80001102:	fe843503          	ld	a0,-24(s0)
    80001106:	00000097          	auipc	ra,0x0
    8000110a:	030080e7          	jalr	48(ra) # 80001136 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    8000110e:	fe843703          	ld	a4,-24(s0)
    80001112:	6785                	lui	a5,0x1
    80001114:	97ba                	add	a5,a5,a4
    80001116:	fef43423          	sd	a5,-24(s0)
    8000111a:	fe843703          	ld	a4,-24(s0)
    8000111e:	6785                	lui	a5,0x1
    80001120:	97ba                	add	a5,a5,a4
    80001122:	fd043703          	ld	a4,-48(s0)
    80001126:	fcf77ee3          	bgeu	a4,a5,80001102 <freerange+0x24>
}
    8000112a:	0001                	nop
    8000112c:	0001                	nop
    8000112e:	70a2                	ld	ra,40(sp)
    80001130:	7402                	ld	s0,32(sp)
    80001132:	6145                	addi	sp,sp,48
    80001134:	8082                	ret

0000000080001136 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001136:	7179                	addi	sp,sp,-48
    80001138:	f406                	sd	ra,40(sp)
    8000113a:	f022                	sd	s0,32(sp)
    8000113c:	1800                	addi	s0,sp,48
    8000113e:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    80001142:	fd843703          	ld	a4,-40(s0)
    80001146:	6785                	lui	a5,0x1
    80001148:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000114a:	8ff9                	and	a5,a5,a4
    8000114c:	e385                	bnez	a5,8000116c <kfree+0x36>
    8000114e:	fd843703          	ld	a4,-40(s0)
    80001152:	00027797          	auipc	a5,0x27
    80001156:	8ee78793          	addi	a5,a5,-1810 # 80027a40 <end>
    8000115a:	00f76963          	bltu	a4,a5,8000116c <kfree+0x36>
    8000115e:	fd843703          	ld	a4,-40(s0)
    80001162:	08100793          	li	a5,129
    80001166:	07e2                	slli	a5,a5,0x18
    80001168:	00f76a63          	bltu	a4,a5,8000117c <kfree+0x46>
    panic("kfree");
    8000116c:	0000a517          	auipc	a0,0xa
    80001170:	edc50513          	addi	a0,a0,-292 # 8000b048 <etext+0x48>
    80001174:	00000097          	auipc	ra,0x0
    80001178:	b14080e7          	jalr	-1260(ra) # 80000c88 <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    8000117c:	6605                	lui	a2,0x1
    8000117e:	4585                	li	a1,1
    80001180:	fd843503          	ld	a0,-40(s0)
    80001184:	00000097          	auipc	ra,0x0
    80001188:	380080e7          	jalr	896(ra) # 80001504 <memset>

  r = (struct run*)pa;
    8000118c:	fd843783          	ld	a5,-40(s0)
    80001190:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    80001194:	00015517          	auipc	a0,0x15
    80001198:	0ac50513          	addi	a0,a0,172 # 80016240 <kmem>
    8000119c:	00000097          	auipc	ra,0x0
    800011a0:	194080e7          	jalr	404(ra) # 80001330 <acquire>
  r->next = kmem.freelist;
    800011a4:	00015797          	auipc	a5,0x15
    800011a8:	09c78793          	addi	a5,a5,156 # 80016240 <kmem>
    800011ac:	6f98                	ld	a4,24(a5)
    800011ae:	fe843783          	ld	a5,-24(s0)
    800011b2:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800011b4:	00015797          	auipc	a5,0x15
    800011b8:	08c78793          	addi	a5,a5,140 # 80016240 <kmem>
    800011bc:	fe843703          	ld	a4,-24(s0)
    800011c0:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    800011c2:	00015517          	auipc	a0,0x15
    800011c6:	07e50513          	addi	a0,a0,126 # 80016240 <kmem>
    800011ca:	00000097          	auipc	ra,0x0
    800011ce:	1ca080e7          	jalr	458(ra) # 80001394 <release>
}
    800011d2:	0001                	nop
    800011d4:	70a2                	ld	ra,40(sp)
    800011d6:	7402                	ld	s0,32(sp)
    800011d8:	6145                	addi	sp,sp,48
    800011da:	8082                	ret

00000000800011dc <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    800011dc:	1101                	addi	sp,sp,-32
    800011de:	ec06                	sd	ra,24(sp)
    800011e0:	e822                	sd	s0,16(sp)
    800011e2:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    800011e4:	00015517          	auipc	a0,0x15
    800011e8:	05c50513          	addi	a0,a0,92 # 80016240 <kmem>
    800011ec:	00000097          	auipc	ra,0x0
    800011f0:	144080e7          	jalr	324(ra) # 80001330 <acquire>
  r = kmem.freelist;
    800011f4:	00015797          	auipc	a5,0x15
    800011f8:	04c78793          	addi	a5,a5,76 # 80016240 <kmem>
    800011fc:	6f9c                	ld	a5,24(a5)
    800011fe:	fef43423          	sd	a5,-24(s0)
  if(r)
    80001202:	fe843783          	ld	a5,-24(s0)
    80001206:	cb89                	beqz	a5,80001218 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001208:	fe843783          	ld	a5,-24(s0)
    8000120c:	6398                	ld	a4,0(a5)
    8000120e:	00015797          	auipc	a5,0x15
    80001212:	03278793          	addi	a5,a5,50 # 80016240 <kmem>
    80001216:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001218:	00015517          	auipc	a0,0x15
    8000121c:	02850513          	addi	a0,a0,40 # 80016240 <kmem>
    80001220:	00000097          	auipc	ra,0x0
    80001224:	174080e7          	jalr	372(ra) # 80001394 <release>

  if(r)
    80001228:	fe843783          	ld	a5,-24(s0)
    8000122c:	cb89                	beqz	a5,8000123e <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000122e:	6605                	lui	a2,0x1
    80001230:	4595                	li	a1,5
    80001232:	fe843503          	ld	a0,-24(s0)
    80001236:	00000097          	auipc	ra,0x0
    8000123a:	2ce080e7          	jalr	718(ra) # 80001504 <memset>
  return (void*)r;
    8000123e:	fe843783          	ld	a5,-24(s0)
}
    80001242:	853e                	mv	a0,a5
    80001244:	60e2                	ld	ra,24(sp)
    80001246:	6442                	ld	s0,16(sp)
    80001248:	6105                	addi	sp,sp,32
    8000124a:	8082                	ret

000000008000124c <r_sstatus>:
{
    8000124c:	1101                	addi	sp,sp,-32
    8000124e:	ec22                	sd	s0,24(sp)
    80001250:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80001252:	100027f3          	csrr	a5,sstatus
    80001256:	fef43423          	sd	a5,-24(s0)
  return x;
    8000125a:	fe843783          	ld	a5,-24(s0)
}
    8000125e:	853e                	mv	a0,a5
    80001260:	6462                	ld	s0,24(sp)
    80001262:	6105                	addi	sp,sp,32
    80001264:	8082                	ret

0000000080001266 <w_sstatus>:
{
    80001266:	1101                	addi	sp,sp,-32
    80001268:	ec22                	sd	s0,24(sp)
    8000126a:	1000                	addi	s0,sp,32
    8000126c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80001270:	fe843783          	ld	a5,-24(s0)
    80001274:	10079073          	csrw	sstatus,a5
}
    80001278:	0001                	nop
    8000127a:	6462                	ld	s0,24(sp)
    8000127c:	6105                	addi	sp,sp,32
    8000127e:	8082                	ret

0000000080001280 <intr_on>:
{
    80001280:	1141                	addi	sp,sp,-16
    80001282:	e406                	sd	ra,8(sp)
    80001284:	e022                	sd	s0,0(sp)
    80001286:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80001288:	00000097          	auipc	ra,0x0
    8000128c:	fc4080e7          	jalr	-60(ra) # 8000124c <r_sstatus>
    80001290:	87aa                	mv	a5,a0
    80001292:	0027e793          	ori	a5,a5,2
    80001296:	853e                	mv	a0,a5
    80001298:	00000097          	auipc	ra,0x0
    8000129c:	fce080e7          	jalr	-50(ra) # 80001266 <w_sstatus>
}
    800012a0:	0001                	nop
    800012a2:	60a2                	ld	ra,8(sp)
    800012a4:	6402                	ld	s0,0(sp)
    800012a6:	0141                	addi	sp,sp,16
    800012a8:	8082                	ret

00000000800012aa <intr_off>:
{
    800012aa:	1141                	addi	sp,sp,-16
    800012ac:	e406                	sd	ra,8(sp)
    800012ae:	e022                	sd	s0,0(sp)
    800012b0:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800012b2:	00000097          	auipc	ra,0x0
    800012b6:	f9a080e7          	jalr	-102(ra) # 8000124c <r_sstatus>
    800012ba:	87aa                	mv	a5,a0
    800012bc:	9bf5                	andi	a5,a5,-3
    800012be:	853e                	mv	a0,a5
    800012c0:	00000097          	auipc	ra,0x0
    800012c4:	fa6080e7          	jalr	-90(ra) # 80001266 <w_sstatus>
}
    800012c8:	0001                	nop
    800012ca:	60a2                	ld	ra,8(sp)
    800012cc:	6402                	ld	s0,0(sp)
    800012ce:	0141                	addi	sp,sp,16
    800012d0:	8082                	ret

00000000800012d2 <intr_get>:
{
    800012d2:	1101                	addi	sp,sp,-32
    800012d4:	ec06                	sd	ra,24(sp)
    800012d6:	e822                	sd	s0,16(sp)
    800012d8:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800012da:	00000097          	auipc	ra,0x0
    800012de:	f72080e7          	jalr	-142(ra) # 8000124c <r_sstatus>
    800012e2:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800012e6:	fe843783          	ld	a5,-24(s0)
    800012ea:	8b89                	andi	a5,a5,2
    800012ec:	00f037b3          	snez	a5,a5
    800012f0:	0ff7f793          	zext.b	a5,a5
    800012f4:	2781                	sext.w	a5,a5
}
    800012f6:	853e                	mv	a0,a5
    800012f8:	60e2                	ld	ra,24(sp)
    800012fa:	6442                	ld	s0,16(sp)
    800012fc:	6105                	addi	sp,sp,32
    800012fe:	8082                	ret

0000000080001300 <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    80001300:	1101                	addi	sp,sp,-32
    80001302:	ec22                	sd	s0,24(sp)
    80001304:	1000                	addi	s0,sp,32
    80001306:	fea43423          	sd	a0,-24(s0)
    8000130a:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    8000130e:	fe843783          	ld	a5,-24(s0)
    80001312:	fe043703          	ld	a4,-32(s0)
    80001316:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001318:	fe843783          	ld	a5,-24(s0)
    8000131c:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    80001320:	fe843783          	ld	a5,-24(s0)
    80001324:	0007b823          	sd	zero,16(a5)
}
    80001328:	0001                	nop
    8000132a:	6462                	ld	s0,24(sp)
    8000132c:	6105                	addi	sp,sp,32
    8000132e:	8082                	ret

0000000080001330 <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    80001330:	1101                	addi	sp,sp,-32
    80001332:	ec06                	sd	ra,24(sp)
    80001334:	e822                	sd	s0,16(sp)
    80001336:	1000                	addi	s0,sp,32
    80001338:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    8000133c:	00000097          	auipc	ra,0x0
    80001340:	0f2080e7          	jalr	242(ra) # 8000142e <push_off>
  if(holding(lk))
    80001344:	fe843503          	ld	a0,-24(s0)
    80001348:	00000097          	auipc	ra,0x0
    8000134c:	0a2080e7          	jalr	162(ra) # 800013ea <holding>
    80001350:	87aa                	mv	a5,a0
    80001352:	cb89                	beqz	a5,80001364 <acquire+0x34>
    panic("acquire");
    80001354:	0000a517          	auipc	a0,0xa
    80001358:	cfc50513          	addi	a0,a0,-772 # 8000b050 <etext+0x50>
    8000135c:	00000097          	auipc	ra,0x0
    80001360:	92c080e7          	jalr	-1748(ra) # 80000c88 <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    80001364:	0001                	nop
    80001366:	fe843783          	ld	a5,-24(s0)
    8000136a:	4705                	li	a4,1
    8000136c:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    80001370:	0007079b          	sext.w	a5,a4
    80001374:	fbed                	bnez	a5,80001366 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001376:	0330000f          	fence	rw,rw

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    8000137a:	00001097          	auipc	ra,0x1
    8000137e:	74a080e7          	jalr	1866(ra) # 80002ac4 <mycpu>
    80001382:	872a                	mv	a4,a0
    80001384:	fe843783          	ld	a5,-24(s0)
    80001388:	eb98                	sd	a4,16(a5)
}
    8000138a:	0001                	nop
    8000138c:	60e2                	ld	ra,24(sp)
    8000138e:	6442                	ld	s0,16(sp)
    80001390:	6105                	addi	sp,sp,32
    80001392:	8082                	ret

0000000080001394 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    80001394:	1101                	addi	sp,sp,-32
    80001396:	ec06                	sd	ra,24(sp)
    80001398:	e822                	sd	s0,16(sp)
    8000139a:	1000                	addi	s0,sp,32
    8000139c:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800013a0:	fe843503          	ld	a0,-24(s0)
    800013a4:	00000097          	auipc	ra,0x0
    800013a8:	046080e7          	jalr	70(ra) # 800013ea <holding>
    800013ac:	87aa                	mv	a5,a0
    800013ae:	eb89                	bnez	a5,800013c0 <release+0x2c>
    panic("release");
    800013b0:	0000a517          	auipc	a0,0xa
    800013b4:	ca850513          	addi	a0,a0,-856 # 8000b058 <etext+0x58>
    800013b8:	00000097          	auipc	ra,0x0
    800013bc:	8d0080e7          	jalr	-1840(ra) # 80000c88 <panic>

  lk->cpu = 0;
    800013c0:	fe843783          	ld	a5,-24(s0)
    800013c4:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800013c8:	0330000f          	fence	rw,rw
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    800013cc:	fe843783          	ld	a5,-24(s0)
    800013d0:	0310000f          	fence	rw,w
    800013d4:	0007a023          	sw	zero,0(a5)

  pop_off();
    800013d8:	00000097          	auipc	ra,0x0
    800013dc:	0ae080e7          	jalr	174(ra) # 80001486 <pop_off>
}
    800013e0:	0001                	nop
    800013e2:	60e2                	ld	ra,24(sp)
    800013e4:	6442                	ld	s0,16(sp)
    800013e6:	6105                	addi	sp,sp,32
    800013e8:	8082                	ret

00000000800013ea <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    800013ea:	7139                	addi	sp,sp,-64
    800013ec:	fc06                	sd	ra,56(sp)
    800013ee:	f822                	sd	s0,48(sp)
    800013f0:	f426                	sd	s1,40(sp)
    800013f2:	0080                	addi	s0,sp,64
    800013f4:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    800013f8:	fc843783          	ld	a5,-56(s0)
    800013fc:	439c                	lw	a5,0(a5)
    800013fe:	cf89                	beqz	a5,80001418 <holding+0x2e>
    80001400:	fc843783          	ld	a5,-56(s0)
    80001404:	6b84                	ld	s1,16(a5)
    80001406:	00001097          	auipc	ra,0x1
    8000140a:	6be080e7          	jalr	1726(ra) # 80002ac4 <mycpu>
    8000140e:	87aa                	mv	a5,a0
    80001410:	00f49463          	bne	s1,a5,80001418 <holding+0x2e>
    80001414:	4785                	li	a5,1
    80001416:	a011                	j	8000141a <holding+0x30>
    80001418:	4781                	li	a5,0
    8000141a:	fcf42e23          	sw	a5,-36(s0)
  return r;
    8000141e:	fdc42783          	lw	a5,-36(s0)
}
    80001422:	853e                	mv	a0,a5
    80001424:	70e2                	ld	ra,56(sp)
    80001426:	7442                	ld	s0,48(sp)
    80001428:	74a2                	ld	s1,40(sp)
    8000142a:	6121                	addi	sp,sp,64
    8000142c:	8082                	ret

000000008000142e <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    8000142e:	1101                	addi	sp,sp,-32
    80001430:	ec06                	sd	ra,24(sp)
    80001432:	e822                	sd	s0,16(sp)
    80001434:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001436:	00000097          	auipc	ra,0x0
    8000143a:	e9c080e7          	jalr	-356(ra) # 800012d2 <intr_get>
    8000143e:	87aa                	mv	a5,a0
    80001440:	fef42623          	sw	a5,-20(s0)

  intr_off();
    80001444:	00000097          	auipc	ra,0x0
    80001448:	e66080e7          	jalr	-410(ra) # 800012aa <intr_off>
  if(mycpu()->noff == 0)
    8000144c:	00001097          	auipc	ra,0x1
    80001450:	678080e7          	jalr	1656(ra) # 80002ac4 <mycpu>
    80001454:	87aa                	mv	a5,a0
    80001456:	5fbc                	lw	a5,120(a5)
    80001458:	eb89                	bnez	a5,8000146a <push_off+0x3c>
    mycpu()->intena = old;
    8000145a:	00001097          	auipc	ra,0x1
    8000145e:	66a080e7          	jalr	1642(ra) # 80002ac4 <mycpu>
    80001462:	872a                	mv	a4,a0
    80001464:	fec42783          	lw	a5,-20(s0)
    80001468:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    8000146a:	00001097          	auipc	ra,0x1
    8000146e:	65a080e7          	jalr	1626(ra) # 80002ac4 <mycpu>
    80001472:	87aa                	mv	a5,a0
    80001474:	5fb8                	lw	a4,120(a5)
    80001476:	2705                	addiw	a4,a4,1
    80001478:	2701                	sext.w	a4,a4
    8000147a:	dfb8                	sw	a4,120(a5)
}
    8000147c:	0001                	nop
    8000147e:	60e2                	ld	ra,24(sp)
    80001480:	6442                	ld	s0,16(sp)
    80001482:	6105                	addi	sp,sp,32
    80001484:	8082                	ret

0000000080001486 <pop_off>:

void
pop_off(void)
{
    80001486:	1101                	addi	sp,sp,-32
    80001488:	ec06                	sd	ra,24(sp)
    8000148a:	e822                	sd	s0,16(sp)
    8000148c:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    8000148e:	00001097          	auipc	ra,0x1
    80001492:	636080e7          	jalr	1590(ra) # 80002ac4 <mycpu>
    80001496:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    8000149a:	00000097          	auipc	ra,0x0
    8000149e:	e38080e7          	jalr	-456(ra) # 800012d2 <intr_get>
    800014a2:	87aa                	mv	a5,a0
    800014a4:	cb89                	beqz	a5,800014b6 <pop_off+0x30>
    panic("pop_off - interruptible");
    800014a6:	0000a517          	auipc	a0,0xa
    800014aa:	bba50513          	addi	a0,a0,-1094 # 8000b060 <etext+0x60>
    800014ae:	fffff097          	auipc	ra,0xfffff
    800014b2:	7da080e7          	jalr	2010(ra) # 80000c88 <panic>
  if(c->noff < 1)
    800014b6:	fe843783          	ld	a5,-24(s0)
    800014ba:	5fbc                	lw	a5,120(a5)
    800014bc:	00f04a63          	bgtz	a5,800014d0 <pop_off+0x4a>
    panic("pop_off");
    800014c0:	0000a517          	auipc	a0,0xa
    800014c4:	bb850513          	addi	a0,a0,-1096 # 8000b078 <etext+0x78>
    800014c8:	fffff097          	auipc	ra,0xfffff
    800014cc:	7c0080e7          	jalr	1984(ra) # 80000c88 <panic>
  c->noff -= 1;
    800014d0:	fe843783          	ld	a5,-24(s0)
    800014d4:	5fbc                	lw	a5,120(a5)
    800014d6:	37fd                	addiw	a5,a5,-1
    800014d8:	0007871b          	sext.w	a4,a5
    800014dc:	fe843783          	ld	a5,-24(s0)
    800014e0:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    800014e2:	fe843783          	ld	a5,-24(s0)
    800014e6:	5fbc                	lw	a5,120(a5)
    800014e8:	eb89                	bnez	a5,800014fa <pop_off+0x74>
    800014ea:	fe843783          	ld	a5,-24(s0)
    800014ee:	5ffc                	lw	a5,124(a5)
    800014f0:	c789                	beqz	a5,800014fa <pop_off+0x74>
    intr_on();
    800014f2:	00000097          	auipc	ra,0x0
    800014f6:	d8e080e7          	jalr	-626(ra) # 80001280 <intr_on>
}
    800014fa:	0001                	nop
    800014fc:	60e2                	ld	ra,24(sp)
    800014fe:	6442                	ld	s0,16(sp)
    80001500:	6105                	addi	sp,sp,32
    80001502:	8082                	ret

0000000080001504 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001504:	7179                	addi	sp,sp,-48
    80001506:	f422                	sd	s0,40(sp)
    80001508:	1800                	addi	s0,sp,48
    8000150a:	fca43c23          	sd	a0,-40(s0)
    8000150e:	87ae                	mv	a5,a1
    80001510:	8732                	mv	a4,a2
    80001512:	fcf42a23          	sw	a5,-44(s0)
    80001516:	87ba                	mv	a5,a4
    80001518:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    8000151c:	fd843783          	ld	a5,-40(s0)
    80001520:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    80001524:	fe042623          	sw	zero,-20(s0)
    80001528:	a00d                	j	8000154a <memset+0x46>
    cdst[i] = c;
    8000152a:	fec42783          	lw	a5,-20(s0)
    8000152e:	fe043703          	ld	a4,-32(s0)
    80001532:	97ba                	add	a5,a5,a4
    80001534:	fd442703          	lw	a4,-44(s0)
    80001538:	0ff77713          	zext.b	a4,a4
    8000153c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    80001540:	fec42783          	lw	a5,-20(s0)
    80001544:	2785                	addiw	a5,a5,1
    80001546:	fef42623          	sw	a5,-20(s0)
    8000154a:	fec42703          	lw	a4,-20(s0)
    8000154e:	fd042783          	lw	a5,-48(s0)
    80001552:	2781                	sext.w	a5,a5
    80001554:	fcf76be3          	bltu	a4,a5,8000152a <memset+0x26>
  }
  return dst;
    80001558:	fd843783          	ld	a5,-40(s0)
}
    8000155c:	853e                	mv	a0,a5
    8000155e:	7422                	ld	s0,40(sp)
    80001560:	6145                	addi	sp,sp,48
    80001562:	8082                	ret

0000000080001564 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    80001564:	7139                	addi	sp,sp,-64
    80001566:	fc22                	sd	s0,56(sp)
    80001568:	0080                	addi	s0,sp,64
    8000156a:	fca43c23          	sd	a0,-40(s0)
    8000156e:	fcb43823          	sd	a1,-48(s0)
    80001572:	87b2                	mv	a5,a2
    80001574:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    80001578:	fd843783          	ld	a5,-40(s0)
    8000157c:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    80001580:	fd043783          	ld	a5,-48(s0)
    80001584:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    80001588:	a0a1                	j	800015d0 <memcmp+0x6c>
    if(*s1 != *s2)
    8000158a:	fe843783          	ld	a5,-24(s0)
    8000158e:	0007c703          	lbu	a4,0(a5)
    80001592:	fe043783          	ld	a5,-32(s0)
    80001596:	0007c783          	lbu	a5,0(a5)
    8000159a:	02f70163          	beq	a4,a5,800015bc <memcmp+0x58>
      return *s1 - *s2;
    8000159e:	fe843783          	ld	a5,-24(s0)
    800015a2:	0007c783          	lbu	a5,0(a5)
    800015a6:	0007871b          	sext.w	a4,a5
    800015aa:	fe043783          	ld	a5,-32(s0)
    800015ae:	0007c783          	lbu	a5,0(a5)
    800015b2:	2781                	sext.w	a5,a5
    800015b4:	40f707bb          	subw	a5,a4,a5
    800015b8:	2781                	sext.w	a5,a5
    800015ba:	a01d                	j	800015e0 <memcmp+0x7c>
    s1++, s2++;
    800015bc:	fe843783          	ld	a5,-24(s0)
    800015c0:	0785                	addi	a5,a5,1
    800015c2:	fef43423          	sd	a5,-24(s0)
    800015c6:	fe043783          	ld	a5,-32(s0)
    800015ca:	0785                	addi	a5,a5,1
    800015cc:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800015d0:	fcc42783          	lw	a5,-52(s0)
    800015d4:	fff7871b          	addiw	a4,a5,-1
    800015d8:	fce42623          	sw	a4,-52(s0)
    800015dc:	f7dd                	bnez	a5,8000158a <memcmp+0x26>
  }

  return 0;
    800015de:	4781                	li	a5,0
}
    800015e0:	853e                	mv	a0,a5
    800015e2:	7462                	ld	s0,56(sp)
    800015e4:	6121                	addi	sp,sp,64
    800015e6:	8082                	ret

00000000800015e8 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    800015e8:	7139                	addi	sp,sp,-64
    800015ea:	fc22                	sd	s0,56(sp)
    800015ec:	0080                	addi	s0,sp,64
    800015ee:	fca43c23          	sd	a0,-40(s0)
    800015f2:	fcb43823          	sd	a1,-48(s0)
    800015f6:	87b2                	mv	a5,a2
    800015f8:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    800015fc:	fcc42783          	lw	a5,-52(s0)
    80001600:	2781                	sext.w	a5,a5
    80001602:	e781                	bnez	a5,8000160a <memmove+0x22>
    return dst;
    80001604:	fd843783          	ld	a5,-40(s0)
    80001608:	a855                	j	800016bc <memmove+0xd4>
  
  s = src;
    8000160a:	fd043783          	ld	a5,-48(s0)
    8000160e:	fef43423          	sd	a5,-24(s0)
  d = dst;
    80001612:	fd843783          	ld	a5,-40(s0)
    80001616:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    8000161a:	fe843703          	ld	a4,-24(s0)
    8000161e:	fe043783          	ld	a5,-32(s0)
    80001622:	08f77463          	bgeu	a4,a5,800016aa <memmove+0xc2>
    80001626:	fcc46783          	lwu	a5,-52(s0)
    8000162a:	fe843703          	ld	a4,-24(s0)
    8000162e:	97ba                	add	a5,a5,a4
    80001630:	fe043703          	ld	a4,-32(s0)
    80001634:	06f77b63          	bgeu	a4,a5,800016aa <memmove+0xc2>
    s += n;
    80001638:	fcc46783          	lwu	a5,-52(s0)
    8000163c:	fe843703          	ld	a4,-24(s0)
    80001640:	97ba                	add	a5,a5,a4
    80001642:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001646:	fcc46783          	lwu	a5,-52(s0)
    8000164a:	fe043703          	ld	a4,-32(s0)
    8000164e:	97ba                	add	a5,a5,a4
    80001650:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    80001654:	a01d                	j	8000167a <memmove+0x92>
      *--d = *--s;
    80001656:	fe843783          	ld	a5,-24(s0)
    8000165a:	17fd                	addi	a5,a5,-1
    8000165c:	fef43423          	sd	a5,-24(s0)
    80001660:	fe043783          	ld	a5,-32(s0)
    80001664:	17fd                	addi	a5,a5,-1
    80001666:	fef43023          	sd	a5,-32(s0)
    8000166a:	fe843783          	ld	a5,-24(s0)
    8000166e:	0007c703          	lbu	a4,0(a5)
    80001672:	fe043783          	ld	a5,-32(s0)
    80001676:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    8000167a:	fcc42783          	lw	a5,-52(s0)
    8000167e:	fff7871b          	addiw	a4,a5,-1
    80001682:	fce42623          	sw	a4,-52(s0)
    80001686:	fbe1                	bnez	a5,80001656 <memmove+0x6e>
  if(s < d && s + n > d){
    80001688:	a805                	j	800016b8 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    8000168a:	fe843703          	ld	a4,-24(s0)
    8000168e:	00170793          	addi	a5,a4,1
    80001692:	fef43423          	sd	a5,-24(s0)
    80001696:	fe043783          	ld	a5,-32(s0)
    8000169a:	00178693          	addi	a3,a5,1
    8000169e:	fed43023          	sd	a3,-32(s0)
    800016a2:	00074703          	lbu	a4,0(a4)
    800016a6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800016aa:	fcc42783          	lw	a5,-52(s0)
    800016ae:	fff7871b          	addiw	a4,a5,-1
    800016b2:	fce42623          	sw	a4,-52(s0)
    800016b6:	fbf1                	bnez	a5,8000168a <memmove+0xa2>

  return dst;
    800016b8:	fd843783          	ld	a5,-40(s0)
}
    800016bc:	853e                	mv	a0,a5
    800016be:	7462                	ld	s0,56(sp)
    800016c0:	6121                	addi	sp,sp,64
    800016c2:	8082                	ret

00000000800016c4 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    800016c4:	7179                	addi	sp,sp,-48
    800016c6:	f406                	sd	ra,40(sp)
    800016c8:	f022                	sd	s0,32(sp)
    800016ca:	1800                	addi	s0,sp,48
    800016cc:	fea43423          	sd	a0,-24(s0)
    800016d0:	feb43023          	sd	a1,-32(s0)
    800016d4:	87b2                	mv	a5,a2
    800016d6:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    800016da:	fdc42783          	lw	a5,-36(s0)
    800016de:	863e                	mv	a2,a5
    800016e0:	fe043583          	ld	a1,-32(s0)
    800016e4:	fe843503          	ld	a0,-24(s0)
    800016e8:	00000097          	auipc	ra,0x0
    800016ec:	f00080e7          	jalr	-256(ra) # 800015e8 <memmove>
    800016f0:	87aa                	mv	a5,a0
}
    800016f2:	853e                	mv	a0,a5
    800016f4:	70a2                	ld	ra,40(sp)
    800016f6:	7402                	ld	s0,32(sp)
    800016f8:	6145                	addi	sp,sp,48
    800016fa:	8082                	ret

00000000800016fc <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    800016fc:	7179                	addi	sp,sp,-48
    800016fe:	f422                	sd	s0,40(sp)
    80001700:	1800                	addi	s0,sp,48
    80001702:	fea43423          	sd	a0,-24(s0)
    80001706:	feb43023          	sd	a1,-32(s0)
    8000170a:	87b2                	mv	a5,a2
    8000170c:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    80001710:	a005                	j	80001730 <strncmp+0x34>
    n--, p++, q++;
    80001712:	fdc42783          	lw	a5,-36(s0)
    80001716:	37fd                	addiw	a5,a5,-1
    80001718:	fcf42e23          	sw	a5,-36(s0)
    8000171c:	fe843783          	ld	a5,-24(s0)
    80001720:	0785                	addi	a5,a5,1
    80001722:	fef43423          	sd	a5,-24(s0)
    80001726:	fe043783          	ld	a5,-32(s0)
    8000172a:	0785                	addi	a5,a5,1
    8000172c:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    80001730:	fdc42783          	lw	a5,-36(s0)
    80001734:	2781                	sext.w	a5,a5
    80001736:	c385                	beqz	a5,80001756 <strncmp+0x5a>
    80001738:	fe843783          	ld	a5,-24(s0)
    8000173c:	0007c783          	lbu	a5,0(a5)
    80001740:	cb99                	beqz	a5,80001756 <strncmp+0x5a>
    80001742:	fe843783          	ld	a5,-24(s0)
    80001746:	0007c703          	lbu	a4,0(a5)
    8000174a:	fe043783          	ld	a5,-32(s0)
    8000174e:	0007c783          	lbu	a5,0(a5)
    80001752:	fcf700e3          	beq	a4,a5,80001712 <strncmp+0x16>
  if(n == 0)
    80001756:	fdc42783          	lw	a5,-36(s0)
    8000175a:	2781                	sext.w	a5,a5
    8000175c:	e399                	bnez	a5,80001762 <strncmp+0x66>
    return 0;
    8000175e:	4781                	li	a5,0
    80001760:	a839                	j	8000177e <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    80001762:	fe843783          	ld	a5,-24(s0)
    80001766:	0007c783          	lbu	a5,0(a5)
    8000176a:	0007871b          	sext.w	a4,a5
    8000176e:	fe043783          	ld	a5,-32(s0)
    80001772:	0007c783          	lbu	a5,0(a5)
    80001776:	2781                	sext.w	a5,a5
    80001778:	40f707bb          	subw	a5,a4,a5
    8000177c:	2781                	sext.w	a5,a5
}
    8000177e:	853e                	mv	a0,a5
    80001780:	7422                	ld	s0,40(sp)
    80001782:	6145                	addi	sp,sp,48
    80001784:	8082                	ret

0000000080001786 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    80001786:	7139                	addi	sp,sp,-64
    80001788:	fc22                	sd	s0,56(sp)
    8000178a:	0080                	addi	s0,sp,64
    8000178c:	fca43c23          	sd	a0,-40(s0)
    80001790:	fcb43823          	sd	a1,-48(s0)
    80001794:	87b2                	mv	a5,a2
    80001796:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    8000179a:	fd843783          	ld	a5,-40(s0)
    8000179e:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800017a2:	0001                	nop
    800017a4:	fcc42783          	lw	a5,-52(s0)
    800017a8:	fff7871b          	addiw	a4,a5,-1
    800017ac:	fce42623          	sw	a4,-52(s0)
    800017b0:	02f05e63          	blez	a5,800017ec <strncpy+0x66>
    800017b4:	fd043703          	ld	a4,-48(s0)
    800017b8:	00170793          	addi	a5,a4,1
    800017bc:	fcf43823          	sd	a5,-48(s0)
    800017c0:	fd843783          	ld	a5,-40(s0)
    800017c4:	00178693          	addi	a3,a5,1
    800017c8:	fcd43c23          	sd	a3,-40(s0)
    800017cc:	00074703          	lbu	a4,0(a4)
    800017d0:	00e78023          	sb	a4,0(a5)
    800017d4:	0007c783          	lbu	a5,0(a5)
    800017d8:	f7f1                	bnez	a5,800017a4 <strncpy+0x1e>
    ;
  while(n-- > 0)
    800017da:	a809                	j	800017ec <strncpy+0x66>
    *s++ = 0;
    800017dc:	fd843783          	ld	a5,-40(s0)
    800017e0:	00178713          	addi	a4,a5,1
    800017e4:	fce43c23          	sd	a4,-40(s0)
    800017e8:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    800017ec:	fcc42783          	lw	a5,-52(s0)
    800017f0:	fff7871b          	addiw	a4,a5,-1
    800017f4:	fce42623          	sw	a4,-52(s0)
    800017f8:	fef042e3          	bgtz	a5,800017dc <strncpy+0x56>
  return os;
    800017fc:	fe843783          	ld	a5,-24(s0)
}
    80001800:	853e                	mv	a0,a5
    80001802:	7462                	ld	s0,56(sp)
    80001804:	6121                	addi	sp,sp,64
    80001806:	8082                	ret

0000000080001808 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001808:	7139                	addi	sp,sp,-64
    8000180a:	fc22                	sd	s0,56(sp)
    8000180c:	0080                	addi	s0,sp,64
    8000180e:	fca43c23          	sd	a0,-40(s0)
    80001812:	fcb43823          	sd	a1,-48(s0)
    80001816:	87b2                	mv	a5,a2
    80001818:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    8000181c:	fd843783          	ld	a5,-40(s0)
    80001820:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    80001824:	fcc42783          	lw	a5,-52(s0)
    80001828:	2781                	sext.w	a5,a5
    8000182a:	00f04563          	bgtz	a5,80001834 <safestrcpy+0x2c>
    return os;
    8000182e:	fe843783          	ld	a5,-24(s0)
    80001832:	a0a9                	j	8000187c <safestrcpy+0x74>
  while(--n > 0 && (*s++ = *t++) != 0)
    80001834:	0001                	nop
    80001836:	fcc42783          	lw	a5,-52(s0)
    8000183a:	37fd                	addiw	a5,a5,-1
    8000183c:	fcf42623          	sw	a5,-52(s0)
    80001840:	fcc42783          	lw	a5,-52(s0)
    80001844:	2781                	sext.w	a5,a5
    80001846:	02f05563          	blez	a5,80001870 <safestrcpy+0x68>
    8000184a:	fd043703          	ld	a4,-48(s0)
    8000184e:	00170793          	addi	a5,a4,1
    80001852:	fcf43823          	sd	a5,-48(s0)
    80001856:	fd843783          	ld	a5,-40(s0)
    8000185a:	00178693          	addi	a3,a5,1
    8000185e:	fcd43c23          	sd	a3,-40(s0)
    80001862:	00074703          	lbu	a4,0(a4)
    80001866:	00e78023          	sb	a4,0(a5)
    8000186a:	0007c783          	lbu	a5,0(a5)
    8000186e:	f7e1                	bnez	a5,80001836 <safestrcpy+0x2e>
    ;
  *s = 0;
    80001870:	fd843783          	ld	a5,-40(s0)
    80001874:	00078023          	sb	zero,0(a5)
  return os;
    80001878:	fe843783          	ld	a5,-24(s0)
}
    8000187c:	853e                	mv	a0,a5
    8000187e:	7462                	ld	s0,56(sp)
    80001880:	6121                	addi	sp,sp,64
    80001882:	8082                	ret

0000000080001884 <strcat>:

char* strcat(char *s1, const char *s2) {
    80001884:	7179                	addi	sp,sp,-48
    80001886:	f422                	sd	s0,40(sp)
    80001888:	1800                	addi	s0,sp,48
    8000188a:	fca43c23          	sd	a0,-40(s0)
    8000188e:	fcb43823          	sd	a1,-48(s0)
  char *os = s1;
    80001892:	fd843783          	ld	a5,-40(s0)
    80001896:	fef43423          	sd	a5,-24(s0)
  while(*os) { os++; }
    8000189a:	a031                	j	800018a6 <strcat+0x22>
    8000189c:	fe843783          	ld	a5,-24(s0)
    800018a0:	0785                	addi	a5,a5,1
    800018a2:	fef43423          	sd	a5,-24(s0)
    800018a6:	fe843783          	ld	a5,-24(s0)
    800018aa:	0007c783          	lbu	a5,0(a5)
    800018ae:	f7fd                	bnez	a5,8000189c <strcat+0x18>
  while(*s2) {
    800018b0:	a00d                	j	800018d2 <strcat+0x4e>
    *os++ = *s2++;
    800018b2:	fd043703          	ld	a4,-48(s0)
    800018b6:	00170793          	addi	a5,a4,1
    800018ba:	fcf43823          	sd	a5,-48(s0)
    800018be:	fe843783          	ld	a5,-24(s0)
    800018c2:	00178693          	addi	a3,a5,1
    800018c6:	fed43423          	sd	a3,-24(s0)
    800018ca:	00074703          	lbu	a4,0(a4)
    800018ce:	00e78023          	sb	a4,0(a5)
  while(*s2) {
    800018d2:	fd043783          	ld	a5,-48(s0)
    800018d6:	0007c783          	lbu	a5,0(a5)
    800018da:	ffe1                	bnez	a5,800018b2 <strcat+0x2e>
  }
  *os = 0;
    800018dc:	fe843783          	ld	a5,-24(s0)
    800018e0:	00078023          	sb	zero,0(a5)
  return s1;
    800018e4:	fd843783          	ld	a5,-40(s0)
}
    800018e8:	853e                	mv	a0,a5
    800018ea:	7422                	ld	s0,40(sp)
    800018ec:	6145                	addi	sp,sp,48
    800018ee:	8082                	ret

00000000800018f0 <itoa>:

static char digits[] = "0123456789abcdef";
void
itoa(int xx, int base, char* result)
{
    800018f0:	7139                	addi	sp,sp,-64
    800018f2:	fc22                	sd	s0,56(sp)
    800018f4:	0080                	addi	s0,sp,64
    800018f6:	87aa                	mv	a5,a0
    800018f8:	872e                	mv	a4,a1
    800018fa:	fcc43023          	sd	a2,-64(s0)
    800018fe:	fcf42623          	sw	a5,-52(s0)
    80001902:	87ba                	mv	a5,a4
    80001904:	fcf42423          	sw	a5,-56(s0)
  char buf[16];
  int i;

  i = 0;
    80001908:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[xx % base];
    8000190c:	fcc42783          	lw	a5,-52(s0)
    80001910:	873e                	mv	a4,a5
    80001912:	fc842783          	lw	a5,-56(s0)
    80001916:	02f767bb          	remw	a5,a4,a5
    8000191a:	0007871b          	sext.w	a4,a5
    8000191e:	fec42783          	lw	a5,-20(s0)
    80001922:	0017869b          	addiw	a3,a5,1
    80001926:	fed42623          	sw	a3,-20(s0)
    8000192a:	0000c697          	auipc	a3,0xc
    8000192e:	53e68693          	addi	a3,a3,1342 # 8000de68 <digits>
    80001932:	9736                	add	a4,a4,a3
    80001934:	00074703          	lbu	a4,0(a4)
    80001938:	17c1                	addi	a5,a5,-16
    8000193a:	97a2                	add	a5,a5,s0
    8000193c:	fee78423          	sb	a4,-24(a5)
  } while((xx /= base) != 0);
    80001940:	fcc42783          	lw	a5,-52(s0)
    80001944:	873e                	mv	a4,a5
    80001946:	fc842783          	lw	a5,-56(s0)
    8000194a:	02f747bb          	divw	a5,a4,a5
    8000194e:	fcf42623          	sw	a5,-52(s0)
    80001952:	fcc42783          	lw	a5,-52(s0)
    80001956:	2781                	sext.w	a5,a5
    80001958:	fbd5                	bnez	a5,8000190c <itoa+0x1c>

  while(*result) {result++;}
    8000195a:	a031                	j	80001966 <itoa+0x76>
    8000195c:	fc043783          	ld	a5,-64(s0)
    80001960:	0785                	addi	a5,a5,1
    80001962:	fcf43023          	sd	a5,-64(s0)
    80001966:	fc043783          	ld	a5,-64(s0)
    8000196a:	0007c783          	lbu	a5,0(a5)
    8000196e:	f7fd                	bnez	a5,8000195c <itoa+0x6c>
  while(--i >= 0) {
    80001970:	a839                	j	8000198e <itoa+0x9e>
    *result++ = buf[i];
    80001972:	fc043783          	ld	a5,-64(s0)
    80001976:	00178713          	addi	a4,a5,1
    8000197a:	fce43023          	sd	a4,-64(s0)
    8000197e:	fec42703          	lw	a4,-20(s0)
    80001982:	1741                	addi	a4,a4,-16
    80001984:	9722                	add	a4,a4,s0
    80001986:	fe874703          	lbu	a4,-24(a4)
    8000198a:	00e78023          	sb	a4,0(a5)
  while(--i >= 0) {
    8000198e:	fec42783          	lw	a5,-20(s0)
    80001992:	37fd                	addiw	a5,a5,-1
    80001994:	fef42623          	sw	a5,-20(s0)
    80001998:	fec42783          	lw	a5,-20(s0)
    8000199c:	2781                	sext.w	a5,a5
    8000199e:	fc07dae3          	bgez	a5,80001972 <itoa+0x82>
  }
  *result = 0;
    800019a2:	fc043783          	ld	a5,-64(s0)
    800019a6:	00078023          	sb	zero,0(a5)
}
    800019aa:	0001                	nop
    800019ac:	7462                	ld	s0,56(sp)
    800019ae:	6121                	addi	sp,sp,64
    800019b0:	8082                	ret

00000000800019b2 <strlen>:

int
strlen(const char *s)
{
    800019b2:	7179                	addi	sp,sp,-48
    800019b4:	f422                	sd	s0,40(sp)
    800019b6:	1800                	addi	s0,sp,48
    800019b8:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800019bc:	fe042623          	sw	zero,-20(s0)
    800019c0:	a031                	j	800019cc <strlen+0x1a>
    800019c2:	fec42783          	lw	a5,-20(s0)
    800019c6:	2785                	addiw	a5,a5,1
    800019c8:	fef42623          	sw	a5,-20(s0)
    800019cc:	fec42783          	lw	a5,-20(s0)
    800019d0:	fd843703          	ld	a4,-40(s0)
    800019d4:	97ba                	add	a5,a5,a4
    800019d6:	0007c783          	lbu	a5,0(a5)
    800019da:	f7e5                	bnez	a5,800019c2 <strlen+0x10>
    ;
  return n;
    800019dc:	fec42783          	lw	a5,-20(s0)
}
    800019e0:	853e                	mv	a0,a5
    800019e2:	7422                	ld	s0,40(sp)
    800019e4:	6145                	addi	sp,sp,48
    800019e6:	8082                	ret

00000000800019e8 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800019e8:	7139                	addi	sp,sp,-64
    800019ea:	fc06                	sd	ra,56(sp)
    800019ec:	f822                	sd	s0,48(sp)
    800019ee:	0080                	addi	s0,sp,64
  if(cpuid() == 0){
    800019f0:	00001097          	auipc	ra,0x1
    800019f4:	0b0080e7          	jalr	176(ra) # 80002aa0 <cpuid>
    800019f8:	87aa                	mv	a5,a0
    800019fa:	14079963          	bnez	a5,80001b4c <main+0x164>
    consoleinit();
    800019fe:	fffff097          	auipc	ra,0xfffff
    80001a02:	e64080e7          	jalr	-412(ra) # 80000862 <consoleinit>
    printfinit();
    80001a06:	fffff097          	auipc	ra,0xfffff
    80001a0a:	386080e7          	jalr	902(ra) # 80000d8c <printfinit>
    printf("\n");
    80001a0e:	00009517          	auipc	a0,0x9
    80001a12:	67250513          	addi	a0,a0,1650 # 8000b080 <etext+0x80>
    80001a16:	fffff097          	auipc	ra,0xfffff
    80001a1a:	01c080e7          	jalr	28(ra) # 80000a32 <printf>
    printf("xv6 kernel is booting\n");
    80001a1e:	00009517          	auipc	a0,0x9
    80001a22:	66a50513          	addi	a0,a0,1642 # 8000b088 <etext+0x88>
    80001a26:	fffff097          	auipc	ra,0xfffff
    80001a2a:	00c080e7          	jalr	12(ra) # 80000a32 <printf>
    printf("\n");
    80001a2e:	00009517          	auipc	a0,0x9
    80001a32:	65250513          	addi	a0,a0,1618 # 8000b080 <etext+0x80>
    80001a36:	fffff097          	auipc	ra,0xfffff
    80001a3a:	ffc080e7          	jalr	-4(ra) # 80000a32 <printf>
    kinit();         // physical page allocator
    80001a3e:	fffff097          	auipc	ra,0xfffff
    80001a42:	65e080e7          	jalr	1630(ra) # 8000109c <kinit>
    kvminit();       // create kernel page table
    80001a46:	00000097          	auipc	ra,0x0
    80001a4a:	2d6080e7          	jalr	726(ra) # 80001d1c <kvminit>
    kvminithart();   // turn on paging
    80001a4e:	00000097          	auipc	ra,0x0
    80001a52:	2f4080e7          	jalr	756(ra) # 80001d42 <kvminithart>
    procinit();      // process table
    80001a56:	00001097          	auipc	ra,0x1
    80001a5a:	f7c080e7          	jalr	-132(ra) # 800029d2 <procinit>
    trapinit();      // trap vectors
    80001a5e:	00002097          	auipc	ra,0x2
    80001a62:	280080e7          	jalr	640(ra) # 80003cde <trapinit>
    trapinithart();  // install kernel trap vector
    80001a66:	00002097          	auipc	ra,0x2
    80001a6a:	2a2080e7          	jalr	674(ra) # 80003d08 <trapinithart>
    plicinit();      // set up interrupt controller
    80001a6e:	00007097          	auipc	ra,0x7
    80001a72:	1fc080e7          	jalr	508(ra) # 80008c6a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001a76:	00007097          	auipc	ra,0x7
    80001a7a:	256080e7          	jalr	598(ra) # 80008ccc <plicinithart>
    binit();         // buffer cache
    80001a7e:	00003097          	auipc	ra,0x3
    80001a82:	dd0080e7          	jalr	-560(ra) # 8000484e <binit>
    iinit();         // inode table
    80001a86:	00003097          	auipc	ra,0x3
    80001a8a:	60a080e7          	jalr	1546(ra) # 80005090 <iinit>
    fileinit();      // file table
    80001a8e:	00005097          	auipc	ra,0x5
    80001a92:	fe8080e7          	jalr	-24(ra) # 80006a76 <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    80001a96:	00009597          	auipc	a1,0x9
    80001a9a:	60a58593          	addi	a1,a1,1546 # 8000b0a0 <etext+0xa0>
    80001a9e:	4501                	li	a0,0
    80001aa0:	00007097          	auipc	ra,0x7
    80001aa4:	344080e7          	jalr	836(ra) # 80008de4 <virtio_disk_init>

    for (int i = VIRTIO_RAID_DISK_START; i <= VIRTIO_RAID_DISK_END; i++) {
    80001aa8:	4785                	li	a5,1
    80001aaa:	fef42623          	sw	a5,-20(s0)
    80001aae:	a89d                	j	80001b24 <main+0x13c>
      char name[30] = {0};
    80001ab0:	fc043423          	sd	zero,-56(s0)
    80001ab4:	fc043823          	sd	zero,-48(s0)
    80001ab8:	fc043c23          	sd	zero,-40(s0)
    80001abc:	fe042023          	sw	zero,-32(s0)
    80001ac0:	fe041223          	sh	zero,-28(s0)
      strcat(name, "disk_");
    80001ac4:	fc840793          	addi	a5,s0,-56
    80001ac8:	00009597          	auipc	a1,0x9
    80001acc:	5e858593          	addi	a1,a1,1512 # 8000b0b0 <etext+0xb0>
    80001ad0:	853e                	mv	a0,a5
    80001ad2:	00000097          	auipc	ra,0x0
    80001ad6:	db2080e7          	jalr	-590(ra) # 80001884 <strcat>
      itoa(i, 10, name);
    80001ada:	fc840713          	addi	a4,s0,-56
    80001ade:	fec42783          	lw	a5,-20(s0)
    80001ae2:	863a                	mv	a2,a4
    80001ae4:	45a9                	li	a1,10
    80001ae6:	853e                	mv	a0,a5
    80001ae8:	00000097          	auipc	ra,0x0
    80001aec:	e08080e7          	jalr	-504(ra) # 800018f0 <itoa>
      printf("%s\n", name);
    80001af0:	fc840793          	addi	a5,s0,-56
    80001af4:	85be                	mv	a1,a5
    80001af6:	00009517          	auipc	a0,0x9
    80001afa:	5c250513          	addi	a0,a0,1474 # 8000b0b8 <etext+0xb8>
    80001afe:	fffff097          	auipc	ra,0xfffff
    80001b02:	f34080e7          	jalr	-204(ra) # 80000a32 <printf>
      virtio_disk_init(i, name);
    80001b06:	fc840713          	addi	a4,s0,-56
    80001b0a:	fec42783          	lw	a5,-20(s0)
    80001b0e:	85ba                	mv	a1,a4
    80001b10:	853e                	mv	a0,a5
    80001b12:	00007097          	auipc	ra,0x7
    80001b16:	2d2080e7          	jalr	722(ra) # 80008de4 <virtio_disk_init>
    for (int i = VIRTIO_RAID_DISK_START; i <= VIRTIO_RAID_DISK_END; i++) {
    80001b1a:	fec42783          	lw	a5,-20(s0)
    80001b1e:	2785                	addiw	a5,a5,1
    80001b20:	fef42623          	sw	a5,-20(s0)
    80001b24:	fec42783          	lw	a5,-20(s0)
    80001b28:	0007871b          	sext.w	a4,a5
    80001b2c:	4789                	li	a5,2
    80001b2e:	f8e7d1e3          	bge	a5,a4,80001ab0 <main+0xc8>
    }


    userinit();      // first user process
    80001b32:	00001097          	auipc	ra,0x1
    80001b36:	34c080e7          	jalr	844(ra) # 80002e7e <userinit>
    __sync_synchronize();
    80001b3a:	0330000f          	fence	rw,rw
    started = 1;
    80001b3e:	00014797          	auipc	a5,0x14
    80001b42:	72278793          	addi	a5,a5,1826 # 80016260 <started>
    80001b46:	4705                	li	a4,1
    80001b48:	c398                	sw	a4,0(a5)
    80001b4a:	a0a9                	j	80001b94 <main+0x1ac>
  } else {
    while(started == 0)
    80001b4c:	0001                	nop
    80001b4e:	00014797          	auipc	a5,0x14
    80001b52:	71278793          	addi	a5,a5,1810 # 80016260 <started>
    80001b56:	439c                	lw	a5,0(a5)
    80001b58:	2781                	sext.w	a5,a5
    80001b5a:	dbf5                	beqz	a5,80001b4e <main+0x166>
      ;
    __sync_synchronize();
    80001b5c:	0330000f          	fence	rw,rw
    printf("hart %d starting\n", cpuid());
    80001b60:	00001097          	auipc	ra,0x1
    80001b64:	f40080e7          	jalr	-192(ra) # 80002aa0 <cpuid>
    80001b68:	87aa                	mv	a5,a0
    80001b6a:	85be                	mv	a1,a5
    80001b6c:	00009517          	auipc	a0,0x9
    80001b70:	55450513          	addi	a0,a0,1364 # 8000b0c0 <etext+0xc0>
    80001b74:	fffff097          	auipc	ra,0xfffff
    80001b78:	ebe080e7          	jalr	-322(ra) # 80000a32 <printf>
    kvminithart();    // turn on paging
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	1c6080e7          	jalr	454(ra) # 80001d42 <kvminithart>
    trapinithart();   // install kernel trap vector
    80001b84:	00002097          	auipc	ra,0x2
    80001b88:	184080e7          	jalr	388(ra) # 80003d08 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001b8c:	00007097          	auipc	ra,0x7
    80001b90:	140080e7          	jalr	320(ra) # 80008ccc <plicinithart>
  }


  scheduler();
    80001b94:	00002097          	auipc	ra,0x2
    80001b98:	900080e7          	jalr	-1792(ra) # 80003494 <scheduler>

0000000080001b9c <w_satp>:
{
    80001b9c:	1101                	addi	sp,sp,-32
    80001b9e:	ec22                	sd	s0,24(sp)
    80001ba0:	1000                	addi	s0,sp,32
    80001ba2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80001ba6:	fe843783          	ld	a5,-24(s0)
    80001baa:	18079073          	csrw	satp,a5
}
    80001bae:	0001                	nop
    80001bb0:	6462                	ld	s0,24(sp)
    80001bb2:	6105                	addi	sp,sp,32
    80001bb4:	8082                	ret

0000000080001bb6 <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    80001bb6:	1141                	addi	sp,sp,-16
    80001bb8:	e422                	sd	s0,8(sp)
    80001bba:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001bbc:	12000073          	sfence.vma
}
    80001bc0:	0001                	nop
    80001bc2:	6422                	ld	s0,8(sp)
    80001bc4:	0141                	addi	sp,sp,16
    80001bc6:	8082                	ret

0000000080001bc8 <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001bc8:	1101                	addi	sp,sp,-32
    80001bca:	ec06                	sd	ra,24(sp)
    80001bcc:	e822                	sd	s0,16(sp)
    80001bce:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001bd0:	fffff097          	auipc	ra,0xfffff
    80001bd4:	60c080e7          	jalr	1548(ra) # 800011dc <kalloc>
    80001bd8:	fea43023          	sd	a0,-32(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001bdc:	6605                	lui	a2,0x1
    80001bde:	4581                	li	a1,0
    80001be0:	fe043503          	ld	a0,-32(s0)
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	920080e7          	jalr	-1760(ra) # 80001504 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001bec:	4719                	li	a4,6
    80001bee:	6685                	lui	a3,0x1
    80001bf0:	10000637          	lui	a2,0x10000
    80001bf4:	100005b7          	lui	a1,0x10000
    80001bf8:	fe043503          	ld	a0,-32(s0)
    80001bfc:	00000097          	auipc	ra,0x0
    80001c00:	2e4080e7          	jalr	740(ra) # 80001ee0 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001c04:	4719                	li	a4,6
    80001c06:	6685                	lui	a3,0x1
    80001c08:	10001637          	lui	a2,0x10001
    80001c0c:	100015b7          	lui	a1,0x10001
    80001c10:	fe043503          	ld	a0,-32(s0)
    80001c14:	00000097          	auipc	ra,0x0
    80001c18:	2cc080e7          	jalr	716(ra) # 80001ee0 <kvmmap>

  for (int i = VIRTIO_RAID_DISK_START; i <= VIRTIO_RAID_DISK_END; i++) {
    80001c1c:	4785                	li	a5,1
    80001c1e:	fef42623          	sw	a5,-20(s0)
    80001c22:	a825                	j	80001c5a <kvmmake+0x92>
    kvmmap(kpgtbl, VIRTIOX(i), VIRTIOX(i), PGSIZE, PTE_R | PTE_W);
    80001c24:	fec42703          	lw	a4,-20(s0)
    80001c28:	67c1                	lui	a5,0x10
    80001c2a:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80001c2c:	97ba                	add	a5,a5,a4
    80001c2e:	07b2                	slli	a5,a5,0xc
    80001c30:	85be                	mv	a1,a5
    80001c32:	fec42703          	lw	a4,-20(s0)
    80001c36:	67c1                	lui	a5,0x10
    80001c38:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80001c3a:	97ba                	add	a5,a5,a4
    80001c3c:	07b2                	slli	a5,a5,0xc
    80001c3e:	4719                	li	a4,6
    80001c40:	6685                	lui	a3,0x1
    80001c42:	863e                	mv	a2,a5
    80001c44:	fe043503          	ld	a0,-32(s0)
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	298080e7          	jalr	664(ra) # 80001ee0 <kvmmap>
  for (int i = VIRTIO_RAID_DISK_START; i <= VIRTIO_RAID_DISK_END; i++) {
    80001c50:	fec42783          	lw	a5,-20(s0)
    80001c54:	2785                	addiw	a5,a5,1
    80001c56:	fef42623          	sw	a5,-20(s0)
    80001c5a:	fec42783          	lw	a5,-20(s0)
    80001c5e:	0007871b          	sext.w	a4,a5
    80001c62:	4789                	li	a5,2
    80001c64:	fce7d0e3          	bge	a5,a4,80001c24 <kvmmake+0x5c>
  }

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001c68:	4719                	li	a4,6
    80001c6a:	004006b7          	lui	a3,0x400
    80001c6e:	0c000637          	lui	a2,0xc000
    80001c72:	0c0005b7          	lui	a1,0xc000
    80001c76:	fe043503          	ld	a0,-32(s0)
    80001c7a:	00000097          	auipc	ra,0x0
    80001c7e:	266080e7          	jalr	614(ra) # 80001ee0 <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    80001c82:	00009717          	auipc	a4,0x9
    80001c86:	37e70713          	addi	a4,a4,894 # 8000b000 <etext>
    80001c8a:	800007b7          	lui	a5,0x80000
    80001c8e:	97ba                	add	a5,a5,a4
    80001c90:	4729                	li	a4,10
    80001c92:	86be                	mv	a3,a5
    80001c94:	4785                	li	a5,1
    80001c96:	01f79613          	slli	a2,a5,0x1f
    80001c9a:	4785                	li	a5,1
    80001c9c:	01f79593          	slli	a1,a5,0x1f
    80001ca0:	fe043503          	ld	a0,-32(s0)
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	23c080e7          	jalr	572(ra) # 80001ee0 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001cac:	00009597          	auipc	a1,0x9
    80001cb0:	35458593          	addi	a1,a1,852 # 8000b000 <etext>
    80001cb4:	00009617          	auipc	a2,0x9
    80001cb8:	34c60613          	addi	a2,a2,844 # 8000b000 <etext>
    80001cbc:	00009797          	auipc	a5,0x9
    80001cc0:	34478793          	addi	a5,a5,836 # 8000b000 <etext>
    80001cc4:	08100713          	li	a4,129
    80001cc8:	0762                	slli	a4,a4,0x18
    80001cca:	40f707b3          	sub	a5,a4,a5
    80001cce:	4719                	li	a4,6
    80001cd0:	86be                	mv	a3,a5
    80001cd2:	fe043503          	ld	a0,-32(s0)
    80001cd6:	00000097          	auipc	ra,0x0
    80001cda:	20a080e7          	jalr	522(ra) # 80001ee0 <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001cde:	00008797          	auipc	a5,0x8
    80001ce2:	32278793          	addi	a5,a5,802 # 8000a000 <_trampoline>
    80001ce6:	4729                	li	a4,10
    80001ce8:	6685                	lui	a3,0x1
    80001cea:	863e                	mv	a2,a5
    80001cec:	040007b7          	lui	a5,0x4000
    80001cf0:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80001cf2:	00c79593          	slli	a1,a5,0xc
    80001cf6:	fe043503          	ld	a0,-32(s0)
    80001cfa:	00000097          	auipc	ra,0x0
    80001cfe:	1e6080e7          	jalr	486(ra) # 80001ee0 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001d02:	fe043503          	ld	a0,-32(s0)
    80001d06:	00001097          	auipc	ra,0x1
    80001d0a:	c10080e7          	jalr	-1008(ra) # 80002916 <proc_mapstacks>
  
  return kpgtbl;
    80001d0e:	fe043783          	ld	a5,-32(s0)
}
    80001d12:	853e                	mv	a0,a5
    80001d14:	60e2                	ld	ra,24(sp)
    80001d16:	6442                	ld	s0,16(sp)
    80001d18:	6105                	addi	sp,sp,32
    80001d1a:	8082                	ret

0000000080001d1c <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001d1c:	1141                	addi	sp,sp,-16
    80001d1e:	e406                	sd	ra,8(sp)
    80001d20:	e022                	sd	s0,0(sp)
    80001d22:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001d24:	00000097          	auipc	ra,0x0
    80001d28:	ea4080e7          	jalr	-348(ra) # 80001bc8 <kvmmake>
    80001d2c:	872a                	mv	a4,a0
    80001d2e:	0000c797          	auipc	a5,0xc
    80001d32:	2ba78793          	addi	a5,a5,698 # 8000dfe8 <kernel_pagetable>
    80001d36:	e398                	sd	a4,0(a5)
}
    80001d38:	0001                	nop
    80001d3a:	60a2                	ld	ra,8(sp)
    80001d3c:	6402                	ld	s0,0(sp)
    80001d3e:	0141                	addi	sp,sp,16
    80001d40:	8082                	ret

0000000080001d42 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001d42:	1141                	addi	sp,sp,-16
    80001d44:	e406                	sd	ra,8(sp)
    80001d46:	e022                	sd	s0,0(sp)
    80001d48:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    80001d4a:	00000097          	auipc	ra,0x0
    80001d4e:	e6c080e7          	jalr	-404(ra) # 80001bb6 <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    80001d52:	0000c797          	auipc	a5,0xc
    80001d56:	29678793          	addi	a5,a5,662 # 8000dfe8 <kernel_pagetable>
    80001d5a:	639c                	ld	a5,0(a5)
    80001d5c:	00c7d713          	srli	a4,a5,0xc
    80001d60:	57fd                	li	a5,-1
    80001d62:	17fe                	slli	a5,a5,0x3f
    80001d64:	8fd9                	or	a5,a5,a4
    80001d66:	853e                	mv	a0,a5
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	e34080e7          	jalr	-460(ra) # 80001b9c <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80001d70:	00000097          	auipc	ra,0x0
    80001d74:	e46080e7          	jalr	-442(ra) # 80001bb6 <sfence_vma>
}
    80001d78:	0001                	nop
    80001d7a:	60a2                	ld	ra,8(sp)
    80001d7c:	6402                	ld	s0,0(sp)
    80001d7e:	0141                	addi	sp,sp,16
    80001d80:	8082                	ret

0000000080001d82 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001d82:	7139                	addi	sp,sp,-64
    80001d84:	fc06                	sd	ra,56(sp)
    80001d86:	f822                	sd	s0,48(sp)
    80001d88:	0080                	addi	s0,sp,64
    80001d8a:	fca43c23          	sd	a0,-40(s0)
    80001d8e:	fcb43823          	sd	a1,-48(s0)
    80001d92:	87b2                	mv	a5,a2
    80001d94:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001d98:	fd043703          	ld	a4,-48(s0)
    80001d9c:	57fd                	li	a5,-1
    80001d9e:	83e9                	srli	a5,a5,0x1a
    80001da0:	00e7f463          	bgeu	a5,a4,80001da8 <walk+0x26>
    return 0;
    80001da4:	4781                	li	a5,0
    80001da6:	a865                	j	80001e5e <walk+0xdc>

  for(int level = 2; level > 0; level--) {
    80001da8:	4789                	li	a5,2
    80001daa:	fef42623          	sw	a5,-20(s0)
    80001dae:	a851                	j	80001e42 <walk+0xc0>
    pte_t *pte = &pagetable[PX(level, va)];
    80001db0:	fec42783          	lw	a5,-20(s0)
    80001db4:	873e                	mv	a4,a5
    80001db6:	87ba                	mv	a5,a4
    80001db8:	0037979b          	slliw	a5,a5,0x3
    80001dbc:	9fb9                	addw	a5,a5,a4
    80001dbe:	2781                	sext.w	a5,a5
    80001dc0:	27b1                	addiw	a5,a5,12
    80001dc2:	2781                	sext.w	a5,a5
    80001dc4:	873e                	mv	a4,a5
    80001dc6:	fd043783          	ld	a5,-48(s0)
    80001dca:	00e7d7b3          	srl	a5,a5,a4
    80001dce:	1ff7f793          	andi	a5,a5,511
    80001dd2:	078e                	slli	a5,a5,0x3
    80001dd4:	fd843703          	ld	a4,-40(s0)
    80001dd8:	97ba                	add	a5,a5,a4
    80001dda:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001dde:	fe043783          	ld	a5,-32(s0)
    80001de2:	639c                	ld	a5,0(a5)
    80001de4:	8b85                	andi	a5,a5,1
    80001de6:	cb89                	beqz	a5,80001df8 <walk+0x76>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001de8:	fe043783          	ld	a5,-32(s0)
    80001dec:	639c                	ld	a5,0(a5)
    80001dee:	83a9                	srli	a5,a5,0xa
    80001df0:	07b2                	slli	a5,a5,0xc
    80001df2:	fcf43c23          	sd	a5,-40(s0)
    80001df6:	a089                	j	80001e38 <walk+0xb6>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001df8:	fcc42783          	lw	a5,-52(s0)
    80001dfc:	2781                	sext.w	a5,a5
    80001dfe:	cb91                	beqz	a5,80001e12 <walk+0x90>
    80001e00:	fffff097          	auipc	ra,0xfffff
    80001e04:	3dc080e7          	jalr	988(ra) # 800011dc <kalloc>
    80001e08:	fca43c23          	sd	a0,-40(s0)
    80001e0c:	fd843783          	ld	a5,-40(s0)
    80001e10:	e399                	bnez	a5,80001e16 <walk+0x94>
        return 0;
    80001e12:	4781                	li	a5,0
    80001e14:	a0a9                	j	80001e5e <walk+0xdc>
      memset(pagetable, 0, PGSIZE);
    80001e16:	6605                	lui	a2,0x1
    80001e18:	4581                	li	a1,0
    80001e1a:	fd843503          	ld	a0,-40(s0)
    80001e1e:	fffff097          	auipc	ra,0xfffff
    80001e22:	6e6080e7          	jalr	1766(ra) # 80001504 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001e26:	fd843783          	ld	a5,-40(s0)
    80001e2a:	83b1                	srli	a5,a5,0xc
    80001e2c:	07aa                	slli	a5,a5,0xa
    80001e2e:	0017e713          	ori	a4,a5,1
    80001e32:	fe043783          	ld	a5,-32(s0)
    80001e36:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001e38:	fec42783          	lw	a5,-20(s0)
    80001e3c:	37fd                	addiw	a5,a5,-1
    80001e3e:	fef42623          	sw	a5,-20(s0)
    80001e42:	fec42783          	lw	a5,-20(s0)
    80001e46:	2781                	sext.w	a5,a5
    80001e48:	f6f044e3          	bgtz	a5,80001db0 <walk+0x2e>
    }
  }
  return &pagetable[PX(0, va)];
    80001e4c:	fd043783          	ld	a5,-48(s0)
    80001e50:	83b1                	srli	a5,a5,0xc
    80001e52:	1ff7f793          	andi	a5,a5,511
    80001e56:	078e                	slli	a5,a5,0x3
    80001e58:	fd843703          	ld	a4,-40(s0)
    80001e5c:	97ba                	add	a5,a5,a4
}
    80001e5e:	853e                	mv	a0,a5
    80001e60:	70e2                	ld	ra,56(sp)
    80001e62:	7442                	ld	s0,48(sp)
    80001e64:	6121                	addi	sp,sp,64
    80001e66:	8082                	ret

0000000080001e68 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001e68:	7179                	addi	sp,sp,-48
    80001e6a:	f406                	sd	ra,40(sp)
    80001e6c:	f022                	sd	s0,32(sp)
    80001e6e:	1800                	addi	s0,sp,48
    80001e70:	fca43c23          	sd	a0,-40(s0)
    80001e74:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001e78:	fd043703          	ld	a4,-48(s0)
    80001e7c:	57fd                	li	a5,-1
    80001e7e:	83e9                	srli	a5,a5,0x1a
    80001e80:	00e7f463          	bgeu	a5,a4,80001e88 <walkaddr+0x20>
    return 0;
    80001e84:	4781                	li	a5,0
    80001e86:	a881                	j	80001ed6 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001e88:	4601                	li	a2,0
    80001e8a:	fd043583          	ld	a1,-48(s0)
    80001e8e:	fd843503          	ld	a0,-40(s0)
    80001e92:	00000097          	auipc	ra,0x0
    80001e96:	ef0080e7          	jalr	-272(ra) # 80001d82 <walk>
    80001e9a:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001e9e:	fe843783          	ld	a5,-24(s0)
    80001ea2:	e399                	bnez	a5,80001ea8 <walkaddr+0x40>
    return 0;
    80001ea4:	4781                	li	a5,0
    80001ea6:	a805                	j	80001ed6 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001ea8:	fe843783          	ld	a5,-24(s0)
    80001eac:	639c                	ld	a5,0(a5)
    80001eae:	8b85                	andi	a5,a5,1
    80001eb0:	e399                	bnez	a5,80001eb6 <walkaddr+0x4e>
    return 0;
    80001eb2:	4781                	li	a5,0
    80001eb4:	a00d                	j	80001ed6 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001eb6:	fe843783          	ld	a5,-24(s0)
    80001eba:	639c                	ld	a5,0(a5)
    80001ebc:	8bc1                	andi	a5,a5,16
    80001ebe:	e399                	bnez	a5,80001ec4 <walkaddr+0x5c>
    return 0;
    80001ec0:	4781                	li	a5,0
    80001ec2:	a811                	j	80001ed6 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001ec4:	fe843783          	ld	a5,-24(s0)
    80001ec8:	639c                	ld	a5,0(a5)
    80001eca:	83a9                	srli	a5,a5,0xa
    80001ecc:	07b2                	slli	a5,a5,0xc
    80001ece:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001ed2:	fe043783          	ld	a5,-32(s0)
}
    80001ed6:	853e                	mv	a0,a5
    80001ed8:	70a2                	ld	ra,40(sp)
    80001eda:	7402                	ld	s0,32(sp)
    80001edc:	6145                	addi	sp,sp,48
    80001ede:	8082                	ret

0000000080001ee0 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001ee0:	7139                	addi	sp,sp,-64
    80001ee2:	fc06                	sd	ra,56(sp)
    80001ee4:	f822                	sd	s0,48(sp)
    80001ee6:	0080                	addi	s0,sp,64
    80001ee8:	fea43423          	sd	a0,-24(s0)
    80001eec:	feb43023          	sd	a1,-32(s0)
    80001ef0:	fcc43c23          	sd	a2,-40(s0)
    80001ef4:	fcd43823          	sd	a3,-48(s0)
    80001ef8:	87ba                	mv	a5,a4
    80001efa:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001efe:	fcc42783          	lw	a5,-52(s0)
    80001f02:	873e                	mv	a4,a5
    80001f04:	fd843683          	ld	a3,-40(s0)
    80001f08:	fd043603          	ld	a2,-48(s0)
    80001f0c:	fe043583          	ld	a1,-32(s0)
    80001f10:	fe843503          	ld	a0,-24(s0)
    80001f14:	00000097          	auipc	ra,0x0
    80001f18:	026080e7          	jalr	38(ra) # 80001f3a <mappages>
    80001f1c:	87aa                	mv	a5,a0
    80001f1e:	cb89                	beqz	a5,80001f30 <kvmmap+0x50>
    panic("kvmmap");
    80001f20:	00009517          	auipc	a0,0x9
    80001f24:	1b850513          	addi	a0,a0,440 # 8000b0d8 <etext+0xd8>
    80001f28:	fffff097          	auipc	ra,0xfffff
    80001f2c:	d60080e7          	jalr	-672(ra) # 80000c88 <panic>
}
    80001f30:	0001                	nop
    80001f32:	70e2                	ld	ra,56(sp)
    80001f34:	7442                	ld	s0,48(sp)
    80001f36:	6121                	addi	sp,sp,64
    80001f38:	8082                	ret

0000000080001f3a <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001f3a:	711d                	addi	sp,sp,-96
    80001f3c:	ec86                	sd	ra,88(sp)
    80001f3e:	e8a2                	sd	s0,80(sp)
    80001f40:	1080                	addi	s0,sp,96
    80001f42:	fca43423          	sd	a0,-56(s0)
    80001f46:	fcb43023          	sd	a1,-64(s0)
    80001f4a:	fac43c23          	sd	a2,-72(s0)
    80001f4e:	fad43823          	sd	a3,-80(s0)
    80001f52:	87ba                	mv	a5,a4
    80001f54:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001f58:	fb843783          	ld	a5,-72(s0)
    80001f5c:	eb89                	bnez	a5,80001f6e <mappages+0x34>
    panic("mappages: size");
    80001f5e:	00009517          	auipc	a0,0x9
    80001f62:	18250513          	addi	a0,a0,386 # 8000b0e0 <etext+0xe0>
    80001f66:	fffff097          	auipc	ra,0xfffff
    80001f6a:	d22080e7          	jalr	-734(ra) # 80000c88 <panic>
  
  a = PGROUNDDOWN(va);
    80001f6e:	fc043703          	ld	a4,-64(s0)
    80001f72:	77fd                	lui	a5,0xfffff
    80001f74:	8ff9                	and	a5,a5,a4
    80001f76:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001f7a:	fc043703          	ld	a4,-64(s0)
    80001f7e:	fb843783          	ld	a5,-72(s0)
    80001f82:	97ba                	add	a5,a5,a4
    80001f84:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd75bf>
    80001f88:	77fd                	lui	a5,0xfffff
    80001f8a:	8ff9                	and	a5,a5,a4
    80001f8c:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001f90:	4605                	li	a2,1
    80001f92:	fe843583          	ld	a1,-24(s0)
    80001f96:	fc843503          	ld	a0,-56(s0)
    80001f9a:	00000097          	auipc	ra,0x0
    80001f9e:	de8080e7          	jalr	-536(ra) # 80001d82 <walk>
    80001fa2:	fca43c23          	sd	a0,-40(s0)
    80001fa6:	fd843783          	ld	a5,-40(s0)
    80001faa:	e399                	bnez	a5,80001fb0 <mappages+0x76>
      return -1;
    80001fac:	57fd                	li	a5,-1
    80001fae:	a085                	j	8000200e <mappages+0xd4>
    if(*pte & PTE_V)
    80001fb0:	fd843783          	ld	a5,-40(s0)
    80001fb4:	639c                	ld	a5,0(a5)
    80001fb6:	8b85                	andi	a5,a5,1
    80001fb8:	cb89                	beqz	a5,80001fca <mappages+0x90>
      panic("mappages: remap");
    80001fba:	00009517          	auipc	a0,0x9
    80001fbe:	13650513          	addi	a0,a0,310 # 8000b0f0 <etext+0xf0>
    80001fc2:	fffff097          	auipc	ra,0xfffff
    80001fc6:	cc6080e7          	jalr	-826(ra) # 80000c88 <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001fca:	fb043783          	ld	a5,-80(s0)
    80001fce:	83b1                	srli	a5,a5,0xc
    80001fd0:	00a79713          	slli	a4,a5,0xa
    80001fd4:	fac42783          	lw	a5,-84(s0)
    80001fd8:	8fd9                	or	a5,a5,a4
    80001fda:	0017e713          	ori	a4,a5,1
    80001fde:	fd843783          	ld	a5,-40(s0)
    80001fe2:	e398                	sd	a4,0(a5)
    if(a == last)
    80001fe4:	fe843703          	ld	a4,-24(s0)
    80001fe8:	fe043783          	ld	a5,-32(s0)
    80001fec:	00f70f63          	beq	a4,a5,8000200a <mappages+0xd0>
      break;
    a += PGSIZE;
    80001ff0:	fe843703          	ld	a4,-24(s0)
    80001ff4:	6785                	lui	a5,0x1
    80001ff6:	97ba                	add	a5,a5,a4
    80001ff8:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001ffc:	fb043703          	ld	a4,-80(s0)
    80002000:	6785                	lui	a5,0x1
    80002002:	97ba                	add	a5,a5,a4
    80002004:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80002008:	b761                	j	80001f90 <mappages+0x56>
      break;
    8000200a:	0001                	nop
  }
  return 0;
    8000200c:	4781                	li	a5,0
}
    8000200e:	853e                	mv	a0,a5
    80002010:	60e6                	ld	ra,88(sp)
    80002012:	6446                	ld	s0,80(sp)
    80002014:	6125                	addi	sp,sp,96
    80002016:	8082                	ret

0000000080002018 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80002018:	715d                	addi	sp,sp,-80
    8000201a:	e486                	sd	ra,72(sp)
    8000201c:	e0a2                	sd	s0,64(sp)
    8000201e:	0880                	addi	s0,sp,80
    80002020:	fca43423          	sd	a0,-56(s0)
    80002024:	fcb43023          	sd	a1,-64(s0)
    80002028:	fac43c23          	sd	a2,-72(s0)
    8000202c:	87b6                	mv	a5,a3
    8000202e:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80002032:	fc043703          	ld	a4,-64(s0)
    80002036:	6785                	lui	a5,0x1
    80002038:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000203a:	8ff9                	and	a5,a5,a4
    8000203c:	cb89                	beqz	a5,8000204e <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    8000203e:	00009517          	auipc	a0,0x9
    80002042:	0c250513          	addi	a0,a0,194 # 8000b100 <etext+0x100>
    80002046:	fffff097          	auipc	ra,0xfffff
    8000204a:	c42080e7          	jalr	-958(ra) # 80000c88 <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    8000204e:	fc043783          	ld	a5,-64(s0)
    80002052:	fef43423          	sd	a5,-24(s0)
    80002056:	a045                	j	800020f6 <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80002058:	4601                	li	a2,0
    8000205a:	fe843583          	ld	a1,-24(s0)
    8000205e:	fc843503          	ld	a0,-56(s0)
    80002062:	00000097          	auipc	ra,0x0
    80002066:	d20080e7          	jalr	-736(ra) # 80001d82 <walk>
    8000206a:	fea43023          	sd	a0,-32(s0)
    8000206e:	fe043783          	ld	a5,-32(s0)
    80002072:	eb89                	bnez	a5,80002084 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80002074:	00009517          	auipc	a0,0x9
    80002078:	0a450513          	addi	a0,a0,164 # 8000b118 <etext+0x118>
    8000207c:	fffff097          	auipc	ra,0xfffff
    80002080:	c0c080e7          	jalr	-1012(ra) # 80000c88 <panic>
    if((*pte & PTE_V) == 0)
    80002084:	fe043783          	ld	a5,-32(s0)
    80002088:	639c                	ld	a5,0(a5)
    8000208a:	8b85                	andi	a5,a5,1
    8000208c:	eb89                	bnez	a5,8000209e <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    8000208e:	00009517          	auipc	a0,0x9
    80002092:	09a50513          	addi	a0,a0,154 # 8000b128 <etext+0x128>
    80002096:	fffff097          	auipc	ra,0xfffff
    8000209a:	bf2080e7          	jalr	-1038(ra) # 80000c88 <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    8000209e:	fe043783          	ld	a5,-32(s0)
    800020a2:	639c                	ld	a5,0(a5)
    800020a4:	3ff7f713          	andi	a4,a5,1023
    800020a8:	4785                	li	a5,1
    800020aa:	00f71a63          	bne	a4,a5,800020be <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    800020ae:	00009517          	auipc	a0,0x9
    800020b2:	09250513          	addi	a0,a0,146 # 8000b140 <etext+0x140>
    800020b6:	fffff097          	auipc	ra,0xfffff
    800020ba:	bd2080e7          	jalr	-1070(ra) # 80000c88 <panic>
    if(do_free){
    800020be:	fb442783          	lw	a5,-76(s0)
    800020c2:	2781                	sext.w	a5,a5
    800020c4:	cf99                	beqz	a5,800020e2 <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    800020c6:	fe043783          	ld	a5,-32(s0)
    800020ca:	639c                	ld	a5,0(a5)
    800020cc:	83a9                	srli	a5,a5,0xa
    800020ce:	07b2                	slli	a5,a5,0xc
    800020d0:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    800020d4:	fd843783          	ld	a5,-40(s0)
    800020d8:	853e                	mv	a0,a5
    800020da:	fffff097          	auipc	ra,0xfffff
    800020de:	05c080e7          	jalr	92(ra) # 80001136 <kfree>
    }
    *pte = 0;
    800020e2:	fe043783          	ld	a5,-32(s0)
    800020e6:	0007b023          	sd	zero,0(a5)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    800020ea:	fe843703          	ld	a4,-24(s0)
    800020ee:	6785                	lui	a5,0x1
    800020f0:	97ba                	add	a5,a5,a4
    800020f2:	fef43423          	sd	a5,-24(s0)
    800020f6:	fb843783          	ld	a5,-72(s0)
    800020fa:	00c79713          	slli	a4,a5,0xc
    800020fe:	fc043783          	ld	a5,-64(s0)
    80002102:	97ba                	add	a5,a5,a4
    80002104:	fe843703          	ld	a4,-24(s0)
    80002108:	f4f768e3          	bltu	a4,a5,80002058 <uvmunmap+0x40>
  }
}
    8000210c:	0001                	nop
    8000210e:	0001                	nop
    80002110:	60a6                	ld	ra,72(sp)
    80002112:	6406                	ld	s0,64(sp)
    80002114:	6161                	addi	sp,sp,80
    80002116:	8082                	ret

0000000080002118 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80002118:	1101                	addi	sp,sp,-32
    8000211a:	ec06                	sd	ra,24(sp)
    8000211c:	e822                	sd	s0,16(sp)
    8000211e:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	0bc080e7          	jalr	188(ra) # 800011dc <kalloc>
    80002128:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    8000212c:	fe843783          	ld	a5,-24(s0)
    80002130:	e399                	bnez	a5,80002136 <uvmcreate+0x1e>
    return 0;
    80002132:	4781                	li	a5,0
    80002134:	a819                	j	8000214a <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80002136:	6605                	lui	a2,0x1
    80002138:	4581                	li	a1,0
    8000213a:	fe843503          	ld	a0,-24(s0)
    8000213e:	fffff097          	auipc	ra,0xfffff
    80002142:	3c6080e7          	jalr	966(ra) # 80001504 <memset>
  return pagetable;
    80002146:	fe843783          	ld	a5,-24(s0)
}
    8000214a:	853e                	mv	a0,a5
    8000214c:	60e2                	ld	ra,24(sp)
    8000214e:	6442                	ld	s0,16(sp)
    80002150:	6105                	addi	sp,sp,32
    80002152:	8082                	ret

0000000080002154 <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    80002154:	7139                	addi	sp,sp,-64
    80002156:	fc06                	sd	ra,56(sp)
    80002158:	f822                	sd	s0,48(sp)
    8000215a:	0080                	addi	s0,sp,64
    8000215c:	fca43c23          	sd	a0,-40(s0)
    80002160:	fcb43823          	sd	a1,-48(s0)
    80002164:	87b2                	mv	a5,a2
    80002166:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    8000216a:	fcc42783          	lw	a5,-52(s0)
    8000216e:	0007871b          	sext.w	a4,a5
    80002172:	6785                	lui	a5,0x1
    80002174:	00f76a63          	bltu	a4,a5,80002188 <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    80002178:	00009517          	auipc	a0,0x9
    8000217c:	fe050513          	addi	a0,a0,-32 # 8000b158 <etext+0x158>
    80002180:	fffff097          	auipc	ra,0xfffff
    80002184:	b08080e7          	jalr	-1272(ra) # 80000c88 <panic>
  mem = kalloc();
    80002188:	fffff097          	auipc	ra,0xfffff
    8000218c:	054080e7          	jalr	84(ra) # 800011dc <kalloc>
    80002190:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80002194:	6605                	lui	a2,0x1
    80002196:	4581                	li	a1,0
    80002198:	fe843503          	ld	a0,-24(s0)
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	368080e7          	jalr	872(ra) # 80001504 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    800021a4:	fe843783          	ld	a5,-24(s0)
    800021a8:	4779                	li	a4,30
    800021aa:	86be                	mv	a3,a5
    800021ac:	6605                	lui	a2,0x1
    800021ae:	4581                	li	a1,0
    800021b0:	fd843503          	ld	a0,-40(s0)
    800021b4:	00000097          	auipc	ra,0x0
    800021b8:	d86080e7          	jalr	-634(ra) # 80001f3a <mappages>
  memmove(mem, src, sz);
    800021bc:	fcc42783          	lw	a5,-52(s0)
    800021c0:	863e                	mv	a2,a5
    800021c2:	fd043583          	ld	a1,-48(s0)
    800021c6:	fe843503          	ld	a0,-24(s0)
    800021ca:	fffff097          	auipc	ra,0xfffff
    800021ce:	41e080e7          	jalr	1054(ra) # 800015e8 <memmove>
}
    800021d2:	0001                	nop
    800021d4:	70e2                	ld	ra,56(sp)
    800021d6:	7442                	ld	s0,48(sp)
    800021d8:	6121                	addi	sp,sp,64
    800021da:	8082                	ret

00000000800021dc <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    800021dc:	7139                	addi	sp,sp,-64
    800021de:	fc06                	sd	ra,56(sp)
    800021e0:	f822                	sd	s0,48(sp)
    800021e2:	0080                	addi	s0,sp,64
    800021e4:	fca43c23          	sd	a0,-40(s0)
    800021e8:	fcb43823          	sd	a1,-48(s0)
    800021ec:	fcc43423          	sd	a2,-56(s0)
    800021f0:	87b6                	mv	a5,a3
    800021f2:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    800021f6:	fc843703          	ld	a4,-56(s0)
    800021fa:	fd043783          	ld	a5,-48(s0)
    800021fe:	00f77563          	bgeu	a4,a5,80002208 <uvmalloc+0x2c>
    return oldsz;
    80002202:	fd043783          	ld	a5,-48(s0)
    80002206:	a87d                	j	800022c4 <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    80002208:	fd043703          	ld	a4,-48(s0)
    8000220c:	6785                	lui	a5,0x1
    8000220e:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80002210:	973e                	add	a4,a4,a5
    80002212:	77fd                	lui	a5,0xfffff
    80002214:	8ff9                	and	a5,a5,a4
    80002216:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    8000221a:	fd043783          	ld	a5,-48(s0)
    8000221e:	fef43423          	sd	a5,-24(s0)
    80002222:	a849                	j	800022b4 <uvmalloc+0xd8>
    mem = kalloc();
    80002224:	fffff097          	auipc	ra,0xfffff
    80002228:	fb8080e7          	jalr	-72(ra) # 800011dc <kalloc>
    8000222c:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80002230:	fe043783          	ld	a5,-32(s0)
    80002234:	ef89                	bnez	a5,8000224e <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    80002236:	fd043603          	ld	a2,-48(s0)
    8000223a:	fe843583          	ld	a1,-24(s0)
    8000223e:	fd843503          	ld	a0,-40(s0)
    80002242:	00000097          	auipc	ra,0x0
    80002246:	08c080e7          	jalr	140(ra) # 800022ce <uvmdealloc>
      return 0;
    8000224a:	4781                	li	a5,0
    8000224c:	a8a5                	j	800022c4 <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    8000224e:	6605                	lui	a2,0x1
    80002250:	4581                	li	a1,0
    80002252:	fe043503          	ld	a0,-32(s0)
    80002256:	fffff097          	auipc	ra,0xfffff
    8000225a:	2ae080e7          	jalr	686(ra) # 80001504 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    8000225e:	fe043783          	ld	a5,-32(s0)
    80002262:	fc442703          	lw	a4,-60(s0)
    80002266:	01276713          	ori	a4,a4,18
    8000226a:	2701                	sext.w	a4,a4
    8000226c:	86be                	mv	a3,a5
    8000226e:	6605                	lui	a2,0x1
    80002270:	fe843583          	ld	a1,-24(s0)
    80002274:	fd843503          	ld	a0,-40(s0)
    80002278:	00000097          	auipc	ra,0x0
    8000227c:	cc2080e7          	jalr	-830(ra) # 80001f3a <mappages>
    80002280:	87aa                	mv	a5,a0
    80002282:	c39d                	beqz	a5,800022a8 <uvmalloc+0xcc>
      kfree(mem);
    80002284:	fe043503          	ld	a0,-32(s0)
    80002288:	fffff097          	auipc	ra,0xfffff
    8000228c:	eae080e7          	jalr	-338(ra) # 80001136 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80002290:	fd043603          	ld	a2,-48(s0)
    80002294:	fe843583          	ld	a1,-24(s0)
    80002298:	fd843503          	ld	a0,-40(s0)
    8000229c:	00000097          	auipc	ra,0x0
    800022a0:	032080e7          	jalr	50(ra) # 800022ce <uvmdealloc>
      return 0;
    800022a4:	4781                	li	a5,0
    800022a6:	a839                	j	800022c4 <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    800022a8:	fe843703          	ld	a4,-24(s0)
    800022ac:	6785                	lui	a5,0x1
    800022ae:	97ba                	add	a5,a5,a4
    800022b0:	fef43423          	sd	a5,-24(s0)
    800022b4:	fe843703          	ld	a4,-24(s0)
    800022b8:	fc843783          	ld	a5,-56(s0)
    800022bc:	f6f764e3          	bltu	a4,a5,80002224 <uvmalloc+0x48>
    }
  }
  return newsz;
    800022c0:	fc843783          	ld	a5,-56(s0)
}
    800022c4:	853e                	mv	a0,a5
    800022c6:	70e2                	ld	ra,56(sp)
    800022c8:	7442                	ld	s0,48(sp)
    800022ca:	6121                	addi	sp,sp,64
    800022cc:	8082                	ret

00000000800022ce <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    800022ce:	7139                	addi	sp,sp,-64
    800022d0:	fc06                	sd	ra,56(sp)
    800022d2:	f822                	sd	s0,48(sp)
    800022d4:	0080                	addi	s0,sp,64
    800022d6:	fca43c23          	sd	a0,-40(s0)
    800022da:	fcb43823          	sd	a1,-48(s0)
    800022de:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    800022e2:	fc843703          	ld	a4,-56(s0)
    800022e6:	fd043783          	ld	a5,-48(s0)
    800022ea:	00f76563          	bltu	a4,a5,800022f4 <uvmdealloc+0x26>
    return oldsz;
    800022ee:	fd043783          	ld	a5,-48(s0)
    800022f2:	a885                	j	80002362 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    800022f4:	fc843703          	ld	a4,-56(s0)
    800022f8:	6785                	lui	a5,0x1
    800022fa:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800022fc:	973e                	add	a4,a4,a5
    800022fe:	77fd                	lui	a5,0xfffff
    80002300:	8f7d                	and	a4,a4,a5
    80002302:	fd043683          	ld	a3,-48(s0)
    80002306:	6785                	lui	a5,0x1
    80002308:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000230a:	96be                	add	a3,a3,a5
    8000230c:	77fd                	lui	a5,0xfffff
    8000230e:	8ff5                	and	a5,a5,a3
    80002310:	04f77763          	bgeu	a4,a5,8000235e <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002314:	fd043703          	ld	a4,-48(s0)
    80002318:	6785                	lui	a5,0x1
    8000231a:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000231c:	973e                	add	a4,a4,a5
    8000231e:	77fd                	lui	a5,0xfffff
    80002320:	8f7d                	and	a4,a4,a5
    80002322:	fc843683          	ld	a3,-56(s0)
    80002326:	6785                	lui	a5,0x1
    80002328:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000232a:	96be                	add	a3,a3,a5
    8000232c:	77fd                	lui	a5,0xfffff
    8000232e:	8ff5                	and	a5,a5,a3
    80002330:	40f707b3          	sub	a5,a4,a5
    80002334:	83b1                	srli	a5,a5,0xc
    80002336:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    8000233a:	fc843703          	ld	a4,-56(s0)
    8000233e:	6785                	lui	a5,0x1
    80002340:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80002342:	973e                	add	a4,a4,a5
    80002344:	77fd                	lui	a5,0xfffff
    80002346:	8ff9                	and	a5,a5,a4
    80002348:	fec42703          	lw	a4,-20(s0)
    8000234c:	4685                	li	a3,1
    8000234e:	863a                	mv	a2,a4
    80002350:	85be                	mv	a1,a5
    80002352:	fd843503          	ld	a0,-40(s0)
    80002356:	00000097          	auipc	ra,0x0
    8000235a:	cc2080e7          	jalr	-830(ra) # 80002018 <uvmunmap>
  }

  return newsz;
    8000235e:	fc843783          	ld	a5,-56(s0)
}
    80002362:	853e                	mv	a0,a5
    80002364:	70e2                	ld	ra,56(sp)
    80002366:	7442                	ld	s0,48(sp)
    80002368:	6121                	addi	sp,sp,64
    8000236a:	8082                	ret

000000008000236c <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8000236c:	7139                	addi	sp,sp,-64
    8000236e:	fc06                	sd	ra,56(sp)
    80002370:	f822                	sd	s0,48(sp)
    80002372:	0080                	addi	s0,sp,64
    80002374:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002378:	fe042623          	sw	zero,-20(s0)
    8000237c:	a88d                	j	800023ee <freewalk+0x82>
    pte_t pte = pagetable[i];
    8000237e:	fec42783          	lw	a5,-20(s0)
    80002382:	078e                	slli	a5,a5,0x3
    80002384:	fc843703          	ld	a4,-56(s0)
    80002388:	97ba                	add	a5,a5,a4
    8000238a:	639c                	ld	a5,0(a5)
    8000238c:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002390:	fe043783          	ld	a5,-32(s0)
    80002394:	8b85                	andi	a5,a5,1
    80002396:	cb9d                	beqz	a5,800023cc <freewalk+0x60>
    80002398:	fe043783          	ld	a5,-32(s0)
    8000239c:	8bb9                	andi	a5,a5,14
    8000239e:	e79d                	bnez	a5,800023cc <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800023a0:	fe043783          	ld	a5,-32(s0)
    800023a4:	83a9                	srli	a5,a5,0xa
    800023a6:	07b2                	slli	a5,a5,0xc
    800023a8:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800023ac:	fd843783          	ld	a5,-40(s0)
    800023b0:	853e                	mv	a0,a5
    800023b2:	00000097          	auipc	ra,0x0
    800023b6:	fba080e7          	jalr	-70(ra) # 8000236c <freewalk>
      pagetable[i] = 0;
    800023ba:	fec42783          	lw	a5,-20(s0)
    800023be:	078e                	slli	a5,a5,0x3
    800023c0:	fc843703          	ld	a4,-56(s0)
    800023c4:	97ba                	add	a5,a5,a4
    800023c6:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffd75c0>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800023ca:	a829                	j	800023e4 <freewalk+0x78>
    } else if(pte & PTE_V){
    800023cc:	fe043783          	ld	a5,-32(s0)
    800023d0:	8b85                	andi	a5,a5,1
    800023d2:	cb89                	beqz	a5,800023e4 <freewalk+0x78>
      panic("freewalk: leaf");
    800023d4:	00009517          	auipc	a0,0x9
    800023d8:	da450513          	addi	a0,a0,-604 # 8000b178 <etext+0x178>
    800023dc:	fffff097          	auipc	ra,0xfffff
    800023e0:	8ac080e7          	jalr	-1876(ra) # 80000c88 <panic>
  for(int i = 0; i < 512; i++){
    800023e4:	fec42783          	lw	a5,-20(s0)
    800023e8:	2785                	addiw	a5,a5,1
    800023ea:	fef42623          	sw	a5,-20(s0)
    800023ee:	fec42783          	lw	a5,-20(s0)
    800023f2:	0007871b          	sext.w	a4,a5
    800023f6:	1ff00793          	li	a5,511
    800023fa:	f8e7d2e3          	bge	a5,a4,8000237e <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    800023fe:	fc843503          	ld	a0,-56(s0)
    80002402:	fffff097          	auipc	ra,0xfffff
    80002406:	d34080e7          	jalr	-716(ra) # 80001136 <kfree>
}
    8000240a:	0001                	nop
    8000240c:	70e2                	ld	ra,56(sp)
    8000240e:	7442                	ld	s0,48(sp)
    80002410:	6121                	addi	sp,sp,64
    80002412:	8082                	ret

0000000080002414 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002414:	1101                	addi	sp,sp,-32
    80002416:	ec06                	sd	ra,24(sp)
    80002418:	e822                	sd	s0,16(sp)
    8000241a:	1000                	addi	s0,sp,32
    8000241c:	fea43423          	sd	a0,-24(s0)
    80002420:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002424:	fe043783          	ld	a5,-32(s0)
    80002428:	c385                	beqz	a5,80002448 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    8000242a:	fe043703          	ld	a4,-32(s0)
    8000242e:	6785                	lui	a5,0x1
    80002430:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80002432:	97ba                	add	a5,a5,a4
    80002434:	83b1                	srli	a5,a5,0xc
    80002436:	4685                	li	a3,1
    80002438:	863e                	mv	a2,a5
    8000243a:	4581                	li	a1,0
    8000243c:	fe843503          	ld	a0,-24(s0)
    80002440:	00000097          	auipc	ra,0x0
    80002444:	bd8080e7          	jalr	-1064(ra) # 80002018 <uvmunmap>
  freewalk(pagetable);
    80002448:	fe843503          	ld	a0,-24(s0)
    8000244c:	00000097          	auipc	ra,0x0
    80002450:	f20080e7          	jalr	-224(ra) # 8000236c <freewalk>
}
    80002454:	0001                	nop
    80002456:	60e2                	ld	ra,24(sp)
    80002458:	6442                	ld	s0,16(sp)
    8000245a:	6105                	addi	sp,sp,32
    8000245c:	8082                	ret

000000008000245e <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    8000245e:	711d                	addi	sp,sp,-96
    80002460:	ec86                	sd	ra,88(sp)
    80002462:	e8a2                	sd	s0,80(sp)
    80002464:	1080                	addi	s0,sp,96
    80002466:	faa43c23          	sd	a0,-72(s0)
    8000246a:	fab43823          	sd	a1,-80(s0)
    8000246e:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002472:	fe043423          	sd	zero,-24(s0)
    80002476:	a0d9                	j	8000253c <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002478:	4601                	li	a2,0
    8000247a:	fe843583          	ld	a1,-24(s0)
    8000247e:	fb843503          	ld	a0,-72(s0)
    80002482:	00000097          	auipc	ra,0x0
    80002486:	900080e7          	jalr	-1792(ra) # 80001d82 <walk>
    8000248a:	fea43023          	sd	a0,-32(s0)
    8000248e:	fe043783          	ld	a5,-32(s0)
    80002492:	eb89                	bnez	a5,800024a4 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    80002494:	00009517          	auipc	a0,0x9
    80002498:	cf450513          	addi	a0,a0,-780 # 8000b188 <etext+0x188>
    8000249c:	ffffe097          	auipc	ra,0xffffe
    800024a0:	7ec080e7          	jalr	2028(ra) # 80000c88 <panic>
    if((*pte & PTE_V) == 0)
    800024a4:	fe043783          	ld	a5,-32(s0)
    800024a8:	639c                	ld	a5,0(a5)
    800024aa:	8b85                	andi	a5,a5,1
    800024ac:	eb89                	bnez	a5,800024be <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800024ae:	00009517          	auipc	a0,0x9
    800024b2:	cfa50513          	addi	a0,a0,-774 # 8000b1a8 <etext+0x1a8>
    800024b6:	ffffe097          	auipc	ra,0xffffe
    800024ba:	7d2080e7          	jalr	2002(ra) # 80000c88 <panic>
    pa = PTE2PA(*pte);
    800024be:	fe043783          	ld	a5,-32(s0)
    800024c2:	639c                	ld	a5,0(a5)
    800024c4:	83a9                	srli	a5,a5,0xa
    800024c6:	07b2                	slli	a5,a5,0xc
    800024c8:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800024cc:	fe043783          	ld	a5,-32(s0)
    800024d0:	639c                	ld	a5,0(a5)
    800024d2:	2781                	sext.w	a5,a5
    800024d4:	3ff7f793          	andi	a5,a5,1023
    800024d8:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800024dc:	fffff097          	auipc	ra,0xfffff
    800024e0:	d00080e7          	jalr	-768(ra) # 800011dc <kalloc>
    800024e4:	fca43423          	sd	a0,-56(s0)
    800024e8:	fc843783          	ld	a5,-56(s0)
    800024ec:	c3a5                	beqz	a5,8000254c <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    800024ee:	fd843783          	ld	a5,-40(s0)
    800024f2:	6605                	lui	a2,0x1
    800024f4:	85be                	mv	a1,a5
    800024f6:	fc843503          	ld	a0,-56(s0)
    800024fa:	fffff097          	auipc	ra,0xfffff
    800024fe:	0ee080e7          	jalr	238(ra) # 800015e8 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002502:	fc843783          	ld	a5,-56(s0)
    80002506:	fd442703          	lw	a4,-44(s0)
    8000250a:	86be                	mv	a3,a5
    8000250c:	6605                	lui	a2,0x1
    8000250e:	fe843583          	ld	a1,-24(s0)
    80002512:	fb043503          	ld	a0,-80(s0)
    80002516:	00000097          	auipc	ra,0x0
    8000251a:	a24080e7          	jalr	-1500(ra) # 80001f3a <mappages>
    8000251e:	87aa                	mv	a5,a0
    80002520:	cb81                	beqz	a5,80002530 <uvmcopy+0xd2>
      kfree(mem);
    80002522:	fc843503          	ld	a0,-56(s0)
    80002526:	fffff097          	auipc	ra,0xfffff
    8000252a:	c10080e7          	jalr	-1008(ra) # 80001136 <kfree>
      goto err;
    8000252e:	a005                	j	8000254e <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    80002530:	fe843703          	ld	a4,-24(s0)
    80002534:	6785                	lui	a5,0x1
    80002536:	97ba                	add	a5,a5,a4
    80002538:	fef43423          	sd	a5,-24(s0)
    8000253c:	fe843703          	ld	a4,-24(s0)
    80002540:	fa843783          	ld	a5,-88(s0)
    80002544:	f2f76ae3          	bltu	a4,a5,80002478 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002548:	4781                	li	a5,0
    8000254a:	a839                	j	80002568 <uvmcopy+0x10a>
      goto err;
    8000254c:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    8000254e:	fe843783          	ld	a5,-24(s0)
    80002552:	83b1                	srli	a5,a5,0xc
    80002554:	4685                	li	a3,1
    80002556:	863e                	mv	a2,a5
    80002558:	4581                	li	a1,0
    8000255a:	fb043503          	ld	a0,-80(s0)
    8000255e:	00000097          	auipc	ra,0x0
    80002562:	aba080e7          	jalr	-1350(ra) # 80002018 <uvmunmap>
  return -1;
    80002566:	57fd                	li	a5,-1
}
    80002568:	853e                	mv	a0,a5
    8000256a:	60e6                	ld	ra,88(sp)
    8000256c:	6446                	ld	s0,80(sp)
    8000256e:	6125                	addi	sp,sp,96
    80002570:	8082                	ret

0000000080002572 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002572:	7179                	addi	sp,sp,-48
    80002574:	f406                	sd	ra,40(sp)
    80002576:	f022                	sd	s0,32(sp)
    80002578:	1800                	addi	s0,sp,48
    8000257a:	fca43c23          	sd	a0,-40(s0)
    8000257e:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    80002582:	4601                	li	a2,0
    80002584:	fd043583          	ld	a1,-48(s0)
    80002588:	fd843503          	ld	a0,-40(s0)
    8000258c:	fffff097          	auipc	ra,0xfffff
    80002590:	7f6080e7          	jalr	2038(ra) # 80001d82 <walk>
    80002594:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80002598:	fe843783          	ld	a5,-24(s0)
    8000259c:	eb89                	bnez	a5,800025ae <uvmclear+0x3c>
    panic("uvmclear");
    8000259e:	00009517          	auipc	a0,0x9
    800025a2:	c2a50513          	addi	a0,a0,-982 # 8000b1c8 <etext+0x1c8>
    800025a6:	ffffe097          	auipc	ra,0xffffe
    800025aa:	6e2080e7          	jalr	1762(ra) # 80000c88 <panic>
  *pte &= ~PTE_U;
    800025ae:	fe843783          	ld	a5,-24(s0)
    800025b2:	639c                	ld	a5,0(a5)
    800025b4:	fef7f713          	andi	a4,a5,-17
    800025b8:	fe843783          	ld	a5,-24(s0)
    800025bc:	e398                	sd	a4,0(a5)
}
    800025be:	0001                	nop
    800025c0:	70a2                	ld	ra,40(sp)
    800025c2:	7402                	ld	s0,32(sp)
    800025c4:	6145                	addi	sp,sp,48
    800025c6:	8082                	ret

00000000800025c8 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800025c8:	715d                	addi	sp,sp,-80
    800025ca:	e486                	sd	ra,72(sp)
    800025cc:	e0a2                	sd	s0,64(sp)
    800025ce:	0880                	addi	s0,sp,80
    800025d0:	fca43423          	sd	a0,-56(s0)
    800025d4:	fcb43023          	sd	a1,-64(s0)
    800025d8:	fac43c23          	sd	a2,-72(s0)
    800025dc:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800025e0:	a055                	j	80002684 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    800025e2:	fc043703          	ld	a4,-64(s0)
    800025e6:	77fd                	lui	a5,0xfffff
    800025e8:	8ff9                	and	a5,a5,a4
    800025ea:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800025ee:	fe043583          	ld	a1,-32(s0)
    800025f2:	fc843503          	ld	a0,-56(s0)
    800025f6:	00000097          	auipc	ra,0x0
    800025fa:	872080e7          	jalr	-1934(ra) # 80001e68 <walkaddr>
    800025fe:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002602:	fd843783          	ld	a5,-40(s0)
    80002606:	e399                	bnez	a5,8000260c <copyout+0x44>
      return -1;
    80002608:	57fd                	li	a5,-1
    8000260a:	a049                	j	8000268c <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    8000260c:	fe043703          	ld	a4,-32(s0)
    80002610:	fc043783          	ld	a5,-64(s0)
    80002614:	8f1d                	sub	a4,a4,a5
    80002616:	6785                	lui	a5,0x1
    80002618:	97ba                	add	a5,a5,a4
    8000261a:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000261e:	fe843703          	ld	a4,-24(s0)
    80002622:	fb043783          	ld	a5,-80(s0)
    80002626:	00e7f663          	bgeu	a5,a4,80002632 <copyout+0x6a>
      n = len;
    8000262a:	fb043783          	ld	a5,-80(s0)
    8000262e:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80002632:	fc043703          	ld	a4,-64(s0)
    80002636:	fe043783          	ld	a5,-32(s0)
    8000263a:	8f1d                	sub	a4,a4,a5
    8000263c:	fd843783          	ld	a5,-40(s0)
    80002640:	97ba                	add	a5,a5,a4
    80002642:	873e                	mv	a4,a5
    80002644:	fe843783          	ld	a5,-24(s0)
    80002648:	2781                	sext.w	a5,a5
    8000264a:	863e                	mv	a2,a5
    8000264c:	fb843583          	ld	a1,-72(s0)
    80002650:	853a                	mv	a0,a4
    80002652:	fffff097          	auipc	ra,0xfffff
    80002656:	f96080e7          	jalr	-106(ra) # 800015e8 <memmove>

    len -= n;
    8000265a:	fb043703          	ld	a4,-80(s0)
    8000265e:	fe843783          	ld	a5,-24(s0)
    80002662:	40f707b3          	sub	a5,a4,a5
    80002666:	faf43823          	sd	a5,-80(s0)
    src += n;
    8000266a:	fb843703          	ld	a4,-72(s0)
    8000266e:	fe843783          	ld	a5,-24(s0)
    80002672:	97ba                	add	a5,a5,a4
    80002674:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002678:	fe043703          	ld	a4,-32(s0)
    8000267c:	6785                	lui	a5,0x1
    8000267e:	97ba                	add	a5,a5,a4
    80002680:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    80002684:	fb043783          	ld	a5,-80(s0)
    80002688:	ffa9                	bnez	a5,800025e2 <copyout+0x1a>
  }
  return 0;
    8000268a:	4781                	li	a5,0
}
    8000268c:	853e                	mv	a0,a5
    8000268e:	60a6                	ld	ra,72(sp)
    80002690:	6406                	ld	s0,64(sp)
    80002692:	6161                	addi	sp,sp,80
    80002694:	8082                	ret

0000000080002696 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    80002696:	715d                	addi	sp,sp,-80
    80002698:	e486                	sd	ra,72(sp)
    8000269a:	e0a2                	sd	s0,64(sp)
    8000269c:	0880                	addi	s0,sp,80
    8000269e:	fca43423          	sd	a0,-56(s0)
    800026a2:	fcb43023          	sd	a1,-64(s0)
    800026a6:	fac43c23          	sd	a2,-72(s0)
    800026aa:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800026ae:	a055                	j	80002752 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800026b0:	fb843703          	ld	a4,-72(s0)
    800026b4:	77fd                	lui	a5,0xfffff
    800026b6:	8ff9                	and	a5,a5,a4
    800026b8:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800026bc:	fe043583          	ld	a1,-32(s0)
    800026c0:	fc843503          	ld	a0,-56(s0)
    800026c4:	fffff097          	auipc	ra,0xfffff
    800026c8:	7a4080e7          	jalr	1956(ra) # 80001e68 <walkaddr>
    800026cc:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800026d0:	fd843783          	ld	a5,-40(s0)
    800026d4:	e399                	bnez	a5,800026da <copyin+0x44>
      return -1;
    800026d6:	57fd                	li	a5,-1
    800026d8:	a049                	j	8000275a <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800026da:	fe043703          	ld	a4,-32(s0)
    800026de:	fb843783          	ld	a5,-72(s0)
    800026e2:	8f1d                	sub	a4,a4,a5
    800026e4:	6785                	lui	a5,0x1
    800026e6:	97ba                	add	a5,a5,a4
    800026e8:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800026ec:	fe843703          	ld	a4,-24(s0)
    800026f0:	fb043783          	ld	a5,-80(s0)
    800026f4:	00e7f663          	bgeu	a5,a4,80002700 <copyin+0x6a>
      n = len;
    800026f8:	fb043783          	ld	a5,-80(s0)
    800026fc:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80002700:	fb843703          	ld	a4,-72(s0)
    80002704:	fe043783          	ld	a5,-32(s0)
    80002708:	8f1d                	sub	a4,a4,a5
    8000270a:	fd843783          	ld	a5,-40(s0)
    8000270e:	97ba                	add	a5,a5,a4
    80002710:	873e                	mv	a4,a5
    80002712:	fe843783          	ld	a5,-24(s0)
    80002716:	2781                	sext.w	a5,a5
    80002718:	863e                	mv	a2,a5
    8000271a:	85ba                	mv	a1,a4
    8000271c:	fc043503          	ld	a0,-64(s0)
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	ec8080e7          	jalr	-312(ra) # 800015e8 <memmove>

    len -= n;
    80002728:	fb043703          	ld	a4,-80(s0)
    8000272c:	fe843783          	ld	a5,-24(s0)
    80002730:	40f707b3          	sub	a5,a4,a5
    80002734:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002738:	fc043703          	ld	a4,-64(s0)
    8000273c:	fe843783          	ld	a5,-24(s0)
    80002740:	97ba                	add	a5,a5,a4
    80002742:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002746:	fe043703          	ld	a4,-32(s0)
    8000274a:	6785                	lui	a5,0x1
    8000274c:	97ba                	add	a5,a5,a4
    8000274e:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002752:	fb043783          	ld	a5,-80(s0)
    80002756:	ffa9                	bnez	a5,800026b0 <copyin+0x1a>
  }
  return 0;
    80002758:	4781                	li	a5,0
}
    8000275a:	853e                	mv	a0,a5
    8000275c:	60a6                	ld	ra,72(sp)
    8000275e:	6406                	ld	s0,64(sp)
    80002760:	6161                	addi	sp,sp,80
    80002762:	8082                	ret

0000000080002764 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002764:	711d                	addi	sp,sp,-96
    80002766:	ec86                	sd	ra,88(sp)
    80002768:	e8a2                	sd	s0,80(sp)
    8000276a:	1080                	addi	s0,sp,96
    8000276c:	faa43c23          	sd	a0,-72(s0)
    80002770:	fab43823          	sd	a1,-80(s0)
    80002774:	fac43423          	sd	a2,-88(s0)
    80002778:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    8000277c:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    80002780:	a0f1                	j	8000284c <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    80002782:	fa843703          	ld	a4,-88(s0)
    80002786:	77fd                	lui	a5,0xfffff
    80002788:	8ff9                	and	a5,a5,a4
    8000278a:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    8000278e:	fd043583          	ld	a1,-48(s0)
    80002792:	fb843503          	ld	a0,-72(s0)
    80002796:	fffff097          	auipc	ra,0xfffff
    8000279a:	6d2080e7          	jalr	1746(ra) # 80001e68 <walkaddr>
    8000279e:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800027a2:	fc843783          	ld	a5,-56(s0)
    800027a6:	e399                	bnez	a5,800027ac <copyinstr+0x48>
      return -1;
    800027a8:	57fd                	li	a5,-1
    800027aa:	a87d                	j	80002868 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800027ac:	fd043703          	ld	a4,-48(s0)
    800027b0:	fa843783          	ld	a5,-88(s0)
    800027b4:	8f1d                	sub	a4,a4,a5
    800027b6:	6785                	lui	a5,0x1
    800027b8:	97ba                	add	a5,a5,a4
    800027ba:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800027be:	fe843703          	ld	a4,-24(s0)
    800027c2:	fa043783          	ld	a5,-96(s0)
    800027c6:	00e7f663          	bgeu	a5,a4,800027d2 <copyinstr+0x6e>
      n = max;
    800027ca:	fa043783          	ld	a5,-96(s0)
    800027ce:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800027d2:	fa843703          	ld	a4,-88(s0)
    800027d6:	fd043783          	ld	a5,-48(s0)
    800027da:	8f1d                	sub	a4,a4,a5
    800027dc:	fc843783          	ld	a5,-56(s0)
    800027e0:	97ba                	add	a5,a5,a4
    800027e2:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    800027e6:	a891                	j	8000283a <copyinstr+0xd6>
      if(*p == '\0'){
    800027e8:	fd843783          	ld	a5,-40(s0)
    800027ec:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    800027f0:	eb89                	bnez	a5,80002802 <copyinstr+0x9e>
        *dst = '\0';
    800027f2:	fb043783          	ld	a5,-80(s0)
    800027f6:	00078023          	sb	zero,0(a5)
        got_null = 1;
    800027fa:	4785                	li	a5,1
    800027fc:	fef42223          	sw	a5,-28(s0)
        break;
    80002800:	a081                	j	80002840 <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002802:	fd843783          	ld	a5,-40(s0)
    80002806:	0007c703          	lbu	a4,0(a5)
    8000280a:	fb043783          	ld	a5,-80(s0)
    8000280e:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002812:	fe843783          	ld	a5,-24(s0)
    80002816:	17fd                	addi	a5,a5,-1
    80002818:	fef43423          	sd	a5,-24(s0)
      --max;
    8000281c:	fa043783          	ld	a5,-96(s0)
    80002820:	17fd                	addi	a5,a5,-1
    80002822:	faf43023          	sd	a5,-96(s0)
      p++;
    80002826:	fd843783          	ld	a5,-40(s0)
    8000282a:	0785                	addi	a5,a5,1
    8000282c:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    80002830:	fb043783          	ld	a5,-80(s0)
    80002834:	0785                	addi	a5,a5,1
    80002836:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    8000283a:	fe843783          	ld	a5,-24(s0)
    8000283e:	f7cd                	bnez	a5,800027e8 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    80002840:	fd043703          	ld	a4,-48(s0)
    80002844:	6785                	lui	a5,0x1
    80002846:	97ba                	add	a5,a5,a4
    80002848:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    8000284c:	fe442783          	lw	a5,-28(s0)
    80002850:	2781                	sext.w	a5,a5
    80002852:	e781                	bnez	a5,8000285a <copyinstr+0xf6>
    80002854:	fa043783          	ld	a5,-96(s0)
    80002858:	f78d                	bnez	a5,80002782 <copyinstr+0x1e>
  }
  if(got_null){
    8000285a:	fe442783          	lw	a5,-28(s0)
    8000285e:	2781                	sext.w	a5,a5
    80002860:	c399                	beqz	a5,80002866 <copyinstr+0x102>
    return 0;
    80002862:	4781                	li	a5,0
    80002864:	a011                	j	80002868 <copyinstr+0x104>
  } else {
    return -1;
    80002866:	57fd                	li	a5,-1
  }
}
    80002868:	853e                	mv	a0,a5
    8000286a:	60e6                	ld	ra,88(sp)
    8000286c:	6446                	ld	s0,80(sp)
    8000286e:	6125                	addi	sp,sp,96
    80002870:	8082                	ret

0000000080002872 <r_sstatus>:
{
    80002872:	1101                	addi	sp,sp,-32
    80002874:	ec22                	sd	s0,24(sp)
    80002876:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002878:	100027f3          	csrr	a5,sstatus
    8000287c:	fef43423          	sd	a5,-24(s0)
  return x;
    80002880:	fe843783          	ld	a5,-24(s0)
}
    80002884:	853e                	mv	a0,a5
    80002886:	6462                	ld	s0,24(sp)
    80002888:	6105                	addi	sp,sp,32
    8000288a:	8082                	ret

000000008000288c <w_sstatus>:
{
    8000288c:	1101                	addi	sp,sp,-32
    8000288e:	ec22                	sd	s0,24(sp)
    80002890:	1000                	addi	s0,sp,32
    80002892:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80002896:	fe843783          	ld	a5,-24(s0)
    8000289a:	10079073          	csrw	sstatus,a5
}
    8000289e:	0001                	nop
    800028a0:	6462                	ld	s0,24(sp)
    800028a2:	6105                	addi	sp,sp,32
    800028a4:	8082                	ret

00000000800028a6 <intr_on>:
{
    800028a6:	1141                	addi	sp,sp,-16
    800028a8:	e406                	sd	ra,8(sp)
    800028aa:	e022                	sd	s0,0(sp)
    800028ac:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800028ae:	00000097          	auipc	ra,0x0
    800028b2:	fc4080e7          	jalr	-60(ra) # 80002872 <r_sstatus>
    800028b6:	87aa                	mv	a5,a0
    800028b8:	0027e793          	ori	a5,a5,2
    800028bc:	853e                	mv	a0,a5
    800028be:	00000097          	auipc	ra,0x0
    800028c2:	fce080e7          	jalr	-50(ra) # 8000288c <w_sstatus>
}
    800028c6:	0001                	nop
    800028c8:	60a2                	ld	ra,8(sp)
    800028ca:	6402                	ld	s0,0(sp)
    800028cc:	0141                	addi	sp,sp,16
    800028ce:	8082                	ret

00000000800028d0 <intr_get>:
{
    800028d0:	1101                	addi	sp,sp,-32
    800028d2:	ec06                	sd	ra,24(sp)
    800028d4:	e822                	sd	s0,16(sp)
    800028d6:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800028d8:	00000097          	auipc	ra,0x0
    800028dc:	f9a080e7          	jalr	-102(ra) # 80002872 <r_sstatus>
    800028e0:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800028e4:	fe843783          	ld	a5,-24(s0)
    800028e8:	8b89                	andi	a5,a5,2
    800028ea:	00f037b3          	snez	a5,a5
    800028ee:	0ff7f793          	zext.b	a5,a5
    800028f2:	2781                	sext.w	a5,a5
}
    800028f4:	853e                	mv	a0,a5
    800028f6:	60e2                	ld	ra,24(sp)
    800028f8:	6442                	ld	s0,16(sp)
    800028fa:	6105                	addi	sp,sp,32
    800028fc:	8082                	ret

00000000800028fe <r_tp>:
{
    800028fe:	1101                	addi	sp,sp,-32
    80002900:	ec22                	sd	s0,24(sp)
    80002902:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002904:	8792                	mv	a5,tp
    80002906:	fef43423          	sd	a5,-24(s0)
  return x;
    8000290a:	fe843783          	ld	a5,-24(s0)
}
    8000290e:	853e                	mv	a0,a5
    80002910:	6462                	ld	s0,24(sp)
    80002912:	6105                	addi	sp,sp,32
    80002914:	8082                	ret

0000000080002916 <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    80002916:	7139                	addi	sp,sp,-64
    80002918:	fc06                	sd	ra,56(sp)
    8000291a:	f822                	sd	s0,48(sp)
    8000291c:	0080                	addi	s0,sp,64
    8000291e:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002922:	00014797          	auipc	a5,0x14
    80002926:	d4678793          	addi	a5,a5,-698 # 80016668 <proc>
    8000292a:	fef43423          	sd	a5,-24(s0)
    8000292e:	a061                	j	800029b6 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    80002930:	fffff097          	auipc	ra,0xfffff
    80002934:	8ac080e7          	jalr	-1876(ra) # 800011dc <kalloc>
    80002938:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000293c:	fe043783          	ld	a5,-32(s0)
    80002940:	eb89                	bnez	a5,80002952 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002942:	00009517          	auipc	a0,0x9
    80002946:	89650513          	addi	a0,a0,-1898 # 8000b1d8 <etext+0x1d8>
    8000294a:	ffffe097          	auipc	ra,0xffffe
    8000294e:	33e080e7          	jalr	830(ra) # 80000c88 <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002952:	fe843703          	ld	a4,-24(s0)
    80002956:	00014797          	auipc	a5,0x14
    8000295a:	d1278793          	addi	a5,a5,-750 # 80016668 <proc>
    8000295e:	40f707b3          	sub	a5,a4,a5
    80002962:	4037d713          	srai	a4,a5,0x3
    80002966:	00009797          	auipc	a5,0x9
    8000296a:	96a78793          	addi	a5,a5,-1686 # 8000b2d0 <etext+0x2d0>
    8000296e:	639c                	ld	a5,0(a5)
    80002970:	02f707b3          	mul	a5,a4,a5
    80002974:	2781                	sext.w	a5,a5
    80002976:	2785                	addiw	a5,a5,1
    80002978:	2781                	sext.w	a5,a5
    8000297a:	00d7979b          	slliw	a5,a5,0xd
    8000297e:	2781                	sext.w	a5,a5
    80002980:	873e                	mv	a4,a5
    80002982:	040007b7          	lui	a5,0x4000
    80002986:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002988:	07b2                	slli	a5,a5,0xc
    8000298a:	8f99                	sub	a5,a5,a4
    8000298c:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    80002990:	fe043783          	ld	a5,-32(s0)
    80002994:	4719                	li	a4,6
    80002996:	6685                	lui	a3,0x1
    80002998:	863e                	mv	a2,a5
    8000299a:	fd843583          	ld	a1,-40(s0)
    8000299e:	fc843503          	ld	a0,-56(s0)
    800029a2:	fffff097          	auipc	ra,0xfffff
    800029a6:	53e080e7          	jalr	1342(ra) # 80001ee0 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800029aa:	fe843783          	ld	a5,-24(s0)
    800029ae:	16878793          	addi	a5,a5,360
    800029b2:	fef43423          	sd	a5,-24(s0)
    800029b6:	fe843703          	ld	a4,-24(s0)
    800029ba:	00019797          	auipc	a5,0x19
    800029be:	6ae78793          	addi	a5,a5,1710 # 8001c068 <pid_lock>
    800029c2:	f6f767e3          	bltu	a4,a5,80002930 <proc_mapstacks+0x1a>
  }
}
    800029c6:	0001                	nop
    800029c8:	0001                	nop
    800029ca:	70e2                	ld	ra,56(sp)
    800029cc:	7442                	ld	s0,48(sp)
    800029ce:	6121                	addi	sp,sp,64
    800029d0:	8082                	ret

00000000800029d2 <procinit>:

// initialize the proc table.
void
procinit(void)
{
    800029d2:	1101                	addi	sp,sp,-32
    800029d4:	ec06                	sd	ra,24(sp)
    800029d6:	e822                	sd	s0,16(sp)
    800029d8:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800029da:	00009597          	auipc	a1,0x9
    800029de:	80658593          	addi	a1,a1,-2042 # 8000b1e0 <etext+0x1e0>
    800029e2:	00019517          	auipc	a0,0x19
    800029e6:	68650513          	addi	a0,a0,1670 # 8001c068 <pid_lock>
    800029ea:	fffff097          	auipc	ra,0xfffff
    800029ee:	916080e7          	jalr	-1770(ra) # 80001300 <initlock>
  initlock(&wait_lock, "wait_lock");
    800029f2:	00008597          	auipc	a1,0x8
    800029f6:	7f658593          	addi	a1,a1,2038 # 8000b1e8 <etext+0x1e8>
    800029fa:	00019517          	auipc	a0,0x19
    800029fe:	68650513          	addi	a0,a0,1670 # 8001c080 <wait_lock>
    80002a02:	fffff097          	auipc	ra,0xfffff
    80002a06:	8fe080e7          	jalr	-1794(ra) # 80001300 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002a0a:	00014797          	auipc	a5,0x14
    80002a0e:	c5e78793          	addi	a5,a5,-930 # 80016668 <proc>
    80002a12:	fef43423          	sd	a5,-24(s0)
    80002a16:	a0bd                	j	80002a84 <procinit+0xb2>
      initlock(&p->lock, "proc");
    80002a18:	fe843783          	ld	a5,-24(s0)
    80002a1c:	00008597          	auipc	a1,0x8
    80002a20:	7dc58593          	addi	a1,a1,2012 # 8000b1f8 <etext+0x1f8>
    80002a24:	853e                	mv	a0,a5
    80002a26:	fffff097          	auipc	ra,0xfffff
    80002a2a:	8da080e7          	jalr	-1830(ra) # 80001300 <initlock>
      p->state = UNUSED;
    80002a2e:	fe843783          	ld	a5,-24(s0)
    80002a32:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    80002a36:	fe843703          	ld	a4,-24(s0)
    80002a3a:	00014797          	auipc	a5,0x14
    80002a3e:	c2e78793          	addi	a5,a5,-978 # 80016668 <proc>
    80002a42:	40f707b3          	sub	a5,a4,a5
    80002a46:	4037d713          	srai	a4,a5,0x3
    80002a4a:	00009797          	auipc	a5,0x9
    80002a4e:	88678793          	addi	a5,a5,-1914 # 8000b2d0 <etext+0x2d0>
    80002a52:	639c                	ld	a5,0(a5)
    80002a54:	02f707b3          	mul	a5,a4,a5
    80002a58:	2781                	sext.w	a5,a5
    80002a5a:	2785                	addiw	a5,a5,1
    80002a5c:	2781                	sext.w	a5,a5
    80002a5e:	00d7979b          	slliw	a5,a5,0xd
    80002a62:	2781                	sext.w	a5,a5
    80002a64:	873e                	mv	a4,a5
    80002a66:	040007b7          	lui	a5,0x4000
    80002a6a:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002a6c:	07b2                	slli	a5,a5,0xc
    80002a6e:	8f99                	sub	a5,a5,a4
    80002a70:	873e                	mv	a4,a5
    80002a72:	fe843783          	ld	a5,-24(s0)
    80002a76:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002a78:	fe843783          	ld	a5,-24(s0)
    80002a7c:	16878793          	addi	a5,a5,360
    80002a80:	fef43423          	sd	a5,-24(s0)
    80002a84:	fe843703          	ld	a4,-24(s0)
    80002a88:	00019797          	auipc	a5,0x19
    80002a8c:	5e078793          	addi	a5,a5,1504 # 8001c068 <pid_lock>
    80002a90:	f8f764e3          	bltu	a4,a5,80002a18 <procinit+0x46>
  }
}
    80002a94:	0001                	nop
    80002a96:	0001                	nop
    80002a98:	60e2                	ld	ra,24(sp)
    80002a9a:	6442                	ld	s0,16(sp)
    80002a9c:	6105                	addi	sp,sp,32
    80002a9e:	8082                	ret

0000000080002aa0 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    80002aa0:	1101                	addi	sp,sp,-32
    80002aa2:	ec06                	sd	ra,24(sp)
    80002aa4:	e822                	sd	s0,16(sp)
    80002aa6:	1000                	addi	s0,sp,32
  int id = r_tp();
    80002aa8:	00000097          	auipc	ra,0x0
    80002aac:	e56080e7          	jalr	-426(ra) # 800028fe <r_tp>
    80002ab0:	87aa                	mv	a5,a0
    80002ab2:	fef42623          	sw	a5,-20(s0)
  return id;
    80002ab6:	fec42783          	lw	a5,-20(s0)
}
    80002aba:	853e                	mv	a0,a5
    80002abc:	60e2                	ld	ra,24(sp)
    80002abe:	6442                	ld	s0,16(sp)
    80002ac0:	6105                	addi	sp,sp,32
    80002ac2:	8082                	ret

0000000080002ac4 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    80002ac4:	1101                	addi	sp,sp,-32
    80002ac6:	ec06                	sd	ra,24(sp)
    80002ac8:	e822                	sd	s0,16(sp)
    80002aca:	1000                	addi	s0,sp,32
  int id = cpuid();
    80002acc:	00000097          	auipc	ra,0x0
    80002ad0:	fd4080e7          	jalr	-44(ra) # 80002aa0 <cpuid>
    80002ad4:	87aa                	mv	a5,a0
    80002ad6:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002ada:	fec42783          	lw	a5,-20(s0)
    80002ade:	00779713          	slli	a4,a5,0x7
    80002ae2:	00013797          	auipc	a5,0x13
    80002ae6:	78678793          	addi	a5,a5,1926 # 80016268 <cpus>
    80002aea:	97ba                	add	a5,a5,a4
    80002aec:	fef43023          	sd	a5,-32(s0)
  return c;
    80002af0:	fe043783          	ld	a5,-32(s0)
}
    80002af4:	853e                	mv	a0,a5
    80002af6:	60e2                	ld	ra,24(sp)
    80002af8:	6442                	ld	s0,16(sp)
    80002afa:	6105                	addi	sp,sp,32
    80002afc:	8082                	ret

0000000080002afe <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002afe:	1101                	addi	sp,sp,-32
    80002b00:	ec06                	sd	ra,24(sp)
    80002b02:	e822                	sd	s0,16(sp)
    80002b04:	1000                	addi	s0,sp,32
  push_off();
    80002b06:	fffff097          	auipc	ra,0xfffff
    80002b0a:	928080e7          	jalr	-1752(ra) # 8000142e <push_off>
  struct cpu *c = mycpu();
    80002b0e:	00000097          	auipc	ra,0x0
    80002b12:	fb6080e7          	jalr	-74(ra) # 80002ac4 <mycpu>
    80002b16:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002b1a:	fe843783          	ld	a5,-24(s0)
    80002b1e:	639c                	ld	a5,0(a5)
    80002b20:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002b24:	fffff097          	auipc	ra,0xfffff
    80002b28:	962080e7          	jalr	-1694(ra) # 80001486 <pop_off>
  return p;
    80002b2c:	fe043783          	ld	a5,-32(s0)
}
    80002b30:	853e                	mv	a0,a5
    80002b32:	60e2                	ld	ra,24(sp)
    80002b34:	6442                	ld	s0,16(sp)
    80002b36:	6105                	addi	sp,sp,32
    80002b38:	8082                	ret

0000000080002b3a <allocpid>:

int
allocpid()
{
    80002b3a:	1101                	addi	sp,sp,-32
    80002b3c:	ec06                	sd	ra,24(sp)
    80002b3e:	e822                	sd	s0,16(sp)
    80002b40:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002b42:	00019517          	auipc	a0,0x19
    80002b46:	52650513          	addi	a0,a0,1318 # 8001c068 <pid_lock>
    80002b4a:	ffffe097          	auipc	ra,0xffffe
    80002b4e:	7e6080e7          	jalr	2022(ra) # 80001330 <acquire>
  pid = nextpid;
    80002b52:	0000b797          	auipc	a5,0xb
    80002b56:	2ee78793          	addi	a5,a5,750 # 8000de40 <nextpid>
    80002b5a:	439c                	lw	a5,0(a5)
    80002b5c:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002b60:	0000b797          	auipc	a5,0xb
    80002b64:	2e078793          	addi	a5,a5,736 # 8000de40 <nextpid>
    80002b68:	439c                	lw	a5,0(a5)
    80002b6a:	2785                	addiw	a5,a5,1
    80002b6c:	0007871b          	sext.w	a4,a5
    80002b70:	0000b797          	auipc	a5,0xb
    80002b74:	2d078793          	addi	a5,a5,720 # 8000de40 <nextpid>
    80002b78:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002b7a:	00019517          	auipc	a0,0x19
    80002b7e:	4ee50513          	addi	a0,a0,1262 # 8001c068 <pid_lock>
    80002b82:	fffff097          	auipc	ra,0xfffff
    80002b86:	812080e7          	jalr	-2030(ra) # 80001394 <release>

  return pid;
    80002b8a:	fec42783          	lw	a5,-20(s0)
}
    80002b8e:	853e                	mv	a0,a5
    80002b90:	60e2                	ld	ra,24(sp)
    80002b92:	6442                	ld	s0,16(sp)
    80002b94:	6105                	addi	sp,sp,32
    80002b96:	8082                	ret

0000000080002b98 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002b98:	1101                	addi	sp,sp,-32
    80002b9a:	ec06                	sd	ra,24(sp)
    80002b9c:	e822                	sd	s0,16(sp)
    80002b9e:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002ba0:	00014797          	auipc	a5,0x14
    80002ba4:	ac878793          	addi	a5,a5,-1336 # 80016668 <proc>
    80002ba8:	fef43423          	sd	a5,-24(s0)
    80002bac:	a80d                	j	80002bde <allocproc+0x46>
    acquire(&p->lock);
    80002bae:	fe843783          	ld	a5,-24(s0)
    80002bb2:	853e                	mv	a0,a5
    80002bb4:	ffffe097          	auipc	ra,0xffffe
    80002bb8:	77c080e7          	jalr	1916(ra) # 80001330 <acquire>
    if(p->state == UNUSED) {
    80002bbc:	fe843783          	ld	a5,-24(s0)
    80002bc0:	4f9c                	lw	a5,24(a5)
    80002bc2:	cb85                	beqz	a5,80002bf2 <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002bc4:	fe843783          	ld	a5,-24(s0)
    80002bc8:	853e                	mv	a0,a5
    80002bca:	ffffe097          	auipc	ra,0xffffe
    80002bce:	7ca080e7          	jalr	1994(ra) # 80001394 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002bd2:	fe843783          	ld	a5,-24(s0)
    80002bd6:	16878793          	addi	a5,a5,360
    80002bda:	fef43423          	sd	a5,-24(s0)
    80002bde:	fe843703          	ld	a4,-24(s0)
    80002be2:	00019797          	auipc	a5,0x19
    80002be6:	48678793          	addi	a5,a5,1158 # 8001c068 <pid_lock>
    80002bea:	fcf762e3          	bltu	a4,a5,80002bae <allocproc+0x16>
    }
  }
  return 0;
    80002bee:	4781                	li	a5,0
    80002bf0:	a0e1                	j	80002cb8 <allocproc+0x120>
      goto found;
    80002bf2:	0001                	nop

found:
  p->pid = allocpid();
    80002bf4:	00000097          	auipc	ra,0x0
    80002bf8:	f46080e7          	jalr	-186(ra) # 80002b3a <allocpid>
    80002bfc:	87aa                	mv	a5,a0
    80002bfe:	873e                	mv	a4,a5
    80002c00:	fe843783          	ld	a5,-24(s0)
    80002c04:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002c06:	fe843783          	ld	a5,-24(s0)
    80002c0a:	4705                	li	a4,1
    80002c0c:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002c0e:	ffffe097          	auipc	ra,0xffffe
    80002c12:	5ce080e7          	jalr	1486(ra) # 800011dc <kalloc>
    80002c16:	872a                	mv	a4,a0
    80002c18:	fe843783          	ld	a5,-24(s0)
    80002c1c:	efb8                	sd	a4,88(a5)
    80002c1e:	fe843783          	ld	a5,-24(s0)
    80002c22:	6fbc                	ld	a5,88(a5)
    80002c24:	e385                	bnez	a5,80002c44 <allocproc+0xac>
    freeproc(p);
    80002c26:	fe843503          	ld	a0,-24(s0)
    80002c2a:	00000097          	auipc	ra,0x0
    80002c2e:	098080e7          	jalr	152(ra) # 80002cc2 <freeproc>
    release(&p->lock);
    80002c32:	fe843783          	ld	a5,-24(s0)
    80002c36:	853e                	mv	a0,a5
    80002c38:	ffffe097          	auipc	ra,0xffffe
    80002c3c:	75c080e7          	jalr	1884(ra) # 80001394 <release>
    return 0;
    80002c40:	4781                	li	a5,0
    80002c42:	a89d                	j	80002cb8 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002c44:	fe843503          	ld	a0,-24(s0)
    80002c48:	00000097          	auipc	ra,0x0
    80002c4c:	118080e7          	jalr	280(ra) # 80002d60 <proc_pagetable>
    80002c50:	872a                	mv	a4,a0
    80002c52:	fe843783          	ld	a5,-24(s0)
    80002c56:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002c58:	fe843783          	ld	a5,-24(s0)
    80002c5c:	6bbc                	ld	a5,80(a5)
    80002c5e:	e385                	bnez	a5,80002c7e <allocproc+0xe6>
    freeproc(p);
    80002c60:	fe843503          	ld	a0,-24(s0)
    80002c64:	00000097          	auipc	ra,0x0
    80002c68:	05e080e7          	jalr	94(ra) # 80002cc2 <freeproc>
    release(&p->lock);
    80002c6c:	fe843783          	ld	a5,-24(s0)
    80002c70:	853e                	mv	a0,a5
    80002c72:	ffffe097          	auipc	ra,0xffffe
    80002c76:	722080e7          	jalr	1826(ra) # 80001394 <release>
    return 0;
    80002c7a:	4781                	li	a5,0
    80002c7c:	a835                	j	80002cb8 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002c7e:	fe843783          	ld	a5,-24(s0)
    80002c82:	06078793          	addi	a5,a5,96
    80002c86:	07000613          	li	a2,112
    80002c8a:	4581                	li	a1,0
    80002c8c:	853e                	mv	a0,a5
    80002c8e:	fffff097          	auipc	ra,0xfffff
    80002c92:	876080e7          	jalr	-1930(ra) # 80001504 <memset>
  p->context.ra = (uint64)forkret;
    80002c96:	00001717          	auipc	a4,0x1
    80002c9a:	9da70713          	addi	a4,a4,-1574 # 80003670 <forkret>
    80002c9e:	fe843783          	ld	a5,-24(s0)
    80002ca2:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002ca4:	fe843783          	ld	a5,-24(s0)
    80002ca8:	63b8                	ld	a4,64(a5)
    80002caa:	6785                	lui	a5,0x1
    80002cac:	973e                	add	a4,a4,a5
    80002cae:	fe843783          	ld	a5,-24(s0)
    80002cb2:	f7b8                	sd	a4,104(a5)

  return p;
    80002cb4:	fe843783          	ld	a5,-24(s0)
}
    80002cb8:	853e                	mv	a0,a5
    80002cba:	60e2                	ld	ra,24(sp)
    80002cbc:	6442                	ld	s0,16(sp)
    80002cbe:	6105                	addi	sp,sp,32
    80002cc0:	8082                	ret

0000000080002cc2 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002cc2:	1101                	addi	sp,sp,-32
    80002cc4:	ec06                	sd	ra,24(sp)
    80002cc6:	e822                	sd	s0,16(sp)
    80002cc8:	1000                	addi	s0,sp,32
    80002cca:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002cce:	fe843783          	ld	a5,-24(s0)
    80002cd2:	6fbc                	ld	a5,88(a5)
    80002cd4:	cb89                	beqz	a5,80002ce6 <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002cd6:	fe843783          	ld	a5,-24(s0)
    80002cda:	6fbc                	ld	a5,88(a5)
    80002cdc:	853e                	mv	a0,a5
    80002cde:	ffffe097          	auipc	ra,0xffffe
    80002ce2:	458080e7          	jalr	1112(ra) # 80001136 <kfree>
  p->trapframe = 0;
    80002ce6:	fe843783          	ld	a5,-24(s0)
    80002cea:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002cee:	fe843783          	ld	a5,-24(s0)
    80002cf2:	6bbc                	ld	a5,80(a5)
    80002cf4:	cf89                	beqz	a5,80002d0e <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002cf6:	fe843783          	ld	a5,-24(s0)
    80002cfa:	6bb8                	ld	a4,80(a5)
    80002cfc:	fe843783          	ld	a5,-24(s0)
    80002d00:	67bc                	ld	a5,72(a5)
    80002d02:	85be                	mv	a1,a5
    80002d04:	853a                	mv	a0,a4
    80002d06:	00000097          	auipc	ra,0x0
    80002d0a:	11a080e7          	jalr	282(ra) # 80002e20 <proc_freepagetable>
  p->pagetable = 0;
    80002d0e:	fe843783          	ld	a5,-24(s0)
    80002d12:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002d16:	fe843783          	ld	a5,-24(s0)
    80002d1a:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002d1e:	fe843783          	ld	a5,-24(s0)
    80002d22:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002d26:	fe843783          	ld	a5,-24(s0)
    80002d2a:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002d2e:	fe843783          	ld	a5,-24(s0)
    80002d32:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002d36:	fe843783          	ld	a5,-24(s0)
    80002d3a:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002d3e:	fe843783          	ld	a5,-24(s0)
    80002d42:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002d46:	fe843783          	ld	a5,-24(s0)
    80002d4a:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002d4e:	fe843783          	ld	a5,-24(s0)
    80002d52:	0007ac23          	sw	zero,24(a5)
}
    80002d56:	0001                	nop
    80002d58:	60e2                	ld	ra,24(sp)
    80002d5a:	6442                	ld	s0,16(sp)
    80002d5c:	6105                	addi	sp,sp,32
    80002d5e:	8082                	ret

0000000080002d60 <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002d60:	7179                	addi	sp,sp,-48
    80002d62:	f406                	sd	ra,40(sp)
    80002d64:	f022                	sd	s0,32(sp)
    80002d66:	1800                	addi	s0,sp,48
    80002d68:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002d6c:	fffff097          	auipc	ra,0xfffff
    80002d70:	3ac080e7          	jalr	940(ra) # 80002118 <uvmcreate>
    80002d74:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002d78:	fe843783          	ld	a5,-24(s0)
    80002d7c:	e399                	bnez	a5,80002d82 <proc_pagetable+0x22>
    return 0;
    80002d7e:	4781                	li	a5,0
    80002d80:	a859                	j	80002e16 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002d82:	00007797          	auipc	a5,0x7
    80002d86:	27e78793          	addi	a5,a5,638 # 8000a000 <_trampoline>
    80002d8a:	4729                	li	a4,10
    80002d8c:	86be                	mv	a3,a5
    80002d8e:	6605                	lui	a2,0x1
    80002d90:	040007b7          	lui	a5,0x4000
    80002d94:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002d96:	00c79593          	slli	a1,a5,0xc
    80002d9a:	fe843503          	ld	a0,-24(s0)
    80002d9e:	fffff097          	auipc	ra,0xfffff
    80002da2:	19c080e7          	jalr	412(ra) # 80001f3a <mappages>
    80002da6:	87aa                	mv	a5,a0
    80002da8:	0007db63          	bgez	a5,80002dbe <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002dac:	4581                	li	a1,0
    80002dae:	fe843503          	ld	a0,-24(s0)
    80002db2:	fffff097          	auipc	ra,0xfffff
    80002db6:	662080e7          	jalr	1634(ra) # 80002414 <uvmfree>
    return 0;
    80002dba:	4781                	li	a5,0
    80002dbc:	a8a9                	j	80002e16 <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002dbe:	fd843783          	ld	a5,-40(s0)
    80002dc2:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002dc4:	4719                	li	a4,6
    80002dc6:	86be                	mv	a3,a5
    80002dc8:	6605                	lui	a2,0x1
    80002dca:	020007b7          	lui	a5,0x2000
    80002dce:	17fd                	addi	a5,a5,-1 # 1ffffff <_entry-0x7e000001>
    80002dd0:	00d79593          	slli	a1,a5,0xd
    80002dd4:	fe843503          	ld	a0,-24(s0)
    80002dd8:	fffff097          	auipc	ra,0xfffff
    80002ddc:	162080e7          	jalr	354(ra) # 80001f3a <mappages>
    80002de0:	87aa                	mv	a5,a0
    80002de2:	0207d863          	bgez	a5,80002e12 <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002de6:	4681                	li	a3,0
    80002de8:	4605                	li	a2,1
    80002dea:	040007b7          	lui	a5,0x4000
    80002dee:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002df0:	00c79593          	slli	a1,a5,0xc
    80002df4:	fe843503          	ld	a0,-24(s0)
    80002df8:	fffff097          	auipc	ra,0xfffff
    80002dfc:	220080e7          	jalr	544(ra) # 80002018 <uvmunmap>
    uvmfree(pagetable, 0);
    80002e00:	4581                	li	a1,0
    80002e02:	fe843503          	ld	a0,-24(s0)
    80002e06:	fffff097          	auipc	ra,0xfffff
    80002e0a:	60e080e7          	jalr	1550(ra) # 80002414 <uvmfree>
    return 0;
    80002e0e:	4781                	li	a5,0
    80002e10:	a019                	j	80002e16 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002e12:	fe843783          	ld	a5,-24(s0)
}
    80002e16:	853e                	mv	a0,a5
    80002e18:	70a2                	ld	ra,40(sp)
    80002e1a:	7402                	ld	s0,32(sp)
    80002e1c:	6145                	addi	sp,sp,48
    80002e1e:	8082                	ret

0000000080002e20 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002e20:	1101                	addi	sp,sp,-32
    80002e22:	ec06                	sd	ra,24(sp)
    80002e24:	e822                	sd	s0,16(sp)
    80002e26:	1000                	addi	s0,sp,32
    80002e28:	fea43423          	sd	a0,-24(s0)
    80002e2c:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002e30:	4681                	li	a3,0
    80002e32:	4605                	li	a2,1
    80002e34:	040007b7          	lui	a5,0x4000
    80002e38:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80002e3a:	00c79593          	slli	a1,a5,0xc
    80002e3e:	fe843503          	ld	a0,-24(s0)
    80002e42:	fffff097          	auipc	ra,0xfffff
    80002e46:	1d6080e7          	jalr	470(ra) # 80002018 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002e4a:	4681                	li	a3,0
    80002e4c:	4605                	li	a2,1
    80002e4e:	020007b7          	lui	a5,0x2000
    80002e52:	17fd                	addi	a5,a5,-1 # 1ffffff <_entry-0x7e000001>
    80002e54:	00d79593          	slli	a1,a5,0xd
    80002e58:	fe843503          	ld	a0,-24(s0)
    80002e5c:	fffff097          	auipc	ra,0xfffff
    80002e60:	1bc080e7          	jalr	444(ra) # 80002018 <uvmunmap>
  uvmfree(pagetable, sz);
    80002e64:	fe043583          	ld	a1,-32(s0)
    80002e68:	fe843503          	ld	a0,-24(s0)
    80002e6c:	fffff097          	auipc	ra,0xfffff
    80002e70:	5a8080e7          	jalr	1448(ra) # 80002414 <uvmfree>
}
    80002e74:	0001                	nop
    80002e76:	60e2                	ld	ra,24(sp)
    80002e78:	6442                	ld	s0,16(sp)
    80002e7a:	6105                	addi	sp,sp,32
    80002e7c:	8082                	ret

0000000080002e7e <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002e7e:	1101                	addi	sp,sp,-32
    80002e80:	ec06                	sd	ra,24(sp)
    80002e82:	e822                	sd	s0,16(sp)
    80002e84:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002e86:	00000097          	auipc	ra,0x0
    80002e8a:	d12080e7          	jalr	-750(ra) # 80002b98 <allocproc>
    80002e8e:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002e92:	0000b797          	auipc	a5,0xb
    80002e96:	15e78793          	addi	a5,a5,350 # 8000dff0 <initproc>
    80002e9a:	fe843703          	ld	a4,-24(s0)
    80002e9e:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002ea0:	fe843783          	ld	a5,-24(s0)
    80002ea4:	6bbc                	ld	a5,80(a5)
    80002ea6:	03400613          	li	a2,52
    80002eaa:	0000b597          	auipc	a1,0xb
    80002eae:	fd658593          	addi	a1,a1,-42 # 8000de80 <initcode>
    80002eb2:	853e                	mv	a0,a5
    80002eb4:	fffff097          	auipc	ra,0xfffff
    80002eb8:	2a0080e7          	jalr	672(ra) # 80002154 <uvmfirst>
  p->sz = PGSIZE;
    80002ebc:	fe843783          	ld	a5,-24(s0)
    80002ec0:	6705                	lui	a4,0x1
    80002ec2:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002ec4:	fe843783          	ld	a5,-24(s0)
    80002ec8:	6fbc                	ld	a5,88(a5)
    80002eca:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002ece:	fe843783          	ld	a5,-24(s0)
    80002ed2:	6fbc                	ld	a5,88(a5)
    80002ed4:	6705                	lui	a4,0x1
    80002ed6:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002ed8:	fe843783          	ld	a5,-24(s0)
    80002edc:	15878793          	addi	a5,a5,344
    80002ee0:	4641                	li	a2,16
    80002ee2:	00008597          	auipc	a1,0x8
    80002ee6:	31e58593          	addi	a1,a1,798 # 8000b200 <etext+0x200>
    80002eea:	853e                	mv	a0,a5
    80002eec:	fffff097          	auipc	ra,0xfffff
    80002ef0:	91c080e7          	jalr	-1764(ra) # 80001808 <safestrcpy>
  p->cwd = namei("/");
    80002ef4:	00008517          	auipc	a0,0x8
    80002ef8:	31c50513          	addi	a0,a0,796 # 8000b210 <etext+0x210>
    80002efc:	00003097          	auipc	ra,0x3
    80002f00:	290080e7          	jalr	656(ra) # 8000618c <namei>
    80002f04:	872a                	mv	a4,a0
    80002f06:	fe843783          	ld	a5,-24(s0)
    80002f0a:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002f0e:	fe843783          	ld	a5,-24(s0)
    80002f12:	470d                	li	a4,3
    80002f14:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002f16:	fe843783          	ld	a5,-24(s0)
    80002f1a:	853e                	mv	a0,a5
    80002f1c:	ffffe097          	auipc	ra,0xffffe
    80002f20:	478080e7          	jalr	1144(ra) # 80001394 <release>
}
    80002f24:	0001                	nop
    80002f26:	60e2                	ld	ra,24(sp)
    80002f28:	6442                	ld	s0,16(sp)
    80002f2a:	6105                	addi	sp,sp,32
    80002f2c:	8082                	ret

0000000080002f2e <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002f2e:	7179                	addi	sp,sp,-48
    80002f30:	f406                	sd	ra,40(sp)
    80002f32:	f022                	sd	s0,32(sp)
    80002f34:	1800                	addi	s0,sp,48
    80002f36:	87aa                	mv	a5,a0
    80002f38:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002f3c:	00000097          	auipc	ra,0x0
    80002f40:	bc2080e7          	jalr	-1086(ra) # 80002afe <myproc>
    80002f44:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002f48:	fe043783          	ld	a5,-32(s0)
    80002f4c:	67bc                	ld	a5,72(a5)
    80002f4e:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002f52:	fdc42783          	lw	a5,-36(s0)
    80002f56:	2781                	sext.w	a5,a5
    80002f58:	02f05963          	blez	a5,80002f8a <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002f5c:	fe043783          	ld	a5,-32(s0)
    80002f60:	6ba8                	ld	a0,80(a5)
    80002f62:	fdc42703          	lw	a4,-36(s0)
    80002f66:	fe843783          	ld	a5,-24(s0)
    80002f6a:	97ba                	add	a5,a5,a4
    80002f6c:	4691                	li	a3,4
    80002f6e:	863e                	mv	a2,a5
    80002f70:	fe843583          	ld	a1,-24(s0)
    80002f74:	fffff097          	auipc	ra,0xfffff
    80002f78:	268080e7          	jalr	616(ra) # 800021dc <uvmalloc>
    80002f7c:	fea43423          	sd	a0,-24(s0)
    80002f80:	fe843783          	ld	a5,-24(s0)
    80002f84:	eb95                	bnez	a5,80002fb8 <growproc+0x8a>
      return -1;
    80002f86:	57fd                	li	a5,-1
    80002f88:	a835                	j	80002fc4 <growproc+0x96>
    }
  } else if(n < 0){
    80002f8a:	fdc42783          	lw	a5,-36(s0)
    80002f8e:	2781                	sext.w	a5,a5
    80002f90:	0207d463          	bgez	a5,80002fb8 <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002f94:	fe043783          	ld	a5,-32(s0)
    80002f98:	6bb4                	ld	a3,80(a5)
    80002f9a:	fdc42703          	lw	a4,-36(s0)
    80002f9e:	fe843783          	ld	a5,-24(s0)
    80002fa2:	97ba                	add	a5,a5,a4
    80002fa4:	863e                	mv	a2,a5
    80002fa6:	fe843583          	ld	a1,-24(s0)
    80002faa:	8536                	mv	a0,a3
    80002fac:	fffff097          	auipc	ra,0xfffff
    80002fb0:	322080e7          	jalr	802(ra) # 800022ce <uvmdealloc>
    80002fb4:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80002fb8:	fe043783          	ld	a5,-32(s0)
    80002fbc:	fe843703          	ld	a4,-24(s0)
    80002fc0:	e7b8                	sd	a4,72(a5)
  return 0;
    80002fc2:	4781                	li	a5,0
}
    80002fc4:	853e                	mv	a0,a5
    80002fc6:	70a2                	ld	ra,40(sp)
    80002fc8:	7402                	ld	s0,32(sp)
    80002fca:	6145                	addi	sp,sp,48
    80002fcc:	8082                	ret

0000000080002fce <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002fce:	7179                	addi	sp,sp,-48
    80002fd0:	f406                	sd	ra,40(sp)
    80002fd2:	f022                	sd	s0,32(sp)
    80002fd4:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002fd6:	00000097          	auipc	ra,0x0
    80002fda:	b28080e7          	jalr	-1240(ra) # 80002afe <myproc>
    80002fde:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002fe2:	00000097          	auipc	ra,0x0
    80002fe6:	bb6080e7          	jalr	-1098(ra) # 80002b98 <allocproc>
    80002fea:	fca43c23          	sd	a0,-40(s0)
    80002fee:	fd843783          	ld	a5,-40(s0)
    80002ff2:	e399                	bnez	a5,80002ff8 <fork+0x2a>
    return -1;
    80002ff4:	57fd                	li	a5,-1
    80002ff6:	aab5                	j	80003172 <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002ff8:	fe043783          	ld	a5,-32(s0)
    80002ffc:	6bb8                	ld	a4,80(a5)
    80002ffe:	fd843783          	ld	a5,-40(s0)
    80003002:	6bb4                	ld	a3,80(a5)
    80003004:	fe043783          	ld	a5,-32(s0)
    80003008:	67bc                	ld	a5,72(a5)
    8000300a:	863e                	mv	a2,a5
    8000300c:	85b6                	mv	a1,a3
    8000300e:	853a                	mv	a0,a4
    80003010:	fffff097          	auipc	ra,0xfffff
    80003014:	44e080e7          	jalr	1102(ra) # 8000245e <uvmcopy>
    80003018:	87aa                	mv	a5,a0
    8000301a:	0207d163          	bgez	a5,8000303c <fork+0x6e>
    freeproc(np);
    8000301e:	fd843503          	ld	a0,-40(s0)
    80003022:	00000097          	auipc	ra,0x0
    80003026:	ca0080e7          	jalr	-864(ra) # 80002cc2 <freeproc>
    release(&np->lock);
    8000302a:	fd843783          	ld	a5,-40(s0)
    8000302e:	853e                	mv	a0,a5
    80003030:	ffffe097          	auipc	ra,0xffffe
    80003034:	364080e7          	jalr	868(ra) # 80001394 <release>
    return -1;
    80003038:	57fd                	li	a5,-1
    8000303a:	aa25                	j	80003172 <fork+0x1a4>
  }
  np->sz = p->sz;
    8000303c:	fe043783          	ld	a5,-32(s0)
    80003040:	67b8                	ld	a4,72(a5)
    80003042:	fd843783          	ld	a5,-40(s0)
    80003046:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80003048:	fe043783          	ld	a5,-32(s0)
    8000304c:	6fb8                	ld	a4,88(a5)
    8000304e:	fd843783          	ld	a5,-40(s0)
    80003052:	6fbc                	ld	a5,88(a5)
    80003054:	86be                	mv	a3,a5
    80003056:	12000793          	li	a5,288
    8000305a:	863e                	mv	a2,a5
    8000305c:	85ba                	mv	a1,a4
    8000305e:	8536                	mv	a0,a3
    80003060:	ffffe097          	auipc	ra,0xffffe
    80003064:	664080e7          	jalr	1636(ra) # 800016c4 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80003068:	fd843783          	ld	a5,-40(s0)
    8000306c:	6fbc                	ld	a5,88(a5)
    8000306e:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80003072:	fe042623          	sw	zero,-20(s0)
    80003076:	a0a9                	j	800030c0 <fork+0xf2>
    if(p->ofile[i])
    80003078:	fe043703          	ld	a4,-32(s0)
    8000307c:	fec42783          	lw	a5,-20(s0)
    80003080:	07e9                	addi	a5,a5,26
    80003082:	078e                	slli	a5,a5,0x3
    80003084:	97ba                	add	a5,a5,a4
    80003086:	639c                	ld	a5,0(a5)
    80003088:	c79d                	beqz	a5,800030b6 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    8000308a:	fe043703          	ld	a4,-32(s0)
    8000308e:	fec42783          	lw	a5,-20(s0)
    80003092:	07e9                	addi	a5,a5,26
    80003094:	078e                	slli	a5,a5,0x3
    80003096:	97ba                	add	a5,a5,a4
    80003098:	639c                	ld	a5,0(a5)
    8000309a:	853e                	mv	a0,a5
    8000309c:	00004097          	auipc	ra,0x4
    800030a0:	a88080e7          	jalr	-1400(ra) # 80006b24 <filedup>
    800030a4:	86aa                	mv	a3,a0
    800030a6:	fd843703          	ld	a4,-40(s0)
    800030aa:	fec42783          	lw	a5,-20(s0)
    800030ae:	07e9                	addi	a5,a5,26
    800030b0:	078e                	slli	a5,a5,0x3
    800030b2:	97ba                	add	a5,a5,a4
    800030b4:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    800030b6:	fec42783          	lw	a5,-20(s0)
    800030ba:	2785                	addiw	a5,a5,1
    800030bc:	fef42623          	sw	a5,-20(s0)
    800030c0:	fec42783          	lw	a5,-20(s0)
    800030c4:	0007871b          	sext.w	a4,a5
    800030c8:	47bd                	li	a5,15
    800030ca:	fae7d7e3          	bge	a5,a4,80003078 <fork+0xaa>
  np->cwd = idup(p->cwd);
    800030ce:	fe043783          	ld	a5,-32(s0)
    800030d2:	1507b783          	ld	a5,336(a5)
    800030d6:	853e                	mv	a0,a5
    800030d8:	00002097          	auipc	ra,0x2
    800030dc:	338080e7          	jalr	824(ra) # 80005410 <idup>
    800030e0:	872a                	mv	a4,a0
    800030e2:	fd843783          	ld	a5,-40(s0)
    800030e6:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    800030ea:	fd843783          	ld	a5,-40(s0)
    800030ee:	15878713          	addi	a4,a5,344
    800030f2:	fe043783          	ld	a5,-32(s0)
    800030f6:	15878793          	addi	a5,a5,344
    800030fa:	4641                	li	a2,16
    800030fc:	85be                	mv	a1,a5
    800030fe:	853a                	mv	a0,a4
    80003100:	ffffe097          	auipc	ra,0xffffe
    80003104:	708080e7          	jalr	1800(ra) # 80001808 <safestrcpy>

  pid = np->pid;
    80003108:	fd843783          	ld	a5,-40(s0)
    8000310c:	5b9c                	lw	a5,48(a5)
    8000310e:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80003112:	fd843783          	ld	a5,-40(s0)
    80003116:	853e                	mv	a0,a5
    80003118:	ffffe097          	auipc	ra,0xffffe
    8000311c:	27c080e7          	jalr	636(ra) # 80001394 <release>

  acquire(&wait_lock);
    80003120:	00019517          	auipc	a0,0x19
    80003124:	f6050513          	addi	a0,a0,-160 # 8001c080 <wait_lock>
    80003128:	ffffe097          	auipc	ra,0xffffe
    8000312c:	208080e7          	jalr	520(ra) # 80001330 <acquire>
  np->parent = p;
    80003130:	fd843783          	ld	a5,-40(s0)
    80003134:	fe043703          	ld	a4,-32(s0)
    80003138:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    8000313a:	00019517          	auipc	a0,0x19
    8000313e:	f4650513          	addi	a0,a0,-186 # 8001c080 <wait_lock>
    80003142:	ffffe097          	auipc	ra,0xffffe
    80003146:	252080e7          	jalr	594(ra) # 80001394 <release>

  acquire(&np->lock);
    8000314a:	fd843783          	ld	a5,-40(s0)
    8000314e:	853e                	mv	a0,a5
    80003150:	ffffe097          	auipc	ra,0xffffe
    80003154:	1e0080e7          	jalr	480(ra) # 80001330 <acquire>
  np->state = RUNNABLE;
    80003158:	fd843783          	ld	a5,-40(s0)
    8000315c:	470d                	li	a4,3
    8000315e:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    80003160:	fd843783          	ld	a5,-40(s0)
    80003164:	853e                	mv	a0,a5
    80003166:	ffffe097          	auipc	ra,0xffffe
    8000316a:	22e080e7          	jalr	558(ra) # 80001394 <release>

  return pid;
    8000316e:	fd442783          	lw	a5,-44(s0)
}
    80003172:	853e                	mv	a0,a5
    80003174:	70a2                	ld	ra,40(sp)
    80003176:	7402                	ld	s0,32(sp)
    80003178:	6145                	addi	sp,sp,48
    8000317a:	8082                	ret

000000008000317c <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    8000317c:	7179                	addi	sp,sp,-48
    8000317e:	f406                	sd	ra,40(sp)
    80003180:	f022                	sd	s0,32(sp)
    80003182:	1800                	addi	s0,sp,48
    80003184:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003188:	00013797          	auipc	a5,0x13
    8000318c:	4e078793          	addi	a5,a5,1248 # 80016668 <proc>
    80003190:	fef43423          	sd	a5,-24(s0)
    80003194:	a081                	j	800031d4 <reparent+0x58>
    if(pp->parent == p){
    80003196:	fe843783          	ld	a5,-24(s0)
    8000319a:	7f9c                	ld	a5,56(a5)
    8000319c:	fd843703          	ld	a4,-40(s0)
    800031a0:	02f71463          	bne	a4,a5,800031c8 <reparent+0x4c>
      pp->parent = initproc;
    800031a4:	0000b797          	auipc	a5,0xb
    800031a8:	e4c78793          	addi	a5,a5,-436 # 8000dff0 <initproc>
    800031ac:	6398                	ld	a4,0(a5)
    800031ae:	fe843783          	ld	a5,-24(s0)
    800031b2:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    800031b4:	0000b797          	auipc	a5,0xb
    800031b8:	e3c78793          	addi	a5,a5,-452 # 8000dff0 <initproc>
    800031bc:	639c                	ld	a5,0(a5)
    800031be:	853e                	mv	a0,a5
    800031c0:	00000097          	auipc	ra,0x0
    800031c4:	57c080e7          	jalr	1404(ra) # 8000373c <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    800031c8:	fe843783          	ld	a5,-24(s0)
    800031cc:	16878793          	addi	a5,a5,360
    800031d0:	fef43423          	sd	a5,-24(s0)
    800031d4:	fe843703          	ld	a4,-24(s0)
    800031d8:	00019797          	auipc	a5,0x19
    800031dc:	e9078793          	addi	a5,a5,-368 # 8001c068 <pid_lock>
    800031e0:	faf76be3          	bltu	a4,a5,80003196 <reparent+0x1a>
    }
  }
}
    800031e4:	0001                	nop
    800031e6:	0001                	nop
    800031e8:	70a2                	ld	ra,40(sp)
    800031ea:	7402                	ld	s0,32(sp)
    800031ec:	6145                	addi	sp,sp,48
    800031ee:	8082                	ret

00000000800031f0 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    800031f0:	7139                	addi	sp,sp,-64
    800031f2:	fc06                	sd	ra,56(sp)
    800031f4:	f822                	sd	s0,48(sp)
    800031f6:	0080                	addi	s0,sp,64
    800031f8:	87aa                	mv	a5,a0
    800031fa:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    800031fe:	00000097          	auipc	ra,0x0
    80003202:	900080e7          	jalr	-1792(ra) # 80002afe <myproc>
    80003206:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    8000320a:	0000b797          	auipc	a5,0xb
    8000320e:	de678793          	addi	a5,a5,-538 # 8000dff0 <initproc>
    80003212:	639c                	ld	a5,0(a5)
    80003214:	fe043703          	ld	a4,-32(s0)
    80003218:	00f71a63          	bne	a4,a5,8000322c <exit+0x3c>
    panic("init exiting");
    8000321c:	00008517          	auipc	a0,0x8
    80003220:	ffc50513          	addi	a0,a0,-4 # 8000b218 <etext+0x218>
    80003224:	ffffe097          	auipc	ra,0xffffe
    80003228:	a64080e7          	jalr	-1436(ra) # 80000c88 <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    8000322c:	fe042623          	sw	zero,-20(s0)
    80003230:	a881                	j	80003280 <exit+0x90>
    if(p->ofile[fd]){
    80003232:	fe043703          	ld	a4,-32(s0)
    80003236:	fec42783          	lw	a5,-20(s0)
    8000323a:	07e9                	addi	a5,a5,26
    8000323c:	078e                	slli	a5,a5,0x3
    8000323e:	97ba                	add	a5,a5,a4
    80003240:	639c                	ld	a5,0(a5)
    80003242:	cb95                	beqz	a5,80003276 <exit+0x86>
      struct file *f = p->ofile[fd];
    80003244:	fe043703          	ld	a4,-32(s0)
    80003248:	fec42783          	lw	a5,-20(s0)
    8000324c:	07e9                	addi	a5,a5,26
    8000324e:	078e                	slli	a5,a5,0x3
    80003250:	97ba                	add	a5,a5,a4
    80003252:	639c                	ld	a5,0(a5)
    80003254:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    80003258:	fd843503          	ld	a0,-40(s0)
    8000325c:	00004097          	auipc	ra,0x4
    80003260:	92e080e7          	jalr	-1746(ra) # 80006b8a <fileclose>
      p->ofile[fd] = 0;
    80003264:	fe043703          	ld	a4,-32(s0)
    80003268:	fec42783          	lw	a5,-20(s0)
    8000326c:	07e9                	addi	a5,a5,26
    8000326e:	078e                	slli	a5,a5,0x3
    80003270:	97ba                	add	a5,a5,a4
    80003272:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80003276:	fec42783          	lw	a5,-20(s0)
    8000327a:	2785                	addiw	a5,a5,1
    8000327c:	fef42623          	sw	a5,-20(s0)
    80003280:	fec42783          	lw	a5,-20(s0)
    80003284:	0007871b          	sext.w	a4,a5
    80003288:	47bd                	li	a5,15
    8000328a:	fae7d4e3          	bge	a5,a4,80003232 <exit+0x42>
    }
  }

  begin_op();
    8000328e:	00003097          	auipc	ra,0x3
    80003292:	262080e7          	jalr	610(ra) # 800064f0 <begin_op>
  iput(p->cwd);
    80003296:	fe043783          	ld	a5,-32(s0)
    8000329a:	1507b783          	ld	a5,336(a5)
    8000329e:	853e                	mv	a0,a5
    800032a0:	00002097          	auipc	ra,0x2
    800032a4:	34a080e7          	jalr	842(ra) # 800055ea <iput>
  end_op();
    800032a8:	00003097          	auipc	ra,0x3
    800032ac:	30a080e7          	jalr	778(ra) # 800065b2 <end_op>
  p->cwd = 0;
    800032b0:	fe043783          	ld	a5,-32(s0)
    800032b4:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    800032b8:	00019517          	auipc	a0,0x19
    800032bc:	dc850513          	addi	a0,a0,-568 # 8001c080 <wait_lock>
    800032c0:	ffffe097          	auipc	ra,0xffffe
    800032c4:	070080e7          	jalr	112(ra) # 80001330 <acquire>

  // Give any children to init.
  reparent(p);
    800032c8:	fe043503          	ld	a0,-32(s0)
    800032cc:	00000097          	auipc	ra,0x0
    800032d0:	eb0080e7          	jalr	-336(ra) # 8000317c <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    800032d4:	fe043783          	ld	a5,-32(s0)
    800032d8:	7f9c                	ld	a5,56(a5)
    800032da:	853e                	mv	a0,a5
    800032dc:	00000097          	auipc	ra,0x0
    800032e0:	460080e7          	jalr	1120(ra) # 8000373c <wakeup>
  
  acquire(&p->lock);
    800032e4:	fe043783          	ld	a5,-32(s0)
    800032e8:	853e                	mv	a0,a5
    800032ea:	ffffe097          	auipc	ra,0xffffe
    800032ee:	046080e7          	jalr	70(ra) # 80001330 <acquire>

  p->xstate = status;
    800032f2:	fe043783          	ld	a5,-32(s0)
    800032f6:	fcc42703          	lw	a4,-52(s0)
    800032fa:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    800032fc:	fe043783          	ld	a5,-32(s0)
    80003300:	4715                	li	a4,5
    80003302:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    80003304:	00019517          	auipc	a0,0x19
    80003308:	d7c50513          	addi	a0,a0,-644 # 8001c080 <wait_lock>
    8000330c:	ffffe097          	auipc	ra,0xffffe
    80003310:	088080e7          	jalr	136(ra) # 80001394 <release>

  // Jump into the scheduler, never to return.
  sched();
    80003314:	00000097          	auipc	ra,0x0
    80003318:	230080e7          	jalr	560(ra) # 80003544 <sched>
  panic("zombie exit");
    8000331c:	00008517          	auipc	a0,0x8
    80003320:	f0c50513          	addi	a0,a0,-244 # 8000b228 <etext+0x228>
    80003324:	ffffe097          	auipc	ra,0xffffe
    80003328:	964080e7          	jalr	-1692(ra) # 80000c88 <panic>

000000008000332c <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    8000332c:	7139                	addi	sp,sp,-64
    8000332e:	fc06                	sd	ra,56(sp)
    80003330:	f822                	sd	s0,48(sp)
    80003332:	0080                	addi	s0,sp,64
    80003334:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    80003338:	fffff097          	auipc	ra,0xfffff
    8000333c:	7c6080e7          	jalr	1990(ra) # 80002afe <myproc>
    80003340:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    80003344:	00019517          	auipc	a0,0x19
    80003348:	d3c50513          	addi	a0,a0,-708 # 8001c080 <wait_lock>
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	fe4080e7          	jalr	-28(ra) # 80001330 <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003354:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    80003358:	00013797          	auipc	a5,0x13
    8000335c:	31078793          	addi	a5,a5,784 # 80016668 <proc>
    80003360:	fef43423          	sd	a5,-24(s0)
    80003364:	a8d1                	j	80003438 <wait+0x10c>
      if(pp->parent == p){
    80003366:	fe843783          	ld	a5,-24(s0)
    8000336a:	7f9c                	ld	a5,56(a5)
    8000336c:	fd843703          	ld	a4,-40(s0)
    80003370:	0af71e63          	bne	a4,a5,8000342c <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    80003374:	fe843783          	ld	a5,-24(s0)
    80003378:	853e                	mv	a0,a5
    8000337a:	ffffe097          	auipc	ra,0xffffe
    8000337e:	fb6080e7          	jalr	-74(ra) # 80001330 <acquire>

        havekids = 1;
    80003382:	4785                	li	a5,1
    80003384:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    80003388:	fe843783          	ld	a5,-24(s0)
    8000338c:	4f9c                	lw	a5,24(a5)
    8000338e:	873e                	mv	a4,a5
    80003390:	4795                	li	a5,5
    80003392:	08f71663          	bne	a4,a5,8000341e <wait+0xf2>
          // Found one.
          pid = pp->pid;
    80003396:	fe843783          	ld	a5,-24(s0)
    8000339a:	5b9c                	lw	a5,48(a5)
    8000339c:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    800033a0:	fc843783          	ld	a5,-56(s0)
    800033a4:	c7a9                	beqz	a5,800033ee <wait+0xc2>
    800033a6:	fd843783          	ld	a5,-40(s0)
    800033aa:	6bb8                	ld	a4,80(a5)
    800033ac:	fe843783          	ld	a5,-24(s0)
    800033b0:	02c78793          	addi	a5,a5,44
    800033b4:	4691                	li	a3,4
    800033b6:	863e                	mv	a2,a5
    800033b8:	fc843583          	ld	a1,-56(s0)
    800033bc:	853a                	mv	a0,a4
    800033be:	fffff097          	auipc	ra,0xfffff
    800033c2:	20a080e7          	jalr	522(ra) # 800025c8 <copyout>
    800033c6:	87aa                	mv	a5,a0
    800033c8:	0207d363          	bgez	a5,800033ee <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    800033cc:	fe843783          	ld	a5,-24(s0)
    800033d0:	853e                	mv	a0,a5
    800033d2:	ffffe097          	auipc	ra,0xffffe
    800033d6:	fc2080e7          	jalr	-62(ra) # 80001394 <release>
            release(&wait_lock);
    800033da:	00019517          	auipc	a0,0x19
    800033de:	ca650513          	addi	a0,a0,-858 # 8001c080 <wait_lock>
    800033e2:	ffffe097          	auipc	ra,0xffffe
    800033e6:	fb2080e7          	jalr	-78(ra) # 80001394 <release>
            return -1;
    800033ea:	57fd                	li	a5,-1
    800033ec:	a879                	j	8000348a <wait+0x15e>
          }
          freeproc(pp);
    800033ee:	fe843503          	ld	a0,-24(s0)
    800033f2:	00000097          	auipc	ra,0x0
    800033f6:	8d0080e7          	jalr	-1840(ra) # 80002cc2 <freeproc>
          release(&pp->lock);
    800033fa:	fe843783          	ld	a5,-24(s0)
    800033fe:	853e                	mv	a0,a5
    80003400:	ffffe097          	auipc	ra,0xffffe
    80003404:	f94080e7          	jalr	-108(ra) # 80001394 <release>
          release(&wait_lock);
    80003408:	00019517          	auipc	a0,0x19
    8000340c:	c7850513          	addi	a0,a0,-904 # 8001c080 <wait_lock>
    80003410:	ffffe097          	auipc	ra,0xffffe
    80003414:	f84080e7          	jalr	-124(ra) # 80001394 <release>
          return pid;
    80003418:	fd442783          	lw	a5,-44(s0)
    8000341c:	a0bd                	j	8000348a <wait+0x15e>
        }
        release(&pp->lock);
    8000341e:	fe843783          	ld	a5,-24(s0)
    80003422:	853e                	mv	a0,a5
    80003424:	ffffe097          	auipc	ra,0xffffe
    80003428:	f70080e7          	jalr	-144(ra) # 80001394 <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    8000342c:	fe843783          	ld	a5,-24(s0)
    80003430:	16878793          	addi	a5,a5,360
    80003434:	fef43423          	sd	a5,-24(s0)
    80003438:	fe843703          	ld	a4,-24(s0)
    8000343c:	00019797          	auipc	a5,0x19
    80003440:	c2c78793          	addi	a5,a5,-980 # 8001c068 <pid_lock>
    80003444:	f2f761e3          	bltu	a4,a5,80003366 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    80003448:	fe442783          	lw	a5,-28(s0)
    8000344c:	2781                	sext.w	a5,a5
    8000344e:	cb89                	beqz	a5,80003460 <wait+0x134>
    80003450:	fd843503          	ld	a0,-40(s0)
    80003454:	00000097          	auipc	ra,0x0
    80003458:	47a080e7          	jalr	1146(ra) # 800038ce <killed>
    8000345c:	87aa                	mv	a5,a0
    8000345e:	cb99                	beqz	a5,80003474 <wait+0x148>
      release(&wait_lock);
    80003460:	00019517          	auipc	a0,0x19
    80003464:	c2050513          	addi	a0,a0,-992 # 8001c080 <wait_lock>
    80003468:	ffffe097          	auipc	ra,0xffffe
    8000346c:	f2c080e7          	jalr	-212(ra) # 80001394 <release>
      return -1;
    80003470:	57fd                	li	a5,-1
    80003472:	a821                	j	8000348a <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    80003474:	00019597          	auipc	a1,0x19
    80003478:	c0c58593          	addi	a1,a1,-1012 # 8001c080 <wait_lock>
    8000347c:	fd843503          	ld	a0,-40(s0)
    80003480:	00000097          	auipc	ra,0x0
    80003484:	240080e7          	jalr	576(ra) # 800036c0 <sleep>
    havekids = 0;
    80003488:	b5f1                	j	80003354 <wait+0x28>
  }
}
    8000348a:	853e                	mv	a0,a5
    8000348c:	70e2                	ld	ra,56(sp)
    8000348e:	7442                	ld	s0,48(sp)
    80003490:	6121                	addi	sp,sp,64
    80003492:	8082                	ret

0000000080003494 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    80003494:	1101                	addi	sp,sp,-32
    80003496:	ec06                	sd	ra,24(sp)
    80003498:	e822                	sd	s0,16(sp)
    8000349a:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    8000349c:	fffff097          	auipc	ra,0xfffff
    800034a0:	628080e7          	jalr	1576(ra) # 80002ac4 <mycpu>
    800034a4:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    800034a8:	fe043783          	ld	a5,-32(s0)
    800034ac:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    800034b0:	fffff097          	auipc	ra,0xfffff
    800034b4:	3f6080e7          	jalr	1014(ra) # 800028a6 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    800034b8:	00013797          	auipc	a5,0x13
    800034bc:	1b078793          	addi	a5,a5,432 # 80016668 <proc>
    800034c0:	fef43423          	sd	a5,-24(s0)
    800034c4:	a0bd                	j	80003532 <scheduler+0x9e>
      acquire(&p->lock);
    800034c6:	fe843783          	ld	a5,-24(s0)
    800034ca:	853e                	mv	a0,a5
    800034cc:	ffffe097          	auipc	ra,0xffffe
    800034d0:	e64080e7          	jalr	-412(ra) # 80001330 <acquire>
      if(p->state == RUNNABLE) {
    800034d4:	fe843783          	ld	a5,-24(s0)
    800034d8:	4f9c                	lw	a5,24(a5)
    800034da:	873e                	mv	a4,a5
    800034dc:	478d                	li	a5,3
    800034de:	02f71d63          	bne	a4,a5,80003518 <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    800034e2:	fe843783          	ld	a5,-24(s0)
    800034e6:	4711                	li	a4,4
    800034e8:	cf98                	sw	a4,24(a5)
        c->proc = p;
    800034ea:	fe043783          	ld	a5,-32(s0)
    800034ee:	fe843703          	ld	a4,-24(s0)
    800034f2:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    800034f4:	fe043783          	ld	a5,-32(s0)
    800034f8:	00878713          	addi	a4,a5,8
    800034fc:	fe843783          	ld	a5,-24(s0)
    80003500:	06078793          	addi	a5,a5,96
    80003504:	85be                	mv	a1,a5
    80003506:	853a                	mv	a0,a4
    80003508:	00000097          	auipc	ra,0x0
    8000350c:	5d0080e7          	jalr	1488(ra) # 80003ad8 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    80003510:	fe043783          	ld	a5,-32(s0)
    80003514:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    80003518:	fe843783          	ld	a5,-24(s0)
    8000351c:	853e                	mv	a0,a5
    8000351e:	ffffe097          	auipc	ra,0xffffe
    80003522:	e76080e7          	jalr	-394(ra) # 80001394 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    80003526:	fe843783          	ld	a5,-24(s0)
    8000352a:	16878793          	addi	a5,a5,360
    8000352e:	fef43423          	sd	a5,-24(s0)
    80003532:	fe843703          	ld	a4,-24(s0)
    80003536:	00019797          	auipc	a5,0x19
    8000353a:	b3278793          	addi	a5,a5,-1230 # 8001c068 <pid_lock>
    8000353e:	f8f764e3          	bltu	a4,a5,800034c6 <scheduler+0x32>
    intr_on();
    80003542:	b7bd                	j	800034b0 <scheduler+0x1c>

0000000080003544 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    80003544:	7179                	addi	sp,sp,-48
    80003546:	f406                	sd	ra,40(sp)
    80003548:	f022                	sd	s0,32(sp)
    8000354a:	ec26                	sd	s1,24(sp)
    8000354c:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    8000354e:	fffff097          	auipc	ra,0xfffff
    80003552:	5b0080e7          	jalr	1456(ra) # 80002afe <myproc>
    80003556:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    8000355a:	fd843783          	ld	a5,-40(s0)
    8000355e:	853e                	mv	a0,a5
    80003560:	ffffe097          	auipc	ra,0xffffe
    80003564:	e8a080e7          	jalr	-374(ra) # 800013ea <holding>
    80003568:	87aa                	mv	a5,a0
    8000356a:	eb89                	bnez	a5,8000357c <sched+0x38>
    panic("sched p->lock");
    8000356c:	00008517          	auipc	a0,0x8
    80003570:	ccc50513          	addi	a0,a0,-820 # 8000b238 <etext+0x238>
    80003574:	ffffd097          	auipc	ra,0xffffd
    80003578:	714080e7          	jalr	1812(ra) # 80000c88 <panic>
  if(mycpu()->noff != 1)
    8000357c:	fffff097          	auipc	ra,0xfffff
    80003580:	548080e7          	jalr	1352(ra) # 80002ac4 <mycpu>
    80003584:	87aa                	mv	a5,a0
    80003586:	5fbc                	lw	a5,120(a5)
    80003588:	873e                	mv	a4,a5
    8000358a:	4785                	li	a5,1
    8000358c:	00f70a63          	beq	a4,a5,800035a0 <sched+0x5c>
    panic("sched locks");
    80003590:	00008517          	auipc	a0,0x8
    80003594:	cb850513          	addi	a0,a0,-840 # 8000b248 <etext+0x248>
    80003598:	ffffd097          	auipc	ra,0xffffd
    8000359c:	6f0080e7          	jalr	1776(ra) # 80000c88 <panic>
  if(p->state == RUNNING)
    800035a0:	fd843783          	ld	a5,-40(s0)
    800035a4:	4f9c                	lw	a5,24(a5)
    800035a6:	873e                	mv	a4,a5
    800035a8:	4791                	li	a5,4
    800035aa:	00f71a63          	bne	a4,a5,800035be <sched+0x7a>
    panic("sched running");
    800035ae:	00008517          	auipc	a0,0x8
    800035b2:	caa50513          	addi	a0,a0,-854 # 8000b258 <etext+0x258>
    800035b6:	ffffd097          	auipc	ra,0xffffd
    800035ba:	6d2080e7          	jalr	1746(ra) # 80000c88 <panic>
  if(intr_get())
    800035be:	fffff097          	auipc	ra,0xfffff
    800035c2:	312080e7          	jalr	786(ra) # 800028d0 <intr_get>
    800035c6:	87aa                	mv	a5,a0
    800035c8:	cb89                	beqz	a5,800035da <sched+0x96>
    panic("sched interruptible");
    800035ca:	00008517          	auipc	a0,0x8
    800035ce:	c9e50513          	addi	a0,a0,-866 # 8000b268 <etext+0x268>
    800035d2:	ffffd097          	auipc	ra,0xffffd
    800035d6:	6b6080e7          	jalr	1718(ra) # 80000c88 <panic>

  intena = mycpu()->intena;
    800035da:	fffff097          	auipc	ra,0xfffff
    800035de:	4ea080e7          	jalr	1258(ra) # 80002ac4 <mycpu>
    800035e2:	87aa                	mv	a5,a0
    800035e4:	5ffc                	lw	a5,124(a5)
    800035e6:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    800035ea:	fd843783          	ld	a5,-40(s0)
    800035ee:	06078493          	addi	s1,a5,96
    800035f2:	fffff097          	auipc	ra,0xfffff
    800035f6:	4d2080e7          	jalr	1234(ra) # 80002ac4 <mycpu>
    800035fa:	87aa                	mv	a5,a0
    800035fc:	07a1                	addi	a5,a5,8
    800035fe:	85be                	mv	a1,a5
    80003600:	8526                	mv	a0,s1
    80003602:	00000097          	auipc	ra,0x0
    80003606:	4d6080e7          	jalr	1238(ra) # 80003ad8 <swtch>
  mycpu()->intena = intena;
    8000360a:	fffff097          	auipc	ra,0xfffff
    8000360e:	4ba080e7          	jalr	1210(ra) # 80002ac4 <mycpu>
    80003612:	872a                	mv	a4,a0
    80003614:	fd442783          	lw	a5,-44(s0)
    80003618:	df7c                	sw	a5,124(a4)
}
    8000361a:	0001                	nop
    8000361c:	70a2                	ld	ra,40(sp)
    8000361e:	7402                	ld	s0,32(sp)
    80003620:	64e2                	ld	s1,24(sp)
    80003622:	6145                	addi	sp,sp,48
    80003624:	8082                	ret

0000000080003626 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    80003626:	1101                	addi	sp,sp,-32
    80003628:	ec06                	sd	ra,24(sp)
    8000362a:	e822                	sd	s0,16(sp)
    8000362c:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    8000362e:	fffff097          	auipc	ra,0xfffff
    80003632:	4d0080e7          	jalr	1232(ra) # 80002afe <myproc>
    80003636:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    8000363a:	fe843783          	ld	a5,-24(s0)
    8000363e:	853e                	mv	a0,a5
    80003640:	ffffe097          	auipc	ra,0xffffe
    80003644:	cf0080e7          	jalr	-784(ra) # 80001330 <acquire>
  p->state = RUNNABLE;
    80003648:	fe843783          	ld	a5,-24(s0)
    8000364c:	470d                	li	a4,3
    8000364e:	cf98                	sw	a4,24(a5)
  sched();
    80003650:	00000097          	auipc	ra,0x0
    80003654:	ef4080e7          	jalr	-268(ra) # 80003544 <sched>
  release(&p->lock);
    80003658:	fe843783          	ld	a5,-24(s0)
    8000365c:	853e                	mv	a0,a5
    8000365e:	ffffe097          	auipc	ra,0xffffe
    80003662:	d36080e7          	jalr	-714(ra) # 80001394 <release>
}
    80003666:	0001                	nop
    80003668:	60e2                	ld	ra,24(sp)
    8000366a:	6442                	ld	s0,16(sp)
    8000366c:	6105                	addi	sp,sp,32
    8000366e:	8082                	ret

0000000080003670 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    80003670:	1141                	addi	sp,sp,-16
    80003672:	e406                	sd	ra,8(sp)
    80003674:	e022                	sd	s0,0(sp)
    80003676:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    80003678:	fffff097          	auipc	ra,0xfffff
    8000367c:	486080e7          	jalr	1158(ra) # 80002afe <myproc>
    80003680:	87aa                	mv	a5,a0
    80003682:	853e                	mv	a0,a5
    80003684:	ffffe097          	auipc	ra,0xffffe
    80003688:	d10080e7          	jalr	-752(ra) # 80001394 <release>

  if (first) {
    8000368c:	0000a797          	auipc	a5,0xa
    80003690:	7b878793          	addi	a5,a5,1976 # 8000de44 <first.1>
    80003694:	439c                	lw	a5,0(a5)
    80003696:	cf81                	beqz	a5,800036ae <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003698:	0000a797          	auipc	a5,0xa
    8000369c:	7ac78793          	addi	a5,a5,1964 # 8000de44 <first.1>
    800036a0:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    800036a4:	4505                	li	a0,1
    800036a6:	00001097          	auipc	ra,0x1
    800036aa:	658080e7          	jalr	1624(ra) # 80004cfe <fsinit>
  }

  usertrapret();
    800036ae:	00000097          	auipc	ra,0x0
    800036b2:	7dc080e7          	jalr	2012(ra) # 80003e8a <usertrapret>
}
    800036b6:	0001                	nop
    800036b8:	60a2                	ld	ra,8(sp)
    800036ba:	6402                	ld	s0,0(sp)
    800036bc:	0141                	addi	sp,sp,16
    800036be:	8082                	ret

00000000800036c0 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    800036c0:	7179                	addi	sp,sp,-48
    800036c2:	f406                	sd	ra,40(sp)
    800036c4:	f022                	sd	s0,32(sp)
    800036c6:	1800                	addi	s0,sp,48
    800036c8:	fca43c23          	sd	a0,-40(s0)
    800036cc:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800036d0:	fffff097          	auipc	ra,0xfffff
    800036d4:	42e080e7          	jalr	1070(ra) # 80002afe <myproc>
    800036d8:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    800036dc:	fe843783          	ld	a5,-24(s0)
    800036e0:	853e                	mv	a0,a5
    800036e2:	ffffe097          	auipc	ra,0xffffe
    800036e6:	c4e080e7          	jalr	-946(ra) # 80001330 <acquire>
  release(lk);
    800036ea:	fd043503          	ld	a0,-48(s0)
    800036ee:	ffffe097          	auipc	ra,0xffffe
    800036f2:	ca6080e7          	jalr	-858(ra) # 80001394 <release>

  // Go to sleep.
  p->chan = chan;
    800036f6:	fe843783          	ld	a5,-24(s0)
    800036fa:	fd843703          	ld	a4,-40(s0)
    800036fe:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003700:	fe843783          	ld	a5,-24(s0)
    80003704:	4709                	li	a4,2
    80003706:	cf98                	sw	a4,24(a5)

  sched();
    80003708:	00000097          	auipc	ra,0x0
    8000370c:	e3c080e7          	jalr	-452(ra) # 80003544 <sched>

  // Tidy up.
  p->chan = 0;
    80003710:	fe843783          	ld	a5,-24(s0)
    80003714:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    80003718:	fe843783          	ld	a5,-24(s0)
    8000371c:	853e                	mv	a0,a5
    8000371e:	ffffe097          	auipc	ra,0xffffe
    80003722:	c76080e7          	jalr	-906(ra) # 80001394 <release>
  acquire(lk);
    80003726:	fd043503          	ld	a0,-48(s0)
    8000372a:	ffffe097          	auipc	ra,0xffffe
    8000372e:	c06080e7          	jalr	-1018(ra) # 80001330 <acquire>
}
    80003732:	0001                	nop
    80003734:	70a2                	ld	ra,40(sp)
    80003736:	7402                	ld	s0,32(sp)
    80003738:	6145                	addi	sp,sp,48
    8000373a:	8082                	ret

000000008000373c <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    8000373c:	7179                	addi	sp,sp,-48
    8000373e:	f406                	sd	ra,40(sp)
    80003740:	f022                	sd	s0,32(sp)
    80003742:	1800                	addi	s0,sp,48
    80003744:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80003748:	00013797          	auipc	a5,0x13
    8000374c:	f2078793          	addi	a5,a5,-224 # 80016668 <proc>
    80003750:	fef43423          	sd	a5,-24(s0)
    80003754:	a051                	j	800037d8 <wakeup+0x9c>
    if(p != myproc()){
    80003756:	fffff097          	auipc	ra,0xfffff
    8000375a:	3a8080e7          	jalr	936(ra) # 80002afe <myproc>
    8000375e:	872a                	mv	a4,a0
    80003760:	fe843783          	ld	a5,-24(s0)
    80003764:	06e78463          	beq	a5,a4,800037cc <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    80003768:	fe843783          	ld	a5,-24(s0)
    8000376c:	853e                	mv	a0,a5
    8000376e:	ffffe097          	auipc	ra,0xffffe
    80003772:	c7c080e7          	jalr	-900(ra) # 800013ea <holding>
    80003776:	87aa                	mv	a5,a0
    80003778:	cb81                	beqz	a5,80003788 <wakeup+0x4c>
    8000377a:	fe843783          	ld	a5,-24(s0)
    8000377e:	4f9c                	lw	a5,24(a5)
    80003780:	873e                	mv	a4,a5
    80003782:	4785                	li	a5,1
    80003784:	04f70363          	beq	a4,a5,800037ca <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    80003788:	fe843783          	ld	a5,-24(s0)
    8000378c:	853e                	mv	a0,a5
    8000378e:	ffffe097          	auipc	ra,0xffffe
    80003792:	ba2080e7          	jalr	-1118(ra) # 80001330 <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    80003796:	fe843783          	ld	a5,-24(s0)
    8000379a:	4f9c                	lw	a5,24(a5)
    8000379c:	873e                	mv	a4,a5
    8000379e:	4789                	li	a5,2
    800037a0:	00f71d63          	bne	a4,a5,800037ba <wakeup+0x7e>
    800037a4:	fe843783          	ld	a5,-24(s0)
    800037a8:	739c                	ld	a5,32(a5)
    800037aa:	fd843703          	ld	a4,-40(s0)
    800037ae:	00f71663          	bne	a4,a5,800037ba <wakeup+0x7e>
        p->state = RUNNABLE;
    800037b2:	fe843783          	ld	a5,-24(s0)
    800037b6:	470d                	li	a4,3
    800037b8:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    800037ba:	fe843783          	ld	a5,-24(s0)
    800037be:	853e                	mv	a0,a5
    800037c0:	ffffe097          	auipc	ra,0xffffe
    800037c4:	bd4080e7          	jalr	-1068(ra) # 80001394 <release>
    800037c8:	a011                	j	800037cc <wakeup+0x90>
        continue;
    800037ca:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    800037cc:	fe843783          	ld	a5,-24(s0)
    800037d0:	16878793          	addi	a5,a5,360
    800037d4:	fef43423          	sd	a5,-24(s0)
    800037d8:	fe843703          	ld	a4,-24(s0)
    800037dc:	00019797          	auipc	a5,0x19
    800037e0:	88c78793          	addi	a5,a5,-1908 # 8001c068 <pid_lock>
    800037e4:	f6f769e3          	bltu	a4,a5,80003756 <wakeup+0x1a>
    }
  }
}
    800037e8:	0001                	nop
    800037ea:	0001                	nop
    800037ec:	70a2                	ld	ra,40(sp)
    800037ee:	7402                	ld	s0,32(sp)
    800037f0:	6145                	addi	sp,sp,48
    800037f2:	8082                	ret

00000000800037f4 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    800037f4:	7179                	addi	sp,sp,-48
    800037f6:	f406                	sd	ra,40(sp)
    800037f8:	f022                	sd	s0,32(sp)
    800037fa:	1800                	addi	s0,sp,48
    800037fc:	87aa                	mv	a5,a0
    800037fe:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80003802:	00013797          	auipc	a5,0x13
    80003806:	e6678793          	addi	a5,a5,-410 # 80016668 <proc>
    8000380a:	fef43423          	sd	a5,-24(s0)
    8000380e:	a0ad                	j	80003878 <kill+0x84>
    acquire(&p->lock);
    80003810:	fe843783          	ld	a5,-24(s0)
    80003814:	853e                	mv	a0,a5
    80003816:	ffffe097          	auipc	ra,0xffffe
    8000381a:	b1a080e7          	jalr	-1254(ra) # 80001330 <acquire>
    if(p->pid == pid){
    8000381e:	fe843783          	ld	a5,-24(s0)
    80003822:	5b98                	lw	a4,48(a5)
    80003824:	fdc42783          	lw	a5,-36(s0)
    80003828:	2781                	sext.w	a5,a5
    8000382a:	02e79a63          	bne	a5,a4,8000385e <kill+0x6a>
      p->killed = 1;
    8000382e:	fe843783          	ld	a5,-24(s0)
    80003832:	4705                	li	a4,1
    80003834:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    80003836:	fe843783          	ld	a5,-24(s0)
    8000383a:	4f9c                	lw	a5,24(a5)
    8000383c:	873e                	mv	a4,a5
    8000383e:	4789                	li	a5,2
    80003840:	00f71663          	bne	a4,a5,8000384c <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    80003844:	fe843783          	ld	a5,-24(s0)
    80003848:	470d                	li	a4,3
    8000384a:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    8000384c:	fe843783          	ld	a5,-24(s0)
    80003850:	853e                	mv	a0,a5
    80003852:	ffffe097          	auipc	ra,0xffffe
    80003856:	b42080e7          	jalr	-1214(ra) # 80001394 <release>
      return 0;
    8000385a:	4781                	li	a5,0
    8000385c:	a03d                	j	8000388a <kill+0x96>
    }
    release(&p->lock);
    8000385e:	fe843783          	ld	a5,-24(s0)
    80003862:	853e                	mv	a0,a5
    80003864:	ffffe097          	auipc	ra,0xffffe
    80003868:	b30080e7          	jalr	-1232(ra) # 80001394 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    8000386c:	fe843783          	ld	a5,-24(s0)
    80003870:	16878793          	addi	a5,a5,360
    80003874:	fef43423          	sd	a5,-24(s0)
    80003878:	fe843703          	ld	a4,-24(s0)
    8000387c:	00018797          	auipc	a5,0x18
    80003880:	7ec78793          	addi	a5,a5,2028 # 8001c068 <pid_lock>
    80003884:	f8f766e3          	bltu	a4,a5,80003810 <kill+0x1c>
  }
  return -1;
    80003888:	57fd                	li	a5,-1
}
    8000388a:	853e                	mv	a0,a5
    8000388c:	70a2                	ld	ra,40(sp)
    8000388e:	7402                	ld	s0,32(sp)
    80003890:	6145                	addi	sp,sp,48
    80003892:	8082                	ret

0000000080003894 <setkilled>:

void
setkilled(struct proc *p)
{
    80003894:	1101                	addi	sp,sp,-32
    80003896:	ec06                	sd	ra,24(sp)
    80003898:	e822                	sd	s0,16(sp)
    8000389a:	1000                	addi	s0,sp,32
    8000389c:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800038a0:	fe843783          	ld	a5,-24(s0)
    800038a4:	853e                	mv	a0,a5
    800038a6:	ffffe097          	auipc	ra,0xffffe
    800038aa:	a8a080e7          	jalr	-1398(ra) # 80001330 <acquire>
  p->killed = 1;
    800038ae:	fe843783          	ld	a5,-24(s0)
    800038b2:	4705                	li	a4,1
    800038b4:	d798                	sw	a4,40(a5)
  release(&p->lock);
    800038b6:	fe843783          	ld	a5,-24(s0)
    800038ba:	853e                	mv	a0,a5
    800038bc:	ffffe097          	auipc	ra,0xffffe
    800038c0:	ad8080e7          	jalr	-1320(ra) # 80001394 <release>
}
    800038c4:	0001                	nop
    800038c6:	60e2                	ld	ra,24(sp)
    800038c8:	6442                	ld	s0,16(sp)
    800038ca:	6105                	addi	sp,sp,32
    800038cc:	8082                	ret

00000000800038ce <killed>:

int
killed(struct proc *p)
{
    800038ce:	7179                	addi	sp,sp,-48
    800038d0:	f406                	sd	ra,40(sp)
    800038d2:	f022                	sd	s0,32(sp)
    800038d4:	1800                	addi	s0,sp,48
    800038d6:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    800038da:	fd843783          	ld	a5,-40(s0)
    800038de:	853e                	mv	a0,a5
    800038e0:	ffffe097          	auipc	ra,0xffffe
    800038e4:	a50080e7          	jalr	-1456(ra) # 80001330 <acquire>
  k = p->killed;
    800038e8:	fd843783          	ld	a5,-40(s0)
    800038ec:	579c                	lw	a5,40(a5)
    800038ee:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    800038f2:	fd843783          	ld	a5,-40(s0)
    800038f6:	853e                	mv	a0,a5
    800038f8:	ffffe097          	auipc	ra,0xffffe
    800038fc:	a9c080e7          	jalr	-1380(ra) # 80001394 <release>
  return k;
    80003900:	fec42783          	lw	a5,-20(s0)
}
    80003904:	853e                	mv	a0,a5
    80003906:	70a2                	ld	ra,40(sp)
    80003908:	7402                	ld	s0,32(sp)
    8000390a:	6145                	addi	sp,sp,48
    8000390c:	8082                	ret

000000008000390e <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8000390e:	7139                	addi	sp,sp,-64
    80003910:	fc06                	sd	ra,56(sp)
    80003912:	f822                	sd	s0,48(sp)
    80003914:	0080                	addi	s0,sp,64
    80003916:	87aa                	mv	a5,a0
    80003918:	fcb43823          	sd	a1,-48(s0)
    8000391c:	fcc43423          	sd	a2,-56(s0)
    80003920:	fcd43023          	sd	a3,-64(s0)
    80003924:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80003928:	fffff097          	auipc	ra,0xfffff
    8000392c:	1d6080e7          	jalr	470(ra) # 80002afe <myproc>
    80003930:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003934:	fdc42783          	lw	a5,-36(s0)
    80003938:	2781                	sext.w	a5,a5
    8000393a:	c38d                	beqz	a5,8000395c <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    8000393c:	fe843783          	ld	a5,-24(s0)
    80003940:	6bbc                	ld	a5,80(a5)
    80003942:	fc043683          	ld	a3,-64(s0)
    80003946:	fc843603          	ld	a2,-56(s0)
    8000394a:	fd043583          	ld	a1,-48(s0)
    8000394e:	853e                	mv	a0,a5
    80003950:	fffff097          	auipc	ra,0xfffff
    80003954:	c78080e7          	jalr	-904(ra) # 800025c8 <copyout>
    80003958:	87aa                	mv	a5,a0
    8000395a:	a839                	j	80003978 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    8000395c:	fd043783          	ld	a5,-48(s0)
    80003960:	fc043703          	ld	a4,-64(s0)
    80003964:	2701                	sext.w	a4,a4
    80003966:	863a                	mv	a2,a4
    80003968:	fc843583          	ld	a1,-56(s0)
    8000396c:	853e                	mv	a0,a5
    8000396e:	ffffe097          	auipc	ra,0xffffe
    80003972:	c7a080e7          	jalr	-902(ra) # 800015e8 <memmove>
    return 0;
    80003976:	4781                	li	a5,0
  }
}
    80003978:	853e                	mv	a0,a5
    8000397a:	70e2                	ld	ra,56(sp)
    8000397c:	7442                	ld	s0,48(sp)
    8000397e:	6121                	addi	sp,sp,64
    80003980:	8082                	ret

0000000080003982 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80003982:	7139                	addi	sp,sp,-64
    80003984:	fc06                	sd	ra,56(sp)
    80003986:	f822                	sd	s0,48(sp)
    80003988:	0080                	addi	s0,sp,64
    8000398a:	fca43c23          	sd	a0,-40(s0)
    8000398e:	87ae                	mv	a5,a1
    80003990:	fcc43423          	sd	a2,-56(s0)
    80003994:	fcd43023          	sd	a3,-64(s0)
    80003998:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    8000399c:	fffff097          	auipc	ra,0xfffff
    800039a0:	162080e7          	jalr	354(ra) # 80002afe <myproc>
    800039a4:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    800039a8:	fd442783          	lw	a5,-44(s0)
    800039ac:	2781                	sext.w	a5,a5
    800039ae:	c38d                	beqz	a5,800039d0 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    800039b0:	fe843783          	ld	a5,-24(s0)
    800039b4:	6bbc                	ld	a5,80(a5)
    800039b6:	fc043683          	ld	a3,-64(s0)
    800039ba:	fc843603          	ld	a2,-56(s0)
    800039be:	fd843583          	ld	a1,-40(s0)
    800039c2:	853e                	mv	a0,a5
    800039c4:	fffff097          	auipc	ra,0xfffff
    800039c8:	cd2080e7          	jalr	-814(ra) # 80002696 <copyin>
    800039cc:	87aa                	mv	a5,a0
    800039ce:	a839                	j	800039ec <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    800039d0:	fc843783          	ld	a5,-56(s0)
    800039d4:	fc043703          	ld	a4,-64(s0)
    800039d8:	2701                	sext.w	a4,a4
    800039da:	863a                	mv	a2,a4
    800039dc:	85be                	mv	a1,a5
    800039de:	fd843503          	ld	a0,-40(s0)
    800039e2:	ffffe097          	auipc	ra,0xffffe
    800039e6:	c06080e7          	jalr	-1018(ra) # 800015e8 <memmove>
    return 0;
    800039ea:	4781                	li	a5,0
  }
}
    800039ec:	853e                	mv	a0,a5
    800039ee:	70e2                	ld	ra,56(sp)
    800039f0:	7442                	ld	s0,48(sp)
    800039f2:	6121                	addi	sp,sp,64
    800039f4:	8082                	ret

00000000800039f6 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    800039f6:	1101                	addi	sp,sp,-32
    800039f8:	ec06                	sd	ra,24(sp)
    800039fa:	e822                	sd	s0,16(sp)
    800039fc:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    800039fe:	00008517          	auipc	a0,0x8
    80003a02:	88250513          	addi	a0,a0,-1918 # 8000b280 <etext+0x280>
    80003a06:	ffffd097          	auipc	ra,0xffffd
    80003a0a:	02c080e7          	jalr	44(ra) # 80000a32 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003a0e:	00013797          	auipc	a5,0x13
    80003a12:	c5a78793          	addi	a5,a5,-934 # 80016668 <proc>
    80003a16:	fef43423          	sd	a5,-24(s0)
    80003a1a:	a04d                	j	80003abc <procdump+0xc6>
    if(p->state == UNUSED)
    80003a1c:	fe843783          	ld	a5,-24(s0)
    80003a20:	4f9c                	lw	a5,24(a5)
    80003a22:	c7d1                	beqz	a5,80003aae <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003a24:	fe843783          	ld	a5,-24(s0)
    80003a28:	4f9c                	lw	a5,24(a5)
    80003a2a:	873e                	mv	a4,a5
    80003a2c:	4795                	li	a5,5
    80003a2e:	02e7ee63          	bltu	a5,a4,80003a6a <procdump+0x74>
    80003a32:	fe843783          	ld	a5,-24(s0)
    80003a36:	4f9c                	lw	a5,24(a5)
    80003a38:	0000a717          	auipc	a4,0xa
    80003a3c:	48070713          	addi	a4,a4,1152 # 8000deb8 <states.0>
    80003a40:	1782                	slli	a5,a5,0x20
    80003a42:	9381                	srli	a5,a5,0x20
    80003a44:	078e                	slli	a5,a5,0x3
    80003a46:	97ba                	add	a5,a5,a4
    80003a48:	639c                	ld	a5,0(a5)
    80003a4a:	c385                	beqz	a5,80003a6a <procdump+0x74>
      state = states[p->state];
    80003a4c:	fe843783          	ld	a5,-24(s0)
    80003a50:	4f9c                	lw	a5,24(a5)
    80003a52:	0000a717          	auipc	a4,0xa
    80003a56:	46670713          	addi	a4,a4,1126 # 8000deb8 <states.0>
    80003a5a:	1782                	slli	a5,a5,0x20
    80003a5c:	9381                	srli	a5,a5,0x20
    80003a5e:	078e                	slli	a5,a5,0x3
    80003a60:	97ba                	add	a5,a5,a4
    80003a62:	639c                	ld	a5,0(a5)
    80003a64:	fef43023          	sd	a5,-32(s0)
    80003a68:	a039                	j	80003a76 <procdump+0x80>
    else
      state = "???";
    80003a6a:	00008797          	auipc	a5,0x8
    80003a6e:	81e78793          	addi	a5,a5,-2018 # 8000b288 <etext+0x288>
    80003a72:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003a76:	fe843783          	ld	a5,-24(s0)
    80003a7a:	5b98                	lw	a4,48(a5)
    80003a7c:	fe843783          	ld	a5,-24(s0)
    80003a80:	15878793          	addi	a5,a5,344
    80003a84:	86be                	mv	a3,a5
    80003a86:	fe043603          	ld	a2,-32(s0)
    80003a8a:	85ba                	mv	a1,a4
    80003a8c:	00008517          	auipc	a0,0x8
    80003a90:	80450513          	addi	a0,a0,-2044 # 8000b290 <etext+0x290>
    80003a94:	ffffd097          	auipc	ra,0xffffd
    80003a98:	f9e080e7          	jalr	-98(ra) # 80000a32 <printf>
    printf("\n");
    80003a9c:	00007517          	auipc	a0,0x7
    80003aa0:	7e450513          	addi	a0,a0,2020 # 8000b280 <etext+0x280>
    80003aa4:	ffffd097          	auipc	ra,0xffffd
    80003aa8:	f8e080e7          	jalr	-114(ra) # 80000a32 <printf>
    80003aac:	a011                	j	80003ab0 <procdump+0xba>
      continue;
    80003aae:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003ab0:	fe843783          	ld	a5,-24(s0)
    80003ab4:	16878793          	addi	a5,a5,360
    80003ab8:	fef43423          	sd	a5,-24(s0)
    80003abc:	fe843703          	ld	a4,-24(s0)
    80003ac0:	00018797          	auipc	a5,0x18
    80003ac4:	5a878793          	addi	a5,a5,1448 # 8001c068 <pid_lock>
    80003ac8:	f4f76ae3          	bltu	a4,a5,80003a1c <procdump+0x26>
  }
}
    80003acc:	0001                	nop
    80003ace:	0001                	nop
    80003ad0:	60e2                	ld	ra,24(sp)
    80003ad2:	6442                	ld	s0,16(sp)
    80003ad4:	6105                	addi	sp,sp,32
    80003ad6:	8082                	ret

0000000080003ad8 <swtch>:
    80003ad8:	00153023          	sd	ra,0(a0)
    80003adc:	00253423          	sd	sp,8(a0)
    80003ae0:	e900                	sd	s0,16(a0)
    80003ae2:	ed04                	sd	s1,24(a0)
    80003ae4:	03253023          	sd	s2,32(a0)
    80003ae8:	03353423          	sd	s3,40(a0)
    80003aec:	03453823          	sd	s4,48(a0)
    80003af0:	03553c23          	sd	s5,56(a0)
    80003af4:	05653023          	sd	s6,64(a0)
    80003af8:	05753423          	sd	s7,72(a0)
    80003afc:	05853823          	sd	s8,80(a0)
    80003b00:	05953c23          	sd	s9,88(a0)
    80003b04:	07a53023          	sd	s10,96(a0)
    80003b08:	07b53423          	sd	s11,104(a0)
    80003b0c:	0005b083          	ld	ra,0(a1)
    80003b10:	0085b103          	ld	sp,8(a1)
    80003b14:	6980                	ld	s0,16(a1)
    80003b16:	6d84                	ld	s1,24(a1)
    80003b18:	0205b903          	ld	s2,32(a1)
    80003b1c:	0285b983          	ld	s3,40(a1)
    80003b20:	0305ba03          	ld	s4,48(a1)
    80003b24:	0385ba83          	ld	s5,56(a1)
    80003b28:	0405bb03          	ld	s6,64(a1)
    80003b2c:	0485bb83          	ld	s7,72(a1)
    80003b30:	0505bc03          	ld	s8,80(a1)
    80003b34:	0585bc83          	ld	s9,88(a1)
    80003b38:	0605bd03          	ld	s10,96(a1)
    80003b3c:	0685bd83          	ld	s11,104(a1)
    80003b40:	8082                	ret

0000000080003b42 <r_sstatus>:
{
    80003b42:	1101                	addi	sp,sp,-32
    80003b44:	ec22                	sd	s0,24(sp)
    80003b46:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003b48:	100027f3          	csrr	a5,sstatus
    80003b4c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b50:	fe843783          	ld	a5,-24(s0)
}
    80003b54:	853e                	mv	a0,a5
    80003b56:	6462                	ld	s0,24(sp)
    80003b58:	6105                	addi	sp,sp,32
    80003b5a:	8082                	ret

0000000080003b5c <w_sstatus>:
{
    80003b5c:	1101                	addi	sp,sp,-32
    80003b5e:	ec22                	sd	s0,24(sp)
    80003b60:	1000                	addi	s0,sp,32
    80003b62:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003b66:	fe843783          	ld	a5,-24(s0)
    80003b6a:	10079073          	csrw	sstatus,a5
}
    80003b6e:	0001                	nop
    80003b70:	6462                	ld	s0,24(sp)
    80003b72:	6105                	addi	sp,sp,32
    80003b74:	8082                	ret

0000000080003b76 <r_sip>:
{
    80003b76:	1101                	addi	sp,sp,-32
    80003b78:	ec22                	sd	s0,24(sp)
    80003b7a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003b7c:	144027f3          	csrr	a5,sip
    80003b80:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b84:	fe843783          	ld	a5,-24(s0)
}
    80003b88:	853e                	mv	a0,a5
    80003b8a:	6462                	ld	s0,24(sp)
    80003b8c:	6105                	addi	sp,sp,32
    80003b8e:	8082                	ret

0000000080003b90 <w_sip>:
{
    80003b90:	1101                	addi	sp,sp,-32
    80003b92:	ec22                	sd	s0,24(sp)
    80003b94:	1000                	addi	s0,sp,32
    80003b96:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003b9a:	fe843783          	ld	a5,-24(s0)
    80003b9e:	14479073          	csrw	sip,a5
}
    80003ba2:	0001                	nop
    80003ba4:	6462                	ld	s0,24(sp)
    80003ba6:	6105                	addi	sp,sp,32
    80003ba8:	8082                	ret

0000000080003baa <w_sepc>:
{
    80003baa:	1101                	addi	sp,sp,-32
    80003bac:	ec22                	sd	s0,24(sp)
    80003bae:	1000                	addi	s0,sp,32
    80003bb0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003bb4:	fe843783          	ld	a5,-24(s0)
    80003bb8:	14179073          	csrw	sepc,a5
}
    80003bbc:	0001                	nop
    80003bbe:	6462                	ld	s0,24(sp)
    80003bc0:	6105                	addi	sp,sp,32
    80003bc2:	8082                	ret

0000000080003bc4 <r_sepc>:
{
    80003bc4:	1101                	addi	sp,sp,-32
    80003bc6:	ec22                	sd	s0,24(sp)
    80003bc8:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003bca:	141027f3          	csrr	a5,sepc
    80003bce:	fef43423          	sd	a5,-24(s0)
  return x;
    80003bd2:	fe843783          	ld	a5,-24(s0)
}
    80003bd6:	853e                	mv	a0,a5
    80003bd8:	6462                	ld	s0,24(sp)
    80003bda:	6105                	addi	sp,sp,32
    80003bdc:	8082                	ret

0000000080003bde <w_stvec>:
{
    80003bde:	1101                	addi	sp,sp,-32
    80003be0:	ec22                	sd	s0,24(sp)
    80003be2:	1000                	addi	s0,sp,32
    80003be4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003be8:	fe843783          	ld	a5,-24(s0)
    80003bec:	10579073          	csrw	stvec,a5
}
    80003bf0:	0001                	nop
    80003bf2:	6462                	ld	s0,24(sp)
    80003bf4:	6105                	addi	sp,sp,32
    80003bf6:	8082                	ret

0000000080003bf8 <r_satp>:
{
    80003bf8:	1101                	addi	sp,sp,-32
    80003bfa:	ec22                	sd	s0,24(sp)
    80003bfc:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003bfe:	180027f3          	csrr	a5,satp
    80003c02:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c06:	fe843783          	ld	a5,-24(s0)
}
    80003c0a:	853e                	mv	a0,a5
    80003c0c:	6462                	ld	s0,24(sp)
    80003c0e:	6105                	addi	sp,sp,32
    80003c10:	8082                	ret

0000000080003c12 <r_scause>:
{
    80003c12:	1101                	addi	sp,sp,-32
    80003c14:	ec22                	sd	s0,24(sp)
    80003c16:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003c18:	142027f3          	csrr	a5,scause
    80003c1c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c20:	fe843783          	ld	a5,-24(s0)
}
    80003c24:	853e                	mv	a0,a5
    80003c26:	6462                	ld	s0,24(sp)
    80003c28:	6105                	addi	sp,sp,32
    80003c2a:	8082                	ret

0000000080003c2c <r_stval>:
{
    80003c2c:	1101                	addi	sp,sp,-32
    80003c2e:	ec22                	sd	s0,24(sp)
    80003c30:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003c32:	143027f3          	csrr	a5,stval
    80003c36:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c3a:	fe843783          	ld	a5,-24(s0)
}
    80003c3e:	853e                	mv	a0,a5
    80003c40:	6462                	ld	s0,24(sp)
    80003c42:	6105                	addi	sp,sp,32
    80003c44:	8082                	ret

0000000080003c46 <intr_on>:
{
    80003c46:	1141                	addi	sp,sp,-16
    80003c48:	e406                	sd	ra,8(sp)
    80003c4a:	e022                	sd	s0,0(sp)
    80003c4c:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003c4e:	00000097          	auipc	ra,0x0
    80003c52:	ef4080e7          	jalr	-268(ra) # 80003b42 <r_sstatus>
    80003c56:	87aa                	mv	a5,a0
    80003c58:	0027e793          	ori	a5,a5,2
    80003c5c:	853e                	mv	a0,a5
    80003c5e:	00000097          	auipc	ra,0x0
    80003c62:	efe080e7          	jalr	-258(ra) # 80003b5c <w_sstatus>
}
    80003c66:	0001                	nop
    80003c68:	60a2                	ld	ra,8(sp)
    80003c6a:	6402                	ld	s0,0(sp)
    80003c6c:	0141                	addi	sp,sp,16
    80003c6e:	8082                	ret

0000000080003c70 <intr_off>:
{
    80003c70:	1141                	addi	sp,sp,-16
    80003c72:	e406                	sd	ra,8(sp)
    80003c74:	e022                	sd	s0,0(sp)
    80003c76:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003c78:	00000097          	auipc	ra,0x0
    80003c7c:	eca080e7          	jalr	-310(ra) # 80003b42 <r_sstatus>
    80003c80:	87aa                	mv	a5,a0
    80003c82:	9bf5                	andi	a5,a5,-3
    80003c84:	853e                	mv	a0,a5
    80003c86:	00000097          	auipc	ra,0x0
    80003c8a:	ed6080e7          	jalr	-298(ra) # 80003b5c <w_sstatus>
}
    80003c8e:	0001                	nop
    80003c90:	60a2                	ld	ra,8(sp)
    80003c92:	6402                	ld	s0,0(sp)
    80003c94:	0141                	addi	sp,sp,16
    80003c96:	8082                	ret

0000000080003c98 <intr_get>:
{
    80003c98:	1101                	addi	sp,sp,-32
    80003c9a:	ec06                	sd	ra,24(sp)
    80003c9c:	e822                	sd	s0,16(sp)
    80003c9e:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003ca0:	00000097          	auipc	ra,0x0
    80003ca4:	ea2080e7          	jalr	-350(ra) # 80003b42 <r_sstatus>
    80003ca8:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003cac:	fe843783          	ld	a5,-24(s0)
    80003cb0:	8b89                	andi	a5,a5,2
    80003cb2:	00f037b3          	snez	a5,a5
    80003cb6:	0ff7f793          	zext.b	a5,a5
    80003cba:	2781                	sext.w	a5,a5
}
    80003cbc:	853e                	mv	a0,a5
    80003cbe:	60e2                	ld	ra,24(sp)
    80003cc0:	6442                	ld	s0,16(sp)
    80003cc2:	6105                	addi	sp,sp,32
    80003cc4:	8082                	ret

0000000080003cc6 <r_tp>:
{
    80003cc6:	1101                	addi	sp,sp,-32
    80003cc8:	ec22                	sd	s0,24(sp)
    80003cca:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003ccc:	8792                	mv	a5,tp
    80003cce:	fef43423          	sd	a5,-24(s0)
  return x;
    80003cd2:	fe843783          	ld	a5,-24(s0)
}
    80003cd6:	853e                	mv	a0,a5
    80003cd8:	6462                	ld	s0,24(sp)
    80003cda:	6105                	addi	sp,sp,32
    80003cdc:	8082                	ret

0000000080003cde <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003cde:	1141                	addi	sp,sp,-16
    80003ce0:	e406                	sd	ra,8(sp)
    80003ce2:	e022                	sd	s0,0(sp)
    80003ce4:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003ce6:	00007597          	auipc	a1,0x7
    80003cea:	5f258593          	addi	a1,a1,1522 # 8000b2d8 <etext+0x2d8>
    80003cee:	00018517          	auipc	a0,0x18
    80003cf2:	3aa50513          	addi	a0,a0,938 # 8001c098 <tickslock>
    80003cf6:	ffffd097          	auipc	ra,0xffffd
    80003cfa:	60a080e7          	jalr	1546(ra) # 80001300 <initlock>
}
    80003cfe:	0001                	nop
    80003d00:	60a2                	ld	ra,8(sp)
    80003d02:	6402                	ld	s0,0(sp)
    80003d04:	0141                	addi	sp,sp,16
    80003d06:	8082                	ret

0000000080003d08 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003d08:	1141                	addi	sp,sp,-16
    80003d0a:	e406                	sd	ra,8(sp)
    80003d0c:	e022                	sd	s0,0(sp)
    80003d0e:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003d10:	00005797          	auipc	a5,0x5
    80003d14:	ea078793          	addi	a5,a5,-352 # 80008bb0 <kernelvec>
    80003d18:	853e                	mv	a0,a5
    80003d1a:	00000097          	auipc	ra,0x0
    80003d1e:	ec4080e7          	jalr	-316(ra) # 80003bde <w_stvec>
}
    80003d22:	0001                	nop
    80003d24:	60a2                	ld	ra,8(sp)
    80003d26:	6402                	ld	s0,0(sp)
    80003d28:	0141                	addi	sp,sp,16
    80003d2a:	8082                	ret

0000000080003d2c <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003d2c:	7179                	addi	sp,sp,-48
    80003d2e:	f406                	sd	ra,40(sp)
    80003d30:	f022                	sd	s0,32(sp)
    80003d32:	ec26                	sd	s1,24(sp)
    80003d34:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003d36:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003d3a:	00000097          	auipc	ra,0x0
    80003d3e:	e08080e7          	jalr	-504(ra) # 80003b42 <r_sstatus>
    80003d42:	87aa                	mv	a5,a0
    80003d44:	1007f793          	andi	a5,a5,256
    80003d48:	cb89                	beqz	a5,80003d5a <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003d4a:	00007517          	auipc	a0,0x7
    80003d4e:	59650513          	addi	a0,a0,1430 # 8000b2e0 <etext+0x2e0>
    80003d52:	ffffd097          	auipc	ra,0xffffd
    80003d56:	f36080e7          	jalr	-202(ra) # 80000c88 <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003d5a:	00005797          	auipc	a5,0x5
    80003d5e:	e5678793          	addi	a5,a5,-426 # 80008bb0 <kernelvec>
    80003d62:	853e                	mv	a0,a5
    80003d64:	00000097          	auipc	ra,0x0
    80003d68:	e7a080e7          	jalr	-390(ra) # 80003bde <w_stvec>

  struct proc *p = myproc();
    80003d6c:	fffff097          	auipc	ra,0xfffff
    80003d70:	d92080e7          	jalr	-622(ra) # 80002afe <myproc>
    80003d74:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003d78:	fd043783          	ld	a5,-48(s0)
    80003d7c:	6fa4                	ld	s1,88(a5)
    80003d7e:	00000097          	auipc	ra,0x0
    80003d82:	e46080e7          	jalr	-442(ra) # 80003bc4 <r_sepc>
    80003d86:	87aa                	mv	a5,a0
    80003d88:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003d8a:	00000097          	auipc	ra,0x0
    80003d8e:	e88080e7          	jalr	-376(ra) # 80003c12 <r_scause>
    80003d92:	872a                	mv	a4,a0
    80003d94:	47a1                	li	a5,8
    80003d96:	04f71163          	bne	a4,a5,80003dd8 <usertrap+0xac>
    // system call

    if(killed(p))
    80003d9a:	fd043503          	ld	a0,-48(s0)
    80003d9e:	00000097          	auipc	ra,0x0
    80003da2:	b30080e7          	jalr	-1232(ra) # 800038ce <killed>
    80003da6:	87aa                	mv	a5,a0
    80003da8:	c791                	beqz	a5,80003db4 <usertrap+0x88>
      exit(-1);
    80003daa:	557d                	li	a0,-1
    80003dac:	fffff097          	auipc	ra,0xfffff
    80003db0:	444080e7          	jalr	1092(ra) # 800031f0 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003db4:	fd043783          	ld	a5,-48(s0)
    80003db8:	6fbc                	ld	a5,88(a5)
    80003dba:	6f98                	ld	a4,24(a5)
    80003dbc:	fd043783          	ld	a5,-48(s0)
    80003dc0:	6fbc                	ld	a5,88(a5)
    80003dc2:	0711                	addi	a4,a4,4
    80003dc4:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003dc6:	00000097          	auipc	ra,0x0
    80003dca:	e80080e7          	jalr	-384(ra) # 80003c46 <intr_on>

    syscall();
    80003dce:	00000097          	auipc	ra,0x0
    80003dd2:	69e080e7          	jalr	1694(ra) # 8000446c <syscall>
    80003dd6:	a885                	j	80003e46 <usertrap+0x11a>
  } else if((which_dev = devintr()) != 0){
    80003dd8:	00000097          	auipc	ra,0x0
    80003ddc:	34e080e7          	jalr	846(ra) # 80004126 <devintr>
    80003de0:	87aa                	mv	a5,a0
    80003de2:	fcf42e23          	sw	a5,-36(s0)
    80003de6:	fdc42783          	lw	a5,-36(s0)
    80003dea:	2781                	sext.w	a5,a5
    80003dec:	efa9                	bnez	a5,80003e46 <usertrap+0x11a>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003dee:	00000097          	auipc	ra,0x0
    80003df2:	e24080e7          	jalr	-476(ra) # 80003c12 <r_scause>
    80003df6:	872a                	mv	a4,a0
    80003df8:	fd043783          	ld	a5,-48(s0)
    80003dfc:	5b9c                	lw	a5,48(a5)
    80003dfe:	863e                	mv	a2,a5
    80003e00:	85ba                	mv	a1,a4
    80003e02:	00007517          	auipc	a0,0x7
    80003e06:	4fe50513          	addi	a0,a0,1278 # 8000b300 <etext+0x300>
    80003e0a:	ffffd097          	auipc	ra,0xffffd
    80003e0e:	c28080e7          	jalr	-984(ra) # 80000a32 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003e12:	00000097          	auipc	ra,0x0
    80003e16:	db2080e7          	jalr	-590(ra) # 80003bc4 <r_sepc>
    80003e1a:	84aa                	mv	s1,a0
    80003e1c:	00000097          	auipc	ra,0x0
    80003e20:	e10080e7          	jalr	-496(ra) # 80003c2c <r_stval>
    80003e24:	87aa                	mv	a5,a0
    80003e26:	863e                	mv	a2,a5
    80003e28:	85a6                	mv	a1,s1
    80003e2a:	00007517          	auipc	a0,0x7
    80003e2e:	50650513          	addi	a0,a0,1286 # 8000b330 <etext+0x330>
    80003e32:	ffffd097          	auipc	ra,0xffffd
    80003e36:	c00080e7          	jalr	-1024(ra) # 80000a32 <printf>
    setkilled(p);
    80003e3a:	fd043503          	ld	a0,-48(s0)
    80003e3e:	00000097          	auipc	ra,0x0
    80003e42:	a56080e7          	jalr	-1450(ra) # 80003894 <setkilled>
  }

  if(killed(p))
    80003e46:	fd043503          	ld	a0,-48(s0)
    80003e4a:	00000097          	auipc	ra,0x0
    80003e4e:	a84080e7          	jalr	-1404(ra) # 800038ce <killed>
    80003e52:	87aa                	mv	a5,a0
    80003e54:	c791                	beqz	a5,80003e60 <usertrap+0x134>
    exit(-1);
    80003e56:	557d                	li	a0,-1
    80003e58:	fffff097          	auipc	ra,0xfffff
    80003e5c:	398080e7          	jalr	920(ra) # 800031f0 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003e60:	fdc42783          	lw	a5,-36(s0)
    80003e64:	0007871b          	sext.w	a4,a5
    80003e68:	4789                	li	a5,2
    80003e6a:	00f71663          	bne	a4,a5,80003e76 <usertrap+0x14a>
    yield();
    80003e6e:	fffff097          	auipc	ra,0xfffff
    80003e72:	7b8080e7          	jalr	1976(ra) # 80003626 <yield>

  usertrapret();
    80003e76:	00000097          	auipc	ra,0x0
    80003e7a:	014080e7          	jalr	20(ra) # 80003e8a <usertrapret>
}
    80003e7e:	0001                	nop
    80003e80:	70a2                	ld	ra,40(sp)
    80003e82:	7402                	ld	s0,32(sp)
    80003e84:	64e2                	ld	s1,24(sp)
    80003e86:	6145                	addi	sp,sp,48
    80003e88:	8082                	ret

0000000080003e8a <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003e8a:	715d                	addi	sp,sp,-80
    80003e8c:	e486                	sd	ra,72(sp)
    80003e8e:	e0a2                	sd	s0,64(sp)
    80003e90:	fc26                	sd	s1,56(sp)
    80003e92:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003e94:	fffff097          	auipc	ra,0xfffff
    80003e98:	c6a080e7          	jalr	-918(ra) # 80002afe <myproc>
    80003e9c:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	dd0080e7          	jalr	-560(ra) # 80003c70 <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003ea8:	00006717          	auipc	a4,0x6
    80003eac:	15870713          	addi	a4,a4,344 # 8000a000 <_trampoline>
    80003eb0:	00006797          	auipc	a5,0x6
    80003eb4:	15078793          	addi	a5,a5,336 # 8000a000 <_trampoline>
    80003eb8:	8f1d                	sub	a4,a4,a5
    80003eba:	040007b7          	lui	a5,0x4000
    80003ebe:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80003ec0:	07b2                	slli	a5,a5,0xc
    80003ec2:	97ba                	add	a5,a5,a4
    80003ec4:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003ec8:	fd043503          	ld	a0,-48(s0)
    80003ecc:	00000097          	auipc	ra,0x0
    80003ed0:	d12080e7          	jalr	-750(ra) # 80003bde <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003ed4:	fd843783          	ld	a5,-40(s0)
    80003ed8:	6fa4                	ld	s1,88(a5)
    80003eda:	00000097          	auipc	ra,0x0
    80003ede:	d1e080e7          	jalr	-738(ra) # 80003bf8 <r_satp>
    80003ee2:	87aa                	mv	a5,a0
    80003ee4:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003ee6:	fd843783          	ld	a5,-40(s0)
    80003eea:	63b4                	ld	a3,64(a5)
    80003eec:	fd843783          	ld	a5,-40(s0)
    80003ef0:	6fbc                	ld	a5,88(a5)
    80003ef2:	6705                	lui	a4,0x1
    80003ef4:	9736                	add	a4,a4,a3
    80003ef6:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003ef8:	fd843783          	ld	a5,-40(s0)
    80003efc:	6fbc                	ld	a5,88(a5)
    80003efe:	00000717          	auipc	a4,0x0
    80003f02:	e2e70713          	addi	a4,a4,-466 # 80003d2c <usertrap>
    80003f06:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003f08:	fd843783          	ld	a5,-40(s0)
    80003f0c:	6fa4                	ld	s1,88(a5)
    80003f0e:	00000097          	auipc	ra,0x0
    80003f12:	db8080e7          	jalr	-584(ra) # 80003cc6 <r_tp>
    80003f16:	87aa                	mv	a5,a0
    80003f18:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003f1a:	00000097          	auipc	ra,0x0
    80003f1e:	c28080e7          	jalr	-984(ra) # 80003b42 <r_sstatus>
    80003f22:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003f26:	fc843783          	ld	a5,-56(s0)
    80003f2a:	eff7f793          	andi	a5,a5,-257
    80003f2e:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003f32:	fc843783          	ld	a5,-56(s0)
    80003f36:	0207e793          	ori	a5,a5,32
    80003f3a:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003f3e:	fc843503          	ld	a0,-56(s0)
    80003f42:	00000097          	auipc	ra,0x0
    80003f46:	c1a080e7          	jalr	-998(ra) # 80003b5c <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003f4a:	fd843783          	ld	a5,-40(s0)
    80003f4e:	6fbc                	ld	a5,88(a5)
    80003f50:	6f9c                	ld	a5,24(a5)
    80003f52:	853e                	mv	a0,a5
    80003f54:	00000097          	auipc	ra,0x0
    80003f58:	c56080e7          	jalr	-938(ra) # 80003baa <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003f5c:	fd843783          	ld	a5,-40(s0)
    80003f60:	6bbc                	ld	a5,80(a5)
    80003f62:	00c7d713          	srli	a4,a5,0xc
    80003f66:	57fd                	li	a5,-1
    80003f68:	17fe                	slli	a5,a5,0x3f
    80003f6a:	8fd9                	or	a5,a5,a4
    80003f6c:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003f70:	00006717          	auipc	a4,0x6
    80003f74:	12c70713          	addi	a4,a4,300 # 8000a09c <userret>
    80003f78:	00006797          	auipc	a5,0x6
    80003f7c:	08878793          	addi	a5,a5,136 # 8000a000 <_trampoline>
    80003f80:	8f1d                	sub	a4,a4,a5
    80003f82:	040007b7          	lui	a5,0x4000
    80003f86:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c000001>
    80003f88:	07b2                	slli	a5,a5,0xc
    80003f8a:	97ba                	add	a5,a5,a4
    80003f8c:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003f90:	fb843783          	ld	a5,-72(s0)
    80003f94:	fc043503          	ld	a0,-64(s0)
    80003f98:	9782                	jalr	a5
}
    80003f9a:	0001                	nop
    80003f9c:	60a6                	ld	ra,72(sp)
    80003f9e:	6406                	ld	s0,64(sp)
    80003fa0:	74e2                	ld	s1,56(sp)
    80003fa2:	6161                	addi	sp,sp,80
    80003fa4:	8082                	ret

0000000080003fa6 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003fa6:	7139                	addi	sp,sp,-64
    80003fa8:	fc06                	sd	ra,56(sp)
    80003faa:	f822                	sd	s0,48(sp)
    80003fac:	f426                	sd	s1,40(sp)
    80003fae:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003fb0:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003fb4:	00000097          	auipc	ra,0x0
    80003fb8:	c10080e7          	jalr	-1008(ra) # 80003bc4 <r_sepc>
    80003fbc:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003fc0:	00000097          	auipc	ra,0x0
    80003fc4:	b82080e7          	jalr	-1150(ra) # 80003b42 <r_sstatus>
    80003fc8:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003fcc:	00000097          	auipc	ra,0x0
    80003fd0:	c46080e7          	jalr	-954(ra) # 80003c12 <r_scause>
    80003fd4:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003fd8:	fc843783          	ld	a5,-56(s0)
    80003fdc:	1007f793          	andi	a5,a5,256
    80003fe0:	eb89                	bnez	a5,80003ff2 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003fe2:	00007517          	auipc	a0,0x7
    80003fe6:	36e50513          	addi	a0,a0,878 # 8000b350 <etext+0x350>
    80003fea:	ffffd097          	auipc	ra,0xffffd
    80003fee:	c9e080e7          	jalr	-866(ra) # 80000c88 <panic>
  if(intr_get() != 0)
    80003ff2:	00000097          	auipc	ra,0x0
    80003ff6:	ca6080e7          	jalr	-858(ra) # 80003c98 <intr_get>
    80003ffa:	87aa                	mv	a5,a0
    80003ffc:	cb89                	beqz	a5,8000400e <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003ffe:	00007517          	auipc	a0,0x7
    80004002:	37a50513          	addi	a0,a0,890 # 8000b378 <etext+0x378>
    80004006:	ffffd097          	auipc	ra,0xffffd
    8000400a:	c82080e7          	jalr	-894(ra) # 80000c88 <panic>

  if((which_dev = devintr()) == 0){
    8000400e:	00000097          	auipc	ra,0x0
    80004012:	118080e7          	jalr	280(ra) # 80004126 <devintr>
    80004016:	87aa                	mv	a5,a0
    80004018:	fcf42e23          	sw	a5,-36(s0)
    8000401c:	fdc42783          	lw	a5,-36(s0)
    80004020:	2781                	sext.w	a5,a5
    80004022:	e7b9                	bnez	a5,80004070 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80004024:	fc043583          	ld	a1,-64(s0)
    80004028:	00007517          	auipc	a0,0x7
    8000402c:	37050513          	addi	a0,a0,880 # 8000b398 <etext+0x398>
    80004030:	ffffd097          	auipc	ra,0xffffd
    80004034:	a02080e7          	jalr	-1534(ra) # 80000a32 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80004038:	00000097          	auipc	ra,0x0
    8000403c:	b8c080e7          	jalr	-1140(ra) # 80003bc4 <r_sepc>
    80004040:	84aa                	mv	s1,a0
    80004042:	00000097          	auipc	ra,0x0
    80004046:	bea080e7          	jalr	-1046(ra) # 80003c2c <r_stval>
    8000404a:	87aa                	mv	a5,a0
    8000404c:	863e                	mv	a2,a5
    8000404e:	85a6                	mv	a1,s1
    80004050:	00007517          	auipc	a0,0x7
    80004054:	35850513          	addi	a0,a0,856 # 8000b3a8 <etext+0x3a8>
    80004058:	ffffd097          	auipc	ra,0xffffd
    8000405c:	9da080e7          	jalr	-1574(ra) # 80000a32 <printf>
    panic("kerneltrap");
    80004060:	00007517          	auipc	a0,0x7
    80004064:	36050513          	addi	a0,a0,864 # 8000b3c0 <etext+0x3c0>
    80004068:	ffffd097          	auipc	ra,0xffffd
    8000406c:	c20080e7          	jalr	-992(ra) # 80000c88 <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80004070:	fdc42783          	lw	a5,-36(s0)
    80004074:	0007871b          	sext.w	a4,a5
    80004078:	4789                	li	a5,2
    8000407a:	02f71663          	bne	a4,a5,800040a6 <kerneltrap+0x100>
    8000407e:	fffff097          	auipc	ra,0xfffff
    80004082:	a80080e7          	jalr	-1408(ra) # 80002afe <myproc>
    80004086:	87aa                	mv	a5,a0
    80004088:	cf99                	beqz	a5,800040a6 <kerneltrap+0x100>
    8000408a:	fffff097          	auipc	ra,0xfffff
    8000408e:	a74080e7          	jalr	-1420(ra) # 80002afe <myproc>
    80004092:	87aa                	mv	a5,a0
    80004094:	4f9c                	lw	a5,24(a5)
    80004096:	873e                	mv	a4,a5
    80004098:	4791                	li	a5,4
    8000409a:	00f71663          	bne	a4,a5,800040a6 <kerneltrap+0x100>
    yield();
    8000409e:	fffff097          	auipc	ra,0xfffff
    800040a2:	588080e7          	jalr	1416(ra) # 80003626 <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    800040a6:	fd043503          	ld	a0,-48(s0)
    800040aa:	00000097          	auipc	ra,0x0
    800040ae:	b00080e7          	jalr	-1280(ra) # 80003baa <w_sepc>
  w_sstatus(sstatus);
    800040b2:	fc843503          	ld	a0,-56(s0)
    800040b6:	00000097          	auipc	ra,0x0
    800040ba:	aa6080e7          	jalr	-1370(ra) # 80003b5c <w_sstatus>
}
    800040be:	0001                	nop
    800040c0:	70e2                	ld	ra,56(sp)
    800040c2:	7442                	ld	s0,48(sp)
    800040c4:	74a2                	ld	s1,40(sp)
    800040c6:	6121                	addi	sp,sp,64
    800040c8:	8082                	ret

00000000800040ca <clockintr>:

void
clockintr()
{
    800040ca:	1141                	addi	sp,sp,-16
    800040cc:	e406                	sd	ra,8(sp)
    800040ce:	e022                	sd	s0,0(sp)
    800040d0:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    800040d2:	00018517          	auipc	a0,0x18
    800040d6:	fc650513          	addi	a0,a0,-58 # 8001c098 <tickslock>
    800040da:	ffffd097          	auipc	ra,0xffffd
    800040de:	256080e7          	jalr	598(ra) # 80001330 <acquire>
  ticks++;
    800040e2:	0000a797          	auipc	a5,0xa
    800040e6:	f1678793          	addi	a5,a5,-234 # 8000dff8 <ticks>
    800040ea:	439c                	lw	a5,0(a5)
    800040ec:	2785                	addiw	a5,a5,1
    800040ee:	0007871b          	sext.w	a4,a5
    800040f2:	0000a797          	auipc	a5,0xa
    800040f6:	f0678793          	addi	a5,a5,-250 # 8000dff8 <ticks>
    800040fa:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    800040fc:	0000a517          	auipc	a0,0xa
    80004100:	efc50513          	addi	a0,a0,-260 # 8000dff8 <ticks>
    80004104:	fffff097          	auipc	ra,0xfffff
    80004108:	638080e7          	jalr	1592(ra) # 8000373c <wakeup>
  release(&tickslock);
    8000410c:	00018517          	auipc	a0,0x18
    80004110:	f8c50513          	addi	a0,a0,-116 # 8001c098 <tickslock>
    80004114:	ffffd097          	auipc	ra,0xffffd
    80004118:	280080e7          	jalr	640(ra) # 80001394 <release>
}
    8000411c:	0001                	nop
    8000411e:	60a2                	ld	ra,8(sp)
    80004120:	6402                	ld	s0,0(sp)
    80004122:	0141                	addi	sp,sp,16
    80004124:	8082                	ret

0000000080004126 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    80004126:	1101                	addi	sp,sp,-32
    80004128:	ec06                	sd	ra,24(sp)
    8000412a:	e822                	sd	s0,16(sp)
    8000412c:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    8000412e:	00000097          	auipc	ra,0x0
    80004132:	ae4080e7          	jalr	-1308(ra) # 80003c12 <r_scause>
    80004136:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    8000413a:	fe843783          	ld	a5,-24(s0)
    8000413e:	0a07dd63          	bgez	a5,800041f8 <devintr+0xd2>
     (scause & 0xff) == 9){
    80004142:	fe843783          	ld	a5,-24(s0)
    80004146:	0ff7f713          	zext.b	a4,a5
  if((scause & 0x8000000000000000L) &&
    8000414a:	47a5                	li	a5,9
    8000414c:	0af71663          	bne	a4,a5,800041f8 <devintr+0xd2>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80004150:	00005097          	auipc	ra,0x5
    80004154:	c14080e7          	jalr	-1004(ra) # 80008d64 <plic_claim>
    80004158:	87aa                	mv	a5,a0
    8000415a:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    8000415e:	fe442783          	lw	a5,-28(s0)
    80004162:	0007871b          	sext.w	a4,a5
    80004166:	47a9                	li	a5,10
    80004168:	00f71763          	bne	a4,a5,80004176 <devintr+0x50>
      uartintr();
    8000416c:	ffffd097          	auipc	ra,0xffffd
    80004170:	ec8080e7          	jalr	-312(ra) # 80001034 <uartintr>
    80004174:	a0ad                	j	800041de <devintr+0xb8>
    } else if(irq == VIRTIO0_IRQ){
    80004176:	fe442783          	lw	a5,-28(s0)
    8000417a:	0007871b          	sext.w	a4,a5
    8000417e:	4785                	li	a5,1
    80004180:	00f71863          	bne	a4,a5,80004190 <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    80004184:	4501                	li	a0,0
    80004186:	00006097          	auipc	ra,0x6
    8000418a:	c1e080e7          	jalr	-994(ra) # 80009da4 <virtio_disk_intr>
    8000418e:	a881                	j	800041de <devintr+0xb8>
    } else if (irq >= VIRTIOX_IRQ(VIRTIO_RAID_DISK_START) && irq <= VIRTIOX_IRQ(VIRTIO_RAID_DISK_END)) {
    80004190:	fe442783          	lw	a5,-28(s0)
    80004194:	0007871b          	sext.w	a4,a5
    80004198:	4785                	li	a5,1
    8000419a:	02e7d363          	bge	a5,a4,800041c0 <devintr+0x9a>
    8000419e:	fe442783          	lw	a5,-28(s0)
    800041a2:	0007871b          	sext.w	a4,a5
    800041a6:	478d                	li	a5,3
    800041a8:	00e7cc63          	blt	a5,a4,800041c0 <devintr+0x9a>
      virtio_disk_intr(VIRTIOX_ID(irq));
    800041ac:	fe442783          	lw	a5,-28(s0)
    800041b0:	37fd                	addiw	a5,a5,-1
    800041b2:	2781                	sext.w	a5,a5
    800041b4:	853e                	mv	a0,a5
    800041b6:	00006097          	auipc	ra,0x6
    800041ba:	bee080e7          	jalr	-1042(ra) # 80009da4 <virtio_disk_intr>
    800041be:	a005                	j	800041de <devintr+0xb8>
    } else if(irq){
    800041c0:	fe442783          	lw	a5,-28(s0)
    800041c4:	2781                	sext.w	a5,a5
    800041c6:	cf81                	beqz	a5,800041de <devintr+0xb8>
      printf("unexpected interrupt irq=%d\n", irq);
    800041c8:	fe442783          	lw	a5,-28(s0)
    800041cc:	85be                	mv	a1,a5
    800041ce:	00007517          	auipc	a0,0x7
    800041d2:	20250513          	addi	a0,a0,514 # 8000b3d0 <etext+0x3d0>
    800041d6:	ffffd097          	auipc	ra,0xffffd
    800041da:	85c080e7          	jalr	-1956(ra) # 80000a32 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    800041de:	fe442783          	lw	a5,-28(s0)
    800041e2:	2781                	sext.w	a5,a5
    800041e4:	cb81                	beqz	a5,800041f4 <devintr+0xce>
      plic_complete(irq);
    800041e6:	fe442783          	lw	a5,-28(s0)
    800041ea:	853e                	mv	a0,a5
    800041ec:	00005097          	auipc	ra,0x5
    800041f0:	bb6080e7          	jalr	-1098(ra) # 80008da2 <plic_complete>

    return 1;
    800041f4:	4785                	li	a5,1
    800041f6:	a081                	j	80004236 <devintr+0x110>
  } else if(scause == 0x8000000000000001L){
    800041f8:	fe843703          	ld	a4,-24(s0)
    800041fc:	57fd                	li	a5,-1
    800041fe:	17fe                	slli	a5,a5,0x3f
    80004200:	0785                	addi	a5,a5,1
    80004202:	02f71963          	bne	a4,a5,80004234 <devintr+0x10e>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    80004206:	fffff097          	auipc	ra,0xfffff
    8000420a:	89a080e7          	jalr	-1894(ra) # 80002aa0 <cpuid>
    8000420e:	87aa                	mv	a5,a0
    80004210:	e789                	bnez	a5,8000421a <devintr+0xf4>
      clockintr();
    80004212:	00000097          	auipc	ra,0x0
    80004216:	eb8080e7          	jalr	-328(ra) # 800040ca <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    8000421a:	00000097          	auipc	ra,0x0
    8000421e:	95c080e7          	jalr	-1700(ra) # 80003b76 <r_sip>
    80004222:	87aa                	mv	a5,a0
    80004224:	9bf5                	andi	a5,a5,-3
    80004226:	853e                	mv	a0,a5
    80004228:	00000097          	auipc	ra,0x0
    8000422c:	968080e7          	jalr	-1688(ra) # 80003b90 <w_sip>

    return 2;
    80004230:	4789                	li	a5,2
    80004232:	a011                	j	80004236 <devintr+0x110>
  } else {
    return 0;
    80004234:	4781                	li	a5,0
  }
}
    80004236:	853e                	mv	a0,a5
    80004238:	60e2                	ld	ra,24(sp)
    8000423a:	6442                	ld	s0,16(sp)
    8000423c:	6105                	addi	sp,sp,32
    8000423e:	8082                	ret

0000000080004240 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    80004240:	7179                	addi	sp,sp,-48
    80004242:	f406                	sd	ra,40(sp)
    80004244:	f022                	sd	s0,32(sp)
    80004246:	1800                	addi	s0,sp,48
    80004248:	fca43c23          	sd	a0,-40(s0)
    8000424c:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80004250:	fffff097          	auipc	ra,0xfffff
    80004254:	8ae080e7          	jalr	-1874(ra) # 80002afe <myproc>
    80004258:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    8000425c:	fe843783          	ld	a5,-24(s0)
    80004260:	67bc                	ld	a5,72(a5)
    80004262:	fd843703          	ld	a4,-40(s0)
    80004266:	00f77b63          	bgeu	a4,a5,8000427c <fetchaddr+0x3c>
    8000426a:	fd843783          	ld	a5,-40(s0)
    8000426e:	00878713          	addi	a4,a5,8
    80004272:	fe843783          	ld	a5,-24(s0)
    80004276:	67bc                	ld	a5,72(a5)
    80004278:	00e7f463          	bgeu	a5,a4,80004280 <fetchaddr+0x40>
    return -1;
    8000427c:	57fd                	li	a5,-1
    8000427e:	a01d                	j	800042a4 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80004280:	fe843783          	ld	a5,-24(s0)
    80004284:	6bbc                	ld	a5,80(a5)
    80004286:	46a1                	li	a3,8
    80004288:	fd843603          	ld	a2,-40(s0)
    8000428c:	fd043583          	ld	a1,-48(s0)
    80004290:	853e                	mv	a0,a5
    80004292:	ffffe097          	auipc	ra,0xffffe
    80004296:	404080e7          	jalr	1028(ra) # 80002696 <copyin>
    8000429a:	87aa                	mv	a5,a0
    8000429c:	c399                	beqz	a5,800042a2 <fetchaddr+0x62>
    return -1;
    8000429e:	57fd                	li	a5,-1
    800042a0:	a011                	j	800042a4 <fetchaddr+0x64>
  return 0;
    800042a2:	4781                	li	a5,0
}
    800042a4:	853e                	mv	a0,a5
    800042a6:	70a2                	ld	ra,40(sp)
    800042a8:	7402                	ld	s0,32(sp)
    800042aa:	6145                	addi	sp,sp,48
    800042ac:	8082                	ret

00000000800042ae <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    800042ae:	7139                	addi	sp,sp,-64
    800042b0:	fc06                	sd	ra,56(sp)
    800042b2:	f822                	sd	s0,48(sp)
    800042b4:	0080                	addi	s0,sp,64
    800042b6:	fca43c23          	sd	a0,-40(s0)
    800042ba:	fcb43823          	sd	a1,-48(s0)
    800042be:	87b2                	mv	a5,a2
    800042c0:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    800042c4:	fffff097          	auipc	ra,0xfffff
    800042c8:	83a080e7          	jalr	-1990(ra) # 80002afe <myproc>
    800042cc:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    800042d0:	fe843783          	ld	a5,-24(s0)
    800042d4:	6bbc                	ld	a5,80(a5)
    800042d6:	fcc42703          	lw	a4,-52(s0)
    800042da:	86ba                	mv	a3,a4
    800042dc:	fd843603          	ld	a2,-40(s0)
    800042e0:	fd043583          	ld	a1,-48(s0)
    800042e4:	853e                	mv	a0,a5
    800042e6:	ffffe097          	auipc	ra,0xffffe
    800042ea:	47e080e7          	jalr	1150(ra) # 80002764 <copyinstr>
    800042ee:	87aa                	mv	a5,a0
    800042f0:	0007d463          	bgez	a5,800042f8 <fetchstr+0x4a>
    return -1;
    800042f4:	57fd                	li	a5,-1
    800042f6:	a801                	j	80004306 <fetchstr+0x58>
  return strlen(buf);
    800042f8:	fd043503          	ld	a0,-48(s0)
    800042fc:	ffffd097          	auipc	ra,0xffffd
    80004300:	6b6080e7          	jalr	1718(ra) # 800019b2 <strlen>
    80004304:	87aa                	mv	a5,a0
}
    80004306:	853e                	mv	a0,a5
    80004308:	70e2                	ld	ra,56(sp)
    8000430a:	7442                	ld	s0,48(sp)
    8000430c:	6121                	addi	sp,sp,64
    8000430e:	8082                	ret

0000000080004310 <argraw>:

static uint64
argraw(int n)
{
    80004310:	7179                	addi	sp,sp,-48
    80004312:	f406                	sd	ra,40(sp)
    80004314:	f022                	sd	s0,32(sp)
    80004316:	1800                	addi	s0,sp,48
    80004318:	87aa                	mv	a5,a0
    8000431a:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000431e:	ffffe097          	auipc	ra,0xffffe
    80004322:	7e0080e7          	jalr	2016(ra) # 80002afe <myproc>
    80004326:	fea43423          	sd	a0,-24(s0)
  switch (n) {
    8000432a:	fdc42783          	lw	a5,-36(s0)
    8000432e:	0007871b          	sext.w	a4,a5
    80004332:	4795                	li	a5,5
    80004334:	06e7e263          	bltu	a5,a4,80004398 <argraw+0x88>
    80004338:	fdc46783          	lwu	a5,-36(s0)
    8000433c:	00279713          	slli	a4,a5,0x2
    80004340:	00007797          	auipc	a5,0x7
    80004344:	0b878793          	addi	a5,a5,184 # 8000b3f8 <etext+0x3f8>
    80004348:	97ba                	add	a5,a5,a4
    8000434a:	439c                	lw	a5,0(a5)
    8000434c:	0007871b          	sext.w	a4,a5
    80004350:	00007797          	auipc	a5,0x7
    80004354:	0a878793          	addi	a5,a5,168 # 8000b3f8 <etext+0x3f8>
    80004358:	97ba                	add	a5,a5,a4
    8000435a:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    8000435c:	fe843783          	ld	a5,-24(s0)
    80004360:	6fbc                	ld	a5,88(a5)
    80004362:	7bbc                	ld	a5,112(a5)
    80004364:	a091                	j	800043a8 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004366:	fe843783          	ld	a5,-24(s0)
    8000436a:	6fbc                	ld	a5,88(a5)
    8000436c:	7fbc                	ld	a5,120(a5)
    8000436e:	a82d                	j	800043a8 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    80004370:	fe843783          	ld	a5,-24(s0)
    80004374:	6fbc                	ld	a5,88(a5)
    80004376:	63dc                	ld	a5,128(a5)
    80004378:	a805                	j	800043a8 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    8000437a:	fe843783          	ld	a5,-24(s0)
    8000437e:	6fbc                	ld	a5,88(a5)
    80004380:	67dc                	ld	a5,136(a5)
    80004382:	a01d                	j	800043a8 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004384:	fe843783          	ld	a5,-24(s0)
    80004388:	6fbc                	ld	a5,88(a5)
    8000438a:	6bdc                	ld	a5,144(a5)
    8000438c:	a831                	j	800043a8 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000438e:	fe843783          	ld	a5,-24(s0)
    80004392:	6fbc                	ld	a5,88(a5)
    80004394:	6fdc                	ld	a5,152(a5)
    80004396:	a809                	j	800043a8 <argraw+0x98>
  }
  panic("argraw");
    80004398:	00007517          	auipc	a0,0x7
    8000439c:	05850513          	addi	a0,a0,88 # 8000b3f0 <etext+0x3f0>
    800043a0:	ffffd097          	auipc	ra,0xffffd
    800043a4:	8e8080e7          	jalr	-1816(ra) # 80000c88 <panic>
  return -1;
}
    800043a8:	853e                	mv	a0,a5
    800043aa:	70a2                	ld	ra,40(sp)
    800043ac:	7402                	ld	s0,32(sp)
    800043ae:	6145                	addi	sp,sp,48
    800043b0:	8082                	ret

00000000800043b2 <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    800043b2:	1101                	addi	sp,sp,-32
    800043b4:	ec06                	sd	ra,24(sp)
    800043b6:	e822                	sd	s0,16(sp)
    800043b8:	1000                	addi	s0,sp,32
    800043ba:	87aa                	mv	a5,a0
    800043bc:	feb43023          	sd	a1,-32(s0)
    800043c0:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800043c4:	fec42783          	lw	a5,-20(s0)
    800043c8:	853e                	mv	a0,a5
    800043ca:	00000097          	auipc	ra,0x0
    800043ce:	f46080e7          	jalr	-186(ra) # 80004310 <argraw>
    800043d2:	87aa                	mv	a5,a0
    800043d4:	0007871b          	sext.w	a4,a5
    800043d8:	fe043783          	ld	a5,-32(s0)
    800043dc:	c398                	sw	a4,0(a5)
}
    800043de:	0001                	nop
    800043e0:	60e2                	ld	ra,24(sp)
    800043e2:	6442                	ld	s0,16(sp)
    800043e4:	6105                	addi	sp,sp,32
    800043e6:	8082                	ret

00000000800043e8 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    800043e8:	1101                	addi	sp,sp,-32
    800043ea:	ec06                	sd	ra,24(sp)
    800043ec:	e822                	sd	s0,16(sp)
    800043ee:	1000                	addi	s0,sp,32
    800043f0:	87aa                	mv	a5,a0
    800043f2:	feb43023          	sd	a1,-32(s0)
    800043f6:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800043fa:	fec42783          	lw	a5,-20(s0)
    800043fe:	853e                	mv	a0,a5
    80004400:	00000097          	auipc	ra,0x0
    80004404:	f10080e7          	jalr	-240(ra) # 80004310 <argraw>
    80004408:	872a                	mv	a4,a0
    8000440a:	fe043783          	ld	a5,-32(s0)
    8000440e:	e398                	sd	a4,0(a5)
}
    80004410:	0001                	nop
    80004412:	60e2                	ld	ra,24(sp)
    80004414:	6442                	ld	s0,16(sp)
    80004416:	6105                	addi	sp,sp,32
    80004418:	8082                	ret

000000008000441a <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    8000441a:	7179                	addi	sp,sp,-48
    8000441c:	f406                	sd	ra,40(sp)
    8000441e:	f022                	sd	s0,32(sp)
    80004420:	1800                	addi	s0,sp,48
    80004422:	87aa                	mv	a5,a0
    80004424:	fcb43823          	sd	a1,-48(s0)
    80004428:	8732                	mv	a4,a2
    8000442a:	fcf42e23          	sw	a5,-36(s0)
    8000442e:	87ba                	mv	a5,a4
    80004430:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    80004434:	fe840713          	addi	a4,s0,-24
    80004438:	fdc42783          	lw	a5,-36(s0)
    8000443c:	85ba                	mv	a1,a4
    8000443e:	853e                	mv	a0,a5
    80004440:	00000097          	auipc	ra,0x0
    80004444:	fa8080e7          	jalr	-88(ra) # 800043e8 <argaddr>
  return fetchstr(addr, buf, max);
    80004448:	fe843783          	ld	a5,-24(s0)
    8000444c:	fd842703          	lw	a4,-40(s0)
    80004450:	863a                	mv	a2,a4
    80004452:	fd043583          	ld	a1,-48(s0)
    80004456:	853e                	mv	a0,a5
    80004458:	00000097          	auipc	ra,0x0
    8000445c:	e56080e7          	jalr	-426(ra) # 800042ae <fetchstr>
    80004460:	87aa                	mv	a5,a0
}
    80004462:	853e                	mv	a0,a5
    80004464:	70a2                	ld	ra,40(sp)
    80004466:	7402                	ld	s0,32(sp)
    80004468:	6145                	addi	sp,sp,48
    8000446a:	8082                	ret

000000008000446c <syscall>:
[SYS_rdblk]   sys_rdblk,
};

void
syscall(void)
{
    8000446c:	7179                	addi	sp,sp,-48
    8000446e:	f406                	sd	ra,40(sp)
    80004470:	f022                	sd	s0,32(sp)
    80004472:	ec26                	sd	s1,24(sp)
    80004474:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004476:	ffffe097          	auipc	ra,0xffffe
    8000447a:	688080e7          	jalr	1672(ra) # 80002afe <myproc>
    8000447e:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80004482:	fd843783          	ld	a5,-40(s0)
    80004486:	6fbc                	ld	a5,88(a5)
    80004488:	77dc                	ld	a5,168(a5)
    8000448a:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8000448e:	fd442783          	lw	a5,-44(s0)
    80004492:	2781                	sext.w	a5,a5
    80004494:	04f05263          	blez	a5,800044d8 <syscall+0x6c>
    80004498:	fd442783          	lw	a5,-44(s0)
    8000449c:	873e                	mv	a4,a5
    8000449e:	47dd                	li	a5,23
    800044a0:	02e7ec63          	bltu	a5,a4,800044d8 <syscall+0x6c>
    800044a4:	0000a717          	auipc	a4,0xa
    800044a8:	a4470713          	addi	a4,a4,-1468 # 8000dee8 <syscalls>
    800044ac:	fd442783          	lw	a5,-44(s0)
    800044b0:	078e                	slli	a5,a5,0x3
    800044b2:	97ba                	add	a5,a5,a4
    800044b4:	639c                	ld	a5,0(a5)
    800044b6:	c38d                	beqz	a5,800044d8 <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    800044b8:	0000a717          	auipc	a4,0xa
    800044bc:	a3070713          	addi	a4,a4,-1488 # 8000dee8 <syscalls>
    800044c0:	fd442783          	lw	a5,-44(s0)
    800044c4:	078e                	slli	a5,a5,0x3
    800044c6:	97ba                	add	a5,a5,a4
    800044c8:	639c                	ld	a5,0(a5)
    800044ca:	fd843703          	ld	a4,-40(s0)
    800044ce:	6f24                	ld	s1,88(a4)
    800044d0:	9782                	jalr	a5
    800044d2:	87aa                	mv	a5,a0
    800044d4:	f8bc                	sd	a5,112(s1)
    800044d6:	a815                	j	8000450a <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800044d8:	fd843783          	ld	a5,-40(s0)
    800044dc:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    800044de:	fd843783          	ld	a5,-40(s0)
    800044e2:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800044e6:	fd442683          	lw	a3,-44(s0)
    800044ea:	863e                	mv	a2,a5
    800044ec:	85ba                	mv	a1,a4
    800044ee:	00007517          	auipc	a0,0x7
    800044f2:	f2250513          	addi	a0,a0,-222 # 8000b410 <etext+0x410>
    800044f6:	ffffc097          	auipc	ra,0xffffc
    800044fa:	53c080e7          	jalr	1340(ra) # 80000a32 <printf>
    p->trapframe->a0 = -1;
    800044fe:	fd843783          	ld	a5,-40(s0)
    80004502:	6fbc                	ld	a5,88(a5)
    80004504:	577d                	li	a4,-1
    80004506:	fbb8                	sd	a4,112(a5)
  }
}
    80004508:	0001                	nop
    8000450a:	0001                	nop
    8000450c:	70a2                	ld	ra,40(sp)
    8000450e:	7402                	ld	s0,32(sp)
    80004510:	64e2                	ld	s1,24(sp)
    80004512:	6145                	addi	sp,sp,48
    80004514:	8082                	ret

0000000080004516 <sys_exit>:
#include "proc.h"
#include "fs.h"

uint64
sys_exit(void)
{
    80004516:	1101                	addi	sp,sp,-32
    80004518:	ec06                	sd	ra,24(sp)
    8000451a:	e822                	sd	s0,16(sp)
    8000451c:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    8000451e:	fec40793          	addi	a5,s0,-20
    80004522:	85be                	mv	a1,a5
    80004524:	4501                	li	a0,0
    80004526:	00000097          	auipc	ra,0x0
    8000452a:	e8c080e7          	jalr	-372(ra) # 800043b2 <argint>
  exit(n);
    8000452e:	fec42783          	lw	a5,-20(s0)
    80004532:	853e                	mv	a0,a5
    80004534:	fffff097          	auipc	ra,0xfffff
    80004538:	cbc080e7          	jalr	-836(ra) # 800031f0 <exit>
  return 0;  // not reached
    8000453c:	4781                	li	a5,0
}
    8000453e:	853e                	mv	a0,a5
    80004540:	60e2                	ld	ra,24(sp)
    80004542:	6442                	ld	s0,16(sp)
    80004544:	6105                	addi	sp,sp,32
    80004546:	8082                	ret

0000000080004548 <sys_getpid>:

uint64
sys_getpid(void)
{
    80004548:	1141                	addi	sp,sp,-16
    8000454a:	e406                	sd	ra,8(sp)
    8000454c:	e022                	sd	s0,0(sp)
    8000454e:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80004550:	ffffe097          	auipc	ra,0xffffe
    80004554:	5ae080e7          	jalr	1454(ra) # 80002afe <myproc>
    80004558:	87aa                	mv	a5,a0
    8000455a:	5b9c                	lw	a5,48(a5)
}
    8000455c:	853e                	mv	a0,a5
    8000455e:	60a2                	ld	ra,8(sp)
    80004560:	6402                	ld	s0,0(sp)
    80004562:	0141                	addi	sp,sp,16
    80004564:	8082                	ret

0000000080004566 <sys_fork>:

uint64
sys_fork(void)
{
    80004566:	1141                	addi	sp,sp,-16
    80004568:	e406                	sd	ra,8(sp)
    8000456a:	e022                	sd	s0,0(sp)
    8000456c:	0800                	addi	s0,sp,16
  return fork();
    8000456e:	fffff097          	auipc	ra,0xfffff
    80004572:	a60080e7          	jalr	-1440(ra) # 80002fce <fork>
    80004576:	87aa                	mv	a5,a0
}
    80004578:	853e                	mv	a0,a5
    8000457a:	60a2                	ld	ra,8(sp)
    8000457c:	6402                	ld	s0,0(sp)
    8000457e:	0141                	addi	sp,sp,16
    80004580:	8082                	ret

0000000080004582 <sys_wait>:

uint64
sys_wait(void)
{
    80004582:	1101                	addi	sp,sp,-32
    80004584:	ec06                	sd	ra,24(sp)
    80004586:	e822                	sd	s0,16(sp)
    80004588:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    8000458a:	fe840793          	addi	a5,s0,-24
    8000458e:	85be                	mv	a1,a5
    80004590:	4501                	li	a0,0
    80004592:	00000097          	auipc	ra,0x0
    80004596:	e56080e7          	jalr	-426(ra) # 800043e8 <argaddr>
  return wait(p);
    8000459a:	fe843783          	ld	a5,-24(s0)
    8000459e:	853e                	mv	a0,a5
    800045a0:	fffff097          	auipc	ra,0xfffff
    800045a4:	d8c080e7          	jalr	-628(ra) # 8000332c <wait>
    800045a8:	87aa                	mv	a5,a0
}
    800045aa:	853e                	mv	a0,a5
    800045ac:	60e2                	ld	ra,24(sp)
    800045ae:	6442                	ld	s0,16(sp)
    800045b0:	6105                	addi	sp,sp,32
    800045b2:	8082                	ret

00000000800045b4 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    800045b4:	1101                	addi	sp,sp,-32
    800045b6:	ec06                	sd	ra,24(sp)
    800045b8:	e822                	sd	s0,16(sp)
    800045ba:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    800045bc:	fe440793          	addi	a5,s0,-28
    800045c0:	85be                	mv	a1,a5
    800045c2:	4501                	li	a0,0
    800045c4:	00000097          	auipc	ra,0x0
    800045c8:	dee080e7          	jalr	-530(ra) # 800043b2 <argint>
  addr = myproc()->sz;
    800045cc:	ffffe097          	auipc	ra,0xffffe
    800045d0:	532080e7          	jalr	1330(ra) # 80002afe <myproc>
    800045d4:	87aa                	mv	a5,a0
    800045d6:	67bc                	ld	a5,72(a5)
    800045d8:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    800045dc:	fe442783          	lw	a5,-28(s0)
    800045e0:	853e                	mv	a0,a5
    800045e2:	fffff097          	auipc	ra,0xfffff
    800045e6:	94c080e7          	jalr	-1716(ra) # 80002f2e <growproc>
    800045ea:	87aa                	mv	a5,a0
    800045ec:	0007d463          	bgez	a5,800045f4 <sys_sbrk+0x40>
    return -1;
    800045f0:	57fd                	li	a5,-1
    800045f2:	a019                	j	800045f8 <sys_sbrk+0x44>
  return addr;
    800045f4:	fe843783          	ld	a5,-24(s0)
}
    800045f8:	853e                	mv	a0,a5
    800045fa:	60e2                	ld	ra,24(sp)
    800045fc:	6442                	ld	s0,16(sp)
    800045fe:	6105                	addi	sp,sp,32
    80004600:	8082                	ret

0000000080004602 <sys_sleep>:

uint64
sys_sleep(void)
{
    80004602:	1101                	addi	sp,sp,-32
    80004604:	ec06                	sd	ra,24(sp)
    80004606:	e822                	sd	s0,16(sp)
    80004608:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    8000460a:	fe840793          	addi	a5,s0,-24
    8000460e:	85be                	mv	a1,a5
    80004610:	4501                	li	a0,0
    80004612:	00000097          	auipc	ra,0x0
    80004616:	da0080e7          	jalr	-608(ra) # 800043b2 <argint>
  acquire(&tickslock);
    8000461a:	00018517          	auipc	a0,0x18
    8000461e:	a7e50513          	addi	a0,a0,-1410 # 8001c098 <tickslock>
    80004622:	ffffd097          	auipc	ra,0xffffd
    80004626:	d0e080e7          	jalr	-754(ra) # 80001330 <acquire>
  ticks0 = ticks;
    8000462a:	0000a797          	auipc	a5,0xa
    8000462e:	9ce78793          	addi	a5,a5,-1586 # 8000dff8 <ticks>
    80004632:	439c                	lw	a5,0(a5)
    80004634:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    80004638:	a099                	j	8000467e <sys_sleep+0x7c>
    if(killed(myproc())){
    8000463a:	ffffe097          	auipc	ra,0xffffe
    8000463e:	4c4080e7          	jalr	1220(ra) # 80002afe <myproc>
    80004642:	87aa                	mv	a5,a0
    80004644:	853e                	mv	a0,a5
    80004646:	fffff097          	auipc	ra,0xfffff
    8000464a:	288080e7          	jalr	648(ra) # 800038ce <killed>
    8000464e:	87aa                	mv	a5,a0
    80004650:	cb99                	beqz	a5,80004666 <sys_sleep+0x64>
      release(&tickslock);
    80004652:	00018517          	auipc	a0,0x18
    80004656:	a4650513          	addi	a0,a0,-1466 # 8001c098 <tickslock>
    8000465a:	ffffd097          	auipc	ra,0xffffd
    8000465e:	d3a080e7          	jalr	-710(ra) # 80001394 <release>
      return -1;
    80004662:	57fd                	li	a5,-1
    80004664:	a0a9                	j	800046ae <sys_sleep+0xac>
    }
    sleep(&ticks, &tickslock);
    80004666:	00018597          	auipc	a1,0x18
    8000466a:	a3258593          	addi	a1,a1,-1486 # 8001c098 <tickslock>
    8000466e:	0000a517          	auipc	a0,0xa
    80004672:	98a50513          	addi	a0,a0,-1654 # 8000dff8 <ticks>
    80004676:	fffff097          	auipc	ra,0xfffff
    8000467a:	04a080e7          	jalr	74(ra) # 800036c0 <sleep>
  while(ticks - ticks0 < n){
    8000467e:	0000a797          	auipc	a5,0xa
    80004682:	97a78793          	addi	a5,a5,-1670 # 8000dff8 <ticks>
    80004686:	439c                	lw	a5,0(a5)
    80004688:	fec42703          	lw	a4,-20(s0)
    8000468c:	9f99                	subw	a5,a5,a4
    8000468e:	0007871b          	sext.w	a4,a5
    80004692:	fe842783          	lw	a5,-24(s0)
    80004696:	2781                	sext.w	a5,a5
    80004698:	faf761e3          	bltu	a4,a5,8000463a <sys_sleep+0x38>
  }
  release(&tickslock);
    8000469c:	00018517          	auipc	a0,0x18
    800046a0:	9fc50513          	addi	a0,a0,-1540 # 8001c098 <tickslock>
    800046a4:	ffffd097          	auipc	ra,0xffffd
    800046a8:	cf0080e7          	jalr	-784(ra) # 80001394 <release>
  return 0;
    800046ac:	4781                	li	a5,0
}
    800046ae:	853e                	mv	a0,a5
    800046b0:	60e2                	ld	ra,24(sp)
    800046b2:	6442                	ld	s0,16(sp)
    800046b4:	6105                	addi	sp,sp,32
    800046b6:	8082                	ret

00000000800046b8 <sys_kill>:

uint64
sys_kill(void)
{
    800046b8:	1101                	addi	sp,sp,-32
    800046ba:	ec06                	sd	ra,24(sp)
    800046bc:	e822                	sd	s0,16(sp)
    800046be:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    800046c0:	fec40793          	addi	a5,s0,-20
    800046c4:	85be                	mv	a1,a5
    800046c6:	4501                	li	a0,0
    800046c8:	00000097          	auipc	ra,0x0
    800046cc:	cea080e7          	jalr	-790(ra) # 800043b2 <argint>
  return kill(pid);
    800046d0:	fec42783          	lw	a5,-20(s0)
    800046d4:	853e                	mv	a0,a5
    800046d6:	fffff097          	auipc	ra,0xfffff
    800046da:	11e080e7          	jalr	286(ra) # 800037f4 <kill>
    800046de:	87aa                	mv	a5,a0
}
    800046e0:	853e                	mv	a0,a5
    800046e2:	60e2                	ld	ra,24(sp)
    800046e4:	6442                	ld	s0,16(sp)
    800046e6:	6105                	addi	sp,sp,32
    800046e8:	8082                	ret

00000000800046ea <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    800046ea:	1101                	addi	sp,sp,-32
    800046ec:	ec06                	sd	ra,24(sp)
    800046ee:	e822                	sd	s0,16(sp)
    800046f0:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    800046f2:	00018517          	auipc	a0,0x18
    800046f6:	9a650513          	addi	a0,a0,-1626 # 8001c098 <tickslock>
    800046fa:	ffffd097          	auipc	ra,0xffffd
    800046fe:	c36080e7          	jalr	-970(ra) # 80001330 <acquire>
  xticks = ticks;
    80004702:	0000a797          	auipc	a5,0xa
    80004706:	8f678793          	addi	a5,a5,-1802 # 8000dff8 <ticks>
    8000470a:	439c                	lw	a5,0(a5)
    8000470c:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004710:	00018517          	auipc	a0,0x18
    80004714:	98850513          	addi	a0,a0,-1656 # 8001c098 <tickslock>
    80004718:	ffffd097          	auipc	ra,0xffffd
    8000471c:	c7c080e7          	jalr	-900(ra) # 80001394 <release>
  return xticks;
    80004720:	fec46783          	lwu	a5,-20(s0)
}
    80004724:	853e                	mv	a0,a5
    80004726:	60e2                	ld	ra,24(sp)
    80004728:	6442                	ld	s0,16(sp)
    8000472a:	6105                	addi	sp,sp,32
    8000472c:	8082                	ret

000000008000472e <sys_wrtblk>:

//modification
uint64
sys_wrtblk(void){
    8000472e:	be010113          	addi	sp,sp,-1056
    80004732:	40113c23          	sd	ra,1048(sp)
    80004736:	40813823          	sd	s0,1040(sp)
    8000473a:	42010413          	addi	s0,sp,1056
    int disk_number;
    int block_number;



    argint(0, &disk_number);
    8000473e:	fec40793          	addi	a5,s0,-20
    80004742:	85be                	mv	a1,a5
    80004744:	4501                	li	a0,0
    80004746:	00000097          	auipc	ra,0x0
    8000474a:	c6c080e7          	jalr	-916(ra) # 800043b2 <argint>
    argint(1, &block_number);
    8000474e:	fe840793          	addi	a5,s0,-24
    80004752:	85be                	mv	a1,a5
    80004754:	4505                	li	a0,1
    80004756:	00000097          	auipc	ra,0x0
    8000475a:	c5c080e7          	jalr	-932(ra) # 800043b2 <argint>

    uint64 user_addr;
    argaddr(2,&user_addr);
    8000475e:	fe040793          	addi	a5,s0,-32
    80004762:	85be                	mv	a1,a5
    80004764:	4509                	li	a0,2
    80004766:	00000097          	auipc	ra,0x0
    8000476a:	c82080e7          	jalr	-894(ra) # 800043e8 <argaddr>

    uchar kernel_buffer[BSIZE];
    copyin(myproc()->pagetable,(char*)kernel_buffer,user_addr,BSIZE);
    8000476e:	ffffe097          	auipc	ra,0xffffe
    80004772:	390080e7          	jalr	912(ra) # 80002afe <myproc>
    80004776:	87aa                	mv	a5,a0
    80004778:	6bbc                	ld	a5,80(a5)
    8000477a:	fe043603          	ld	a2,-32(s0)
    8000477e:	be040713          	addi	a4,s0,-1056
    80004782:	40000693          	li	a3,1024
    80004786:	85ba                	mv	a1,a4
    80004788:	853e                	mv	a0,a5
    8000478a:	ffffe097          	auipc	ra,0xffffe
    8000478e:	f0c080e7          	jalr	-244(ra) # 80002696 <copyin>


    //printf("sys_wrtblkc %d %d %s", disk_number, block_number, kernel_buffer);


    write_block(disk_number, block_number, kernel_buffer);
    80004792:	fec42783          	lw	a5,-20(s0)
    80004796:	fe842703          	lw	a4,-24(s0)
    8000479a:	be040693          	addi	a3,s0,-1056
    8000479e:	8636                	mv	a2,a3
    800047a0:	85ba                	mv	a1,a4
    800047a2:	853e                	mv	a0,a5
    800047a4:	00005097          	auipc	ra,0x5
    800047a8:	50c080e7          	jalr	1292(ra) # 80009cb0 <write_block>
    return 0;
    800047ac:	4781                	li	a5,0

}
    800047ae:	853e                	mv	a0,a5
    800047b0:	41813083          	ld	ra,1048(sp)
    800047b4:	41013403          	ld	s0,1040(sp)
    800047b8:	42010113          	addi	sp,sp,1056
    800047bc:	8082                	ret

00000000800047be <sys_rdblk>:

uint64
sys_rdblk(void)
{
    800047be:	be010113          	addi	sp,sp,-1056
    800047c2:	40113c23          	sd	ra,1048(sp)
    800047c6:	40813823          	sd	s0,1040(sp)
    800047ca:	42010413          	addi	s0,sp,1056
    int disk_number;
    int block_number;


    argint(0, &disk_number);
    800047ce:	fec40793          	addi	a5,s0,-20
    800047d2:	85be                	mv	a1,a5
    800047d4:	4501                	li	a0,0
    800047d6:	00000097          	auipc	ra,0x0
    800047da:	bdc080e7          	jalr	-1060(ra) # 800043b2 <argint>
    argint(1, &block_number);
    800047de:	fe840793          	addi	a5,s0,-24
    800047e2:	85be                	mv	a1,a5
    800047e4:	4505                	li	a0,1
    800047e6:	00000097          	auipc	ra,0x0
    800047ea:	bcc080e7          	jalr	-1076(ra) # 800043b2 <argint>

    uint64 user_addr;
    argaddr(2,&user_addr);
    800047ee:	fe040793          	addi	a5,s0,-32
    800047f2:	85be                	mv	a1,a5
    800047f4:	4509                	li	a0,2
    800047f6:	00000097          	auipc	ra,0x0
    800047fa:	bf2080e7          	jalr	-1038(ra) # 800043e8 <argaddr>

    uchar kernel_buffer[BSIZE];

    read_block(disk_number,block_number,kernel_buffer);
    800047fe:	fec42783          	lw	a5,-20(s0)
    80004802:	fe842703          	lw	a4,-24(s0)
    80004806:	be040693          	addi	a3,s0,-1056
    8000480a:	8636                	mv	a2,a3
    8000480c:	85ba                	mv	a1,a4
    8000480e:	853e                	mv	a0,a5
    80004810:	00005097          	auipc	ra,0x5
    80004814:	522080e7          	jalr	1314(ra) # 80009d32 <read_block>
    copyout(myproc()->pagetable,user_addr,(char*) kernel_buffer,BSIZE);
    80004818:	ffffe097          	auipc	ra,0xffffe
    8000481c:	2e6080e7          	jalr	742(ra) # 80002afe <myproc>
    80004820:	87aa                	mv	a5,a0
    80004822:	6bbc                	ld	a5,80(a5)
    80004824:	fe043703          	ld	a4,-32(s0)
    80004828:	be040613          	addi	a2,s0,-1056
    8000482c:	40000693          	li	a3,1024
    80004830:	85ba                	mv	a1,a4
    80004832:	853e                	mv	a0,a5
    80004834:	ffffe097          	auipc	ra,0xffffe
    80004838:	d94080e7          	jalr	-620(ra) # 800025c8 <copyout>


    return 0;
    8000483c:	4781                	li	a5,0
}
    8000483e:	853e                	mv	a0,a5
    80004840:	41813083          	ld	ra,1048(sp)
    80004844:	41013403          	ld	s0,1040(sp)
    80004848:	42010113          	addi	sp,sp,1056
    8000484c:	8082                	ret

000000008000484e <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    8000484e:	1101                	addi	sp,sp,-32
    80004850:	ec06                	sd	ra,24(sp)
    80004852:	e822                	sd	s0,16(sp)
    80004854:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80004856:	00007597          	auipc	a1,0x7
    8000485a:	bda58593          	addi	a1,a1,-1062 # 8000b430 <etext+0x430>
    8000485e:	00018517          	auipc	a0,0x18
    80004862:	85250513          	addi	a0,a0,-1966 # 8001c0b0 <bcache>
    80004866:	ffffd097          	auipc	ra,0xffffd
    8000486a:	a9a080e7          	jalr	-1382(ra) # 80001300 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    8000486e:	00018717          	auipc	a4,0x18
    80004872:	84270713          	addi	a4,a4,-1982 # 8001c0b0 <bcache>
    80004876:	67a1                	lui	a5,0x8
    80004878:	97ba                	add	a5,a5,a4
    8000487a:	00020717          	auipc	a4,0x20
    8000487e:	a9e70713          	addi	a4,a4,-1378 # 80024318 <bcache+0x8268>
    80004882:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    80004886:	00018717          	auipc	a4,0x18
    8000488a:	82a70713          	addi	a4,a4,-2006 # 8001c0b0 <bcache>
    8000488e:	67a1                	lui	a5,0x8
    80004890:	97ba                	add	a5,a5,a4
    80004892:	00020717          	auipc	a4,0x20
    80004896:	a8670713          	addi	a4,a4,-1402 # 80024318 <bcache+0x8268>
    8000489a:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000489e:	00018797          	auipc	a5,0x18
    800048a2:	82a78793          	addi	a5,a5,-2006 # 8001c0c8 <bcache+0x18>
    800048a6:	fef43423          	sd	a5,-24(s0)
    800048aa:	a895                	j	8000491e <binit+0xd0>
    b->next = bcache.head.next;
    800048ac:	00018717          	auipc	a4,0x18
    800048b0:	80470713          	addi	a4,a4,-2044 # 8001c0b0 <bcache>
    800048b4:	67a1                	lui	a5,0x8
    800048b6:	97ba                	add	a5,a5,a4
    800048b8:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    800048bc:	fe843783          	ld	a5,-24(s0)
    800048c0:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    800048c2:	fe843783          	ld	a5,-24(s0)
    800048c6:	00020717          	auipc	a4,0x20
    800048ca:	a5270713          	addi	a4,a4,-1454 # 80024318 <bcache+0x8268>
    800048ce:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    800048d0:	fe843783          	ld	a5,-24(s0)
    800048d4:	07c1                	addi	a5,a5,16
    800048d6:	00007597          	auipc	a1,0x7
    800048da:	b6258593          	addi	a1,a1,-1182 # 8000b438 <etext+0x438>
    800048de:	853e                	mv	a0,a5
    800048e0:	00002097          	auipc	ra,0x2
    800048e4:	022080e7          	jalr	34(ra) # 80006902 <initsleeplock>
    bcache.head.next->prev = b;
    800048e8:	00017717          	auipc	a4,0x17
    800048ec:	7c870713          	addi	a4,a4,1992 # 8001c0b0 <bcache>
    800048f0:	67a1                	lui	a5,0x8
    800048f2:	97ba                	add	a5,a5,a4
    800048f4:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800048f8:	fe843703          	ld	a4,-24(s0)
    800048fc:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    800048fe:	00017717          	auipc	a4,0x17
    80004902:	7b270713          	addi	a4,a4,1970 # 8001c0b0 <bcache>
    80004906:	67a1                	lui	a5,0x8
    80004908:	97ba                	add	a5,a5,a4
    8000490a:	fe843703          	ld	a4,-24(s0)
    8000490e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004912:	fe843783          	ld	a5,-24(s0)
    80004916:	45878793          	addi	a5,a5,1112
    8000491a:	fef43423          	sd	a5,-24(s0)
    8000491e:	00020797          	auipc	a5,0x20
    80004922:	9fa78793          	addi	a5,a5,-1542 # 80024318 <bcache+0x8268>
    80004926:	fe843703          	ld	a4,-24(s0)
    8000492a:	f8f761e3          	bltu	a4,a5,800048ac <binit+0x5e>
  }
}
    8000492e:	0001                	nop
    80004930:	0001                	nop
    80004932:	60e2                	ld	ra,24(sp)
    80004934:	6442                	ld	s0,16(sp)
    80004936:	6105                	addi	sp,sp,32
    80004938:	8082                	ret

000000008000493a <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    8000493a:	7179                	addi	sp,sp,-48
    8000493c:	f406                	sd	ra,40(sp)
    8000493e:	f022                	sd	s0,32(sp)
    80004940:	1800                	addi	s0,sp,48
    80004942:	87aa                	mv	a5,a0
    80004944:	872e                	mv	a4,a1
    80004946:	fcf42e23          	sw	a5,-36(s0)
    8000494a:	87ba                	mv	a5,a4
    8000494c:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80004950:	00017517          	auipc	a0,0x17
    80004954:	76050513          	addi	a0,a0,1888 # 8001c0b0 <bcache>
    80004958:	ffffd097          	auipc	ra,0xffffd
    8000495c:	9d8080e7          	jalr	-1576(ra) # 80001330 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004960:	00017717          	auipc	a4,0x17
    80004964:	75070713          	addi	a4,a4,1872 # 8001c0b0 <bcache>
    80004968:	67a1                	lui	a5,0x8
    8000496a:	97ba                	add	a5,a5,a4
    8000496c:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004970:	fef43423          	sd	a5,-24(s0)
    80004974:	a095                	j	800049d8 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    80004976:	fe843783          	ld	a5,-24(s0)
    8000497a:	4798                	lw	a4,8(a5)
    8000497c:	fdc42783          	lw	a5,-36(s0)
    80004980:	2781                	sext.w	a5,a5
    80004982:	04e79663          	bne	a5,a4,800049ce <bget+0x94>
    80004986:	fe843783          	ld	a5,-24(s0)
    8000498a:	47d8                	lw	a4,12(a5)
    8000498c:	fd842783          	lw	a5,-40(s0)
    80004990:	2781                	sext.w	a5,a5
    80004992:	02e79e63          	bne	a5,a4,800049ce <bget+0x94>
      b->refcnt++;
    80004996:	fe843783          	ld	a5,-24(s0)
    8000499a:	43bc                	lw	a5,64(a5)
    8000499c:	2785                	addiw	a5,a5,1
    8000499e:	0007871b          	sext.w	a4,a5
    800049a2:	fe843783          	ld	a5,-24(s0)
    800049a6:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800049a8:	00017517          	auipc	a0,0x17
    800049ac:	70850513          	addi	a0,a0,1800 # 8001c0b0 <bcache>
    800049b0:	ffffd097          	auipc	ra,0xffffd
    800049b4:	9e4080e7          	jalr	-1564(ra) # 80001394 <release>
      acquiresleep(&b->lock);
    800049b8:	fe843783          	ld	a5,-24(s0)
    800049bc:	07c1                	addi	a5,a5,16
    800049be:	853e                	mv	a0,a5
    800049c0:	00002097          	auipc	ra,0x2
    800049c4:	f8e080e7          	jalr	-114(ra) # 8000694e <acquiresleep>
      return b;
    800049c8:	fe843783          	ld	a5,-24(s0)
    800049cc:	a07d                	j	80004a7a <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800049ce:	fe843783          	ld	a5,-24(s0)
    800049d2:	6bbc                	ld	a5,80(a5)
    800049d4:	fef43423          	sd	a5,-24(s0)
    800049d8:	fe843703          	ld	a4,-24(s0)
    800049dc:	00020797          	auipc	a5,0x20
    800049e0:	93c78793          	addi	a5,a5,-1732 # 80024318 <bcache+0x8268>
    800049e4:	f8f719e3          	bne	a4,a5,80004976 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800049e8:	00017717          	auipc	a4,0x17
    800049ec:	6c870713          	addi	a4,a4,1736 # 8001c0b0 <bcache>
    800049f0:	67a1                	lui	a5,0x8
    800049f2:	97ba                	add	a5,a5,a4
    800049f4:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    800049f8:	fef43423          	sd	a5,-24(s0)
    800049fc:	a8b9                	j	80004a5a <bget+0x120>
    if(b->refcnt == 0) {
    800049fe:	fe843783          	ld	a5,-24(s0)
    80004a02:	43bc                	lw	a5,64(a5)
    80004a04:	e7b1                	bnez	a5,80004a50 <bget+0x116>
      b->dev = dev;
    80004a06:	fe843783          	ld	a5,-24(s0)
    80004a0a:	fdc42703          	lw	a4,-36(s0)
    80004a0e:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004a10:	fe843783          	ld	a5,-24(s0)
    80004a14:	fd842703          	lw	a4,-40(s0)
    80004a18:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80004a1a:	fe843783          	ld	a5,-24(s0)
    80004a1e:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80004a22:	fe843783          	ld	a5,-24(s0)
    80004a26:	4705                	li	a4,1
    80004a28:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004a2a:	00017517          	auipc	a0,0x17
    80004a2e:	68650513          	addi	a0,a0,1670 # 8001c0b0 <bcache>
    80004a32:	ffffd097          	auipc	ra,0xffffd
    80004a36:	962080e7          	jalr	-1694(ra) # 80001394 <release>
      acquiresleep(&b->lock);
    80004a3a:	fe843783          	ld	a5,-24(s0)
    80004a3e:	07c1                	addi	a5,a5,16
    80004a40:	853e                	mv	a0,a5
    80004a42:	00002097          	auipc	ra,0x2
    80004a46:	f0c080e7          	jalr	-244(ra) # 8000694e <acquiresleep>
      return b;
    80004a4a:	fe843783          	ld	a5,-24(s0)
    80004a4e:	a035                	j	80004a7a <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004a50:	fe843783          	ld	a5,-24(s0)
    80004a54:	67bc                	ld	a5,72(a5)
    80004a56:	fef43423          	sd	a5,-24(s0)
    80004a5a:	fe843703          	ld	a4,-24(s0)
    80004a5e:	00020797          	auipc	a5,0x20
    80004a62:	8ba78793          	addi	a5,a5,-1862 # 80024318 <bcache+0x8268>
    80004a66:	f8f71ce3          	bne	a4,a5,800049fe <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    80004a6a:	00007517          	auipc	a0,0x7
    80004a6e:	9d650513          	addi	a0,a0,-1578 # 8000b440 <etext+0x440>
    80004a72:	ffffc097          	auipc	ra,0xffffc
    80004a76:	216080e7          	jalr	534(ra) # 80000c88 <panic>
}
    80004a7a:	853e                	mv	a0,a5
    80004a7c:	70a2                	ld	ra,40(sp)
    80004a7e:	7402                	ld	s0,32(sp)
    80004a80:	6145                	addi	sp,sp,48
    80004a82:	8082                	ret

0000000080004a84 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004a84:	7179                	addi	sp,sp,-48
    80004a86:	f406                	sd	ra,40(sp)
    80004a88:	f022                	sd	s0,32(sp)
    80004a8a:	1800                	addi	s0,sp,48
    80004a8c:	87aa                	mv	a5,a0
    80004a8e:	872e                	mv	a4,a1
    80004a90:	fcf42e23          	sw	a5,-36(s0)
    80004a94:	87ba                	mv	a5,a4
    80004a96:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004a9a:	fd842703          	lw	a4,-40(s0)
    80004a9e:	fdc42783          	lw	a5,-36(s0)
    80004aa2:	85ba                	mv	a1,a4
    80004aa4:	853e                	mv	a0,a5
    80004aa6:	00000097          	auipc	ra,0x0
    80004aaa:	e94080e7          	jalr	-364(ra) # 8000493a <bget>
    80004aae:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004ab2:	fe843783          	ld	a5,-24(s0)
    80004ab6:	439c                	lw	a5,0(a5)
    80004ab8:	ef89                	bnez	a5,80004ad2 <bread+0x4e>
    virtio_disk_rw(VIRTIO0_ID, b, 0);
    80004aba:	4601                	li	a2,0
    80004abc:	fe843583          	ld	a1,-24(s0)
    80004ac0:	4501                	li	a0,0
    80004ac2:	00005097          	auipc	ra,0x5
    80004ac6:	cd6080e7          	jalr	-810(ra) # 80009798 <virtio_disk_rw>
    b->valid = 1;
    80004aca:	fe843783          	ld	a5,-24(s0)
    80004ace:	4705                	li	a4,1
    80004ad0:	c398                	sw	a4,0(a5)
  }
  return b;
    80004ad2:	fe843783          	ld	a5,-24(s0)
}
    80004ad6:	853e                	mv	a0,a5
    80004ad8:	70a2                	ld	ra,40(sp)
    80004ada:	7402                	ld	s0,32(sp)
    80004adc:	6145                	addi	sp,sp,48
    80004ade:	8082                	ret

0000000080004ae0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004ae0:	1101                	addi	sp,sp,-32
    80004ae2:	ec06                	sd	ra,24(sp)
    80004ae4:	e822                	sd	s0,16(sp)
    80004ae6:	1000                	addi	s0,sp,32
    80004ae8:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004aec:	fe843783          	ld	a5,-24(s0)
    80004af0:	07c1                	addi	a5,a5,16
    80004af2:	853e                	mv	a0,a5
    80004af4:	00002097          	auipc	ra,0x2
    80004af8:	f1a080e7          	jalr	-230(ra) # 80006a0e <holdingsleep>
    80004afc:	87aa                	mv	a5,a0
    80004afe:	eb89                	bnez	a5,80004b10 <bwrite+0x30>
    panic("bwrite");
    80004b00:	00007517          	auipc	a0,0x7
    80004b04:	95850513          	addi	a0,a0,-1704 # 8000b458 <etext+0x458>
    80004b08:	ffffc097          	auipc	ra,0xffffc
    80004b0c:	180080e7          	jalr	384(ra) # 80000c88 <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1);
    80004b10:	4605                	li	a2,1
    80004b12:	fe843583          	ld	a1,-24(s0)
    80004b16:	4501                	li	a0,0
    80004b18:	00005097          	auipc	ra,0x5
    80004b1c:	c80080e7          	jalr	-896(ra) # 80009798 <virtio_disk_rw>
}
    80004b20:	0001                	nop
    80004b22:	60e2                	ld	ra,24(sp)
    80004b24:	6442                	ld	s0,16(sp)
    80004b26:	6105                	addi	sp,sp,32
    80004b28:	8082                	ret

0000000080004b2a <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004b2a:	1101                	addi	sp,sp,-32
    80004b2c:	ec06                	sd	ra,24(sp)
    80004b2e:	e822                	sd	s0,16(sp)
    80004b30:	1000                	addi	s0,sp,32
    80004b32:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004b36:	fe843783          	ld	a5,-24(s0)
    80004b3a:	07c1                	addi	a5,a5,16
    80004b3c:	853e                	mv	a0,a5
    80004b3e:	00002097          	auipc	ra,0x2
    80004b42:	ed0080e7          	jalr	-304(ra) # 80006a0e <holdingsleep>
    80004b46:	87aa                	mv	a5,a0
    80004b48:	eb89                	bnez	a5,80004b5a <brelse+0x30>
    panic("brelse");
    80004b4a:	00007517          	auipc	a0,0x7
    80004b4e:	91650513          	addi	a0,a0,-1770 # 8000b460 <etext+0x460>
    80004b52:	ffffc097          	auipc	ra,0xffffc
    80004b56:	136080e7          	jalr	310(ra) # 80000c88 <panic>

  releasesleep(&b->lock);
    80004b5a:	fe843783          	ld	a5,-24(s0)
    80004b5e:	07c1                	addi	a5,a5,16
    80004b60:	853e                	mv	a0,a5
    80004b62:	00002097          	auipc	ra,0x2
    80004b66:	e5a080e7          	jalr	-422(ra) # 800069bc <releasesleep>

  acquire(&bcache.lock);
    80004b6a:	00017517          	auipc	a0,0x17
    80004b6e:	54650513          	addi	a0,a0,1350 # 8001c0b0 <bcache>
    80004b72:	ffffc097          	auipc	ra,0xffffc
    80004b76:	7be080e7          	jalr	1982(ra) # 80001330 <acquire>
  b->refcnt--;
    80004b7a:	fe843783          	ld	a5,-24(s0)
    80004b7e:	43bc                	lw	a5,64(a5)
    80004b80:	37fd                	addiw	a5,a5,-1
    80004b82:	0007871b          	sext.w	a4,a5
    80004b86:	fe843783          	ld	a5,-24(s0)
    80004b8a:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004b8c:	fe843783          	ld	a5,-24(s0)
    80004b90:	43bc                	lw	a5,64(a5)
    80004b92:	e7b5                	bnez	a5,80004bfe <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004b94:	fe843783          	ld	a5,-24(s0)
    80004b98:	6bbc                	ld	a5,80(a5)
    80004b9a:	fe843703          	ld	a4,-24(s0)
    80004b9e:	6738                	ld	a4,72(a4)
    80004ba0:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004ba2:	fe843783          	ld	a5,-24(s0)
    80004ba6:	67bc                	ld	a5,72(a5)
    80004ba8:	fe843703          	ld	a4,-24(s0)
    80004bac:	6b38                	ld	a4,80(a4)
    80004bae:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004bb0:	00017717          	auipc	a4,0x17
    80004bb4:	50070713          	addi	a4,a4,1280 # 8001c0b0 <bcache>
    80004bb8:	67a1                	lui	a5,0x8
    80004bba:	97ba                	add	a5,a5,a4
    80004bbc:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004bc0:	fe843783          	ld	a5,-24(s0)
    80004bc4:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004bc6:	fe843783          	ld	a5,-24(s0)
    80004bca:	0001f717          	auipc	a4,0x1f
    80004bce:	74e70713          	addi	a4,a4,1870 # 80024318 <bcache+0x8268>
    80004bd2:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004bd4:	00017717          	auipc	a4,0x17
    80004bd8:	4dc70713          	addi	a4,a4,1244 # 8001c0b0 <bcache>
    80004bdc:	67a1                	lui	a5,0x8
    80004bde:	97ba                	add	a5,a5,a4
    80004be0:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004be4:	fe843703          	ld	a4,-24(s0)
    80004be8:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004bea:	00017717          	auipc	a4,0x17
    80004bee:	4c670713          	addi	a4,a4,1222 # 8001c0b0 <bcache>
    80004bf2:	67a1                	lui	a5,0x8
    80004bf4:	97ba                	add	a5,a5,a4
    80004bf6:	fe843703          	ld	a4,-24(s0)
    80004bfa:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004bfe:	00017517          	auipc	a0,0x17
    80004c02:	4b250513          	addi	a0,a0,1202 # 8001c0b0 <bcache>
    80004c06:	ffffc097          	auipc	ra,0xffffc
    80004c0a:	78e080e7          	jalr	1934(ra) # 80001394 <release>
}
    80004c0e:	0001                	nop
    80004c10:	60e2                	ld	ra,24(sp)
    80004c12:	6442                	ld	s0,16(sp)
    80004c14:	6105                	addi	sp,sp,32
    80004c16:	8082                	ret

0000000080004c18 <bpin>:

void
bpin(struct buf *b) {
    80004c18:	1101                	addi	sp,sp,-32
    80004c1a:	ec06                	sd	ra,24(sp)
    80004c1c:	e822                	sd	s0,16(sp)
    80004c1e:	1000                	addi	s0,sp,32
    80004c20:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004c24:	00017517          	auipc	a0,0x17
    80004c28:	48c50513          	addi	a0,a0,1164 # 8001c0b0 <bcache>
    80004c2c:	ffffc097          	auipc	ra,0xffffc
    80004c30:	704080e7          	jalr	1796(ra) # 80001330 <acquire>
  b->refcnt++;
    80004c34:	fe843783          	ld	a5,-24(s0)
    80004c38:	43bc                	lw	a5,64(a5)
    80004c3a:	2785                	addiw	a5,a5,1
    80004c3c:	0007871b          	sext.w	a4,a5
    80004c40:	fe843783          	ld	a5,-24(s0)
    80004c44:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004c46:	00017517          	auipc	a0,0x17
    80004c4a:	46a50513          	addi	a0,a0,1130 # 8001c0b0 <bcache>
    80004c4e:	ffffc097          	auipc	ra,0xffffc
    80004c52:	746080e7          	jalr	1862(ra) # 80001394 <release>
}
    80004c56:	0001                	nop
    80004c58:	60e2                	ld	ra,24(sp)
    80004c5a:	6442                	ld	s0,16(sp)
    80004c5c:	6105                	addi	sp,sp,32
    80004c5e:	8082                	ret

0000000080004c60 <bunpin>:

void
bunpin(struct buf *b) {
    80004c60:	1101                	addi	sp,sp,-32
    80004c62:	ec06                	sd	ra,24(sp)
    80004c64:	e822                	sd	s0,16(sp)
    80004c66:	1000                	addi	s0,sp,32
    80004c68:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004c6c:	00017517          	auipc	a0,0x17
    80004c70:	44450513          	addi	a0,a0,1092 # 8001c0b0 <bcache>
    80004c74:	ffffc097          	auipc	ra,0xffffc
    80004c78:	6bc080e7          	jalr	1724(ra) # 80001330 <acquire>
  b->refcnt--;
    80004c7c:	fe843783          	ld	a5,-24(s0)
    80004c80:	43bc                	lw	a5,64(a5)
    80004c82:	37fd                	addiw	a5,a5,-1
    80004c84:	0007871b          	sext.w	a4,a5
    80004c88:	fe843783          	ld	a5,-24(s0)
    80004c8c:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004c8e:	00017517          	auipc	a0,0x17
    80004c92:	42250513          	addi	a0,a0,1058 # 8001c0b0 <bcache>
    80004c96:	ffffc097          	auipc	ra,0xffffc
    80004c9a:	6fe080e7          	jalr	1790(ra) # 80001394 <release>
}
    80004c9e:	0001                	nop
    80004ca0:	60e2                	ld	ra,24(sp)
    80004ca2:	6442                	ld	s0,16(sp)
    80004ca4:	6105                	addi	sp,sp,32
    80004ca6:	8082                	ret

0000000080004ca8 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004ca8:	7179                	addi	sp,sp,-48
    80004caa:	f406                	sd	ra,40(sp)
    80004cac:	f022                	sd	s0,32(sp)
    80004cae:	1800                	addi	s0,sp,48
    80004cb0:	87aa                	mv	a5,a0
    80004cb2:	fcb43823          	sd	a1,-48(s0)
    80004cb6:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004cba:	fdc42783          	lw	a5,-36(s0)
    80004cbe:	4585                	li	a1,1
    80004cc0:	853e                	mv	a0,a5
    80004cc2:	00000097          	auipc	ra,0x0
    80004cc6:	dc2080e7          	jalr	-574(ra) # 80004a84 <bread>
    80004cca:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004cce:	fe843783          	ld	a5,-24(s0)
    80004cd2:	05878793          	addi	a5,a5,88
    80004cd6:	02000613          	li	a2,32
    80004cda:	85be                	mv	a1,a5
    80004cdc:	fd043503          	ld	a0,-48(s0)
    80004ce0:	ffffd097          	auipc	ra,0xffffd
    80004ce4:	908080e7          	jalr	-1784(ra) # 800015e8 <memmove>
  brelse(bp);
    80004ce8:	fe843503          	ld	a0,-24(s0)
    80004cec:	00000097          	auipc	ra,0x0
    80004cf0:	e3e080e7          	jalr	-450(ra) # 80004b2a <brelse>
}
    80004cf4:	0001                	nop
    80004cf6:	70a2                	ld	ra,40(sp)
    80004cf8:	7402                	ld	s0,32(sp)
    80004cfa:	6145                	addi	sp,sp,48
    80004cfc:	8082                	ret

0000000080004cfe <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004cfe:	1101                	addi	sp,sp,-32
    80004d00:	ec06                	sd	ra,24(sp)
    80004d02:	e822                	sd	s0,16(sp)
    80004d04:	1000                	addi	s0,sp,32
    80004d06:	87aa                	mv	a5,a0
    80004d08:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004d0c:	fec42783          	lw	a5,-20(s0)
    80004d10:	00020597          	auipc	a1,0x20
    80004d14:	a6058593          	addi	a1,a1,-1440 # 80024770 <sb>
    80004d18:	853e                	mv	a0,a5
    80004d1a:	00000097          	auipc	ra,0x0
    80004d1e:	f8e080e7          	jalr	-114(ra) # 80004ca8 <readsb>
  if(sb.magic != FSMAGIC)
    80004d22:	00020797          	auipc	a5,0x20
    80004d26:	a4e78793          	addi	a5,a5,-1458 # 80024770 <sb>
    80004d2a:	439c                	lw	a5,0(a5)
    80004d2c:	873e                	mv	a4,a5
    80004d2e:	102037b7          	lui	a5,0x10203
    80004d32:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004d36:	00f70a63          	beq	a4,a5,80004d4a <fsinit+0x4c>
    panic("invalid file system");
    80004d3a:	00006517          	auipc	a0,0x6
    80004d3e:	72e50513          	addi	a0,a0,1838 # 8000b468 <etext+0x468>
    80004d42:	ffffc097          	auipc	ra,0xffffc
    80004d46:	f46080e7          	jalr	-186(ra) # 80000c88 <panic>
  initlog(dev, &sb);
    80004d4a:	fec42783          	lw	a5,-20(s0)
    80004d4e:	00020597          	auipc	a1,0x20
    80004d52:	a2258593          	addi	a1,a1,-1502 # 80024770 <sb>
    80004d56:	853e                	mv	a0,a5
    80004d58:	00001097          	auipc	ra,0x1
    80004d5c:	48e080e7          	jalr	1166(ra) # 800061e6 <initlog>
}
    80004d60:	0001                	nop
    80004d62:	60e2                	ld	ra,24(sp)
    80004d64:	6442                	ld	s0,16(sp)
    80004d66:	6105                	addi	sp,sp,32
    80004d68:	8082                	ret

0000000080004d6a <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004d6a:	7179                	addi	sp,sp,-48
    80004d6c:	f406                	sd	ra,40(sp)
    80004d6e:	f022                	sd	s0,32(sp)
    80004d70:	1800                	addi	s0,sp,48
    80004d72:	87aa                	mv	a5,a0
    80004d74:	872e                	mv	a4,a1
    80004d76:	fcf42e23          	sw	a5,-36(s0)
    80004d7a:	87ba                	mv	a5,a4
    80004d7c:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004d80:	fdc42783          	lw	a5,-36(s0)
    80004d84:	fd842703          	lw	a4,-40(s0)
    80004d88:	85ba                	mv	a1,a4
    80004d8a:	853e                	mv	a0,a5
    80004d8c:	00000097          	auipc	ra,0x0
    80004d90:	cf8080e7          	jalr	-776(ra) # 80004a84 <bread>
    80004d94:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004d98:	fe843783          	ld	a5,-24(s0)
    80004d9c:	05878793          	addi	a5,a5,88
    80004da0:	40000613          	li	a2,1024
    80004da4:	4581                	li	a1,0
    80004da6:	853e                	mv	a0,a5
    80004da8:	ffffc097          	auipc	ra,0xffffc
    80004dac:	75c080e7          	jalr	1884(ra) # 80001504 <memset>
  log_write(bp);
    80004db0:	fe843503          	ld	a0,-24(s0)
    80004db4:	00002097          	auipc	ra,0x2
    80004db8:	a1a080e7          	jalr	-1510(ra) # 800067ce <log_write>
  brelse(bp);
    80004dbc:	fe843503          	ld	a0,-24(s0)
    80004dc0:	00000097          	auipc	ra,0x0
    80004dc4:	d6a080e7          	jalr	-662(ra) # 80004b2a <brelse>
}
    80004dc8:	0001                	nop
    80004dca:	70a2                	ld	ra,40(sp)
    80004dcc:	7402                	ld	s0,32(sp)
    80004dce:	6145                	addi	sp,sp,48
    80004dd0:	8082                	ret

0000000080004dd2 <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80004dd2:	7139                	addi	sp,sp,-64
    80004dd4:	fc06                	sd	ra,56(sp)
    80004dd6:	f822                	sd	s0,48(sp)
    80004dd8:	0080                	addi	s0,sp,64
    80004dda:	87aa                	mv	a5,a0
    80004ddc:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004de0:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004de4:	fe042623          	sw	zero,-20(s0)
    80004de8:	a295                	j	80004f4c <balloc+0x17a>
    bp = bread(dev, BBLOCK(b, sb));
    80004dea:	fec42783          	lw	a5,-20(s0)
    80004dee:	41f7d71b          	sraiw	a4,a5,0x1f
    80004df2:	0137571b          	srliw	a4,a4,0x13
    80004df6:	9fb9                	addw	a5,a5,a4
    80004df8:	40d7d79b          	sraiw	a5,a5,0xd
    80004dfc:	2781                	sext.w	a5,a5
    80004dfe:	0007871b          	sext.w	a4,a5
    80004e02:	00020797          	auipc	a5,0x20
    80004e06:	96e78793          	addi	a5,a5,-1682 # 80024770 <sb>
    80004e0a:	4fdc                	lw	a5,28(a5)
    80004e0c:	9fb9                	addw	a5,a5,a4
    80004e0e:	0007871b          	sext.w	a4,a5
    80004e12:	fcc42783          	lw	a5,-52(s0)
    80004e16:	85ba                	mv	a1,a4
    80004e18:	853e                	mv	a0,a5
    80004e1a:	00000097          	auipc	ra,0x0
    80004e1e:	c6a080e7          	jalr	-918(ra) # 80004a84 <bread>
    80004e22:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004e26:	fe042423          	sw	zero,-24(s0)
    80004e2a:	a8e9                	j	80004f04 <balloc+0x132>
      m = 1 << (bi % 8);
    80004e2c:	fe842783          	lw	a5,-24(s0)
    80004e30:	8b9d                	andi	a5,a5,7
    80004e32:	2781                	sext.w	a5,a5
    80004e34:	4705                	li	a4,1
    80004e36:	00f717bb          	sllw	a5,a4,a5
    80004e3a:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004e3e:	fe842783          	lw	a5,-24(s0)
    80004e42:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e46:	01d7571b          	srliw	a4,a4,0x1d
    80004e4a:	9fb9                	addw	a5,a5,a4
    80004e4c:	4037d79b          	sraiw	a5,a5,0x3
    80004e50:	2781                	sext.w	a5,a5
    80004e52:	fe043703          	ld	a4,-32(s0)
    80004e56:	97ba                	add	a5,a5,a4
    80004e58:	0587c783          	lbu	a5,88(a5)
    80004e5c:	2781                	sext.w	a5,a5
    80004e5e:	fdc42703          	lw	a4,-36(s0)
    80004e62:	8ff9                	and	a5,a5,a4
    80004e64:	2781                	sext.w	a5,a5
    80004e66:	ebd1                	bnez	a5,80004efa <balloc+0x128>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004e68:	fe842783          	lw	a5,-24(s0)
    80004e6c:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e70:	01d7571b          	srliw	a4,a4,0x1d
    80004e74:	9fb9                	addw	a5,a5,a4
    80004e76:	4037d79b          	sraiw	a5,a5,0x3
    80004e7a:	2781                	sext.w	a5,a5
    80004e7c:	fe043703          	ld	a4,-32(s0)
    80004e80:	973e                	add	a4,a4,a5
    80004e82:	05874703          	lbu	a4,88(a4)
    80004e86:	0187169b          	slliw	a3,a4,0x18
    80004e8a:	4186d69b          	sraiw	a3,a3,0x18
    80004e8e:	fdc42703          	lw	a4,-36(s0)
    80004e92:	0187171b          	slliw	a4,a4,0x18
    80004e96:	4187571b          	sraiw	a4,a4,0x18
    80004e9a:	8f55                	or	a4,a4,a3
    80004e9c:	0187171b          	slliw	a4,a4,0x18
    80004ea0:	4187571b          	sraiw	a4,a4,0x18
    80004ea4:	0ff77713          	zext.b	a4,a4
    80004ea8:	fe043683          	ld	a3,-32(s0)
    80004eac:	97b6                	add	a5,a5,a3
    80004eae:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004eb2:	fe043503          	ld	a0,-32(s0)
    80004eb6:	00002097          	auipc	ra,0x2
    80004eba:	918080e7          	jalr	-1768(ra) # 800067ce <log_write>
        brelse(bp);
    80004ebe:	fe043503          	ld	a0,-32(s0)
    80004ec2:	00000097          	auipc	ra,0x0
    80004ec6:	c68080e7          	jalr	-920(ra) # 80004b2a <brelse>
        bzero(dev, b + bi);
    80004eca:	fcc42783          	lw	a5,-52(s0)
    80004ece:	fec42703          	lw	a4,-20(s0)
    80004ed2:	86ba                	mv	a3,a4
    80004ed4:	fe842703          	lw	a4,-24(s0)
    80004ed8:	9f35                	addw	a4,a4,a3
    80004eda:	2701                	sext.w	a4,a4
    80004edc:	85ba                	mv	a1,a4
    80004ede:	853e                	mv	a0,a5
    80004ee0:	00000097          	auipc	ra,0x0
    80004ee4:	e8a080e7          	jalr	-374(ra) # 80004d6a <bzero>
        return b + bi;
    80004ee8:	fec42783          	lw	a5,-20(s0)
    80004eec:	873e                	mv	a4,a5
    80004eee:	fe842783          	lw	a5,-24(s0)
    80004ef2:	9fb9                	addw	a5,a5,a4
    80004ef4:	2781                	sext.w	a5,a5
    80004ef6:	2781                	sext.w	a5,a5
    80004ef8:	a8a5                	j	80004f70 <balloc+0x19e>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004efa:	fe842783          	lw	a5,-24(s0)
    80004efe:	2785                	addiw	a5,a5,1
    80004f00:	fef42423          	sw	a5,-24(s0)
    80004f04:	fe842783          	lw	a5,-24(s0)
    80004f08:	0007871b          	sext.w	a4,a5
    80004f0c:	6789                	lui	a5,0x2
    80004f0e:	02f75263          	bge	a4,a5,80004f32 <balloc+0x160>
    80004f12:	fec42783          	lw	a5,-20(s0)
    80004f16:	873e                	mv	a4,a5
    80004f18:	fe842783          	lw	a5,-24(s0)
    80004f1c:	9fb9                	addw	a5,a5,a4
    80004f1e:	2781                	sext.w	a5,a5
    80004f20:	0007871b          	sext.w	a4,a5
    80004f24:	00020797          	auipc	a5,0x20
    80004f28:	84c78793          	addi	a5,a5,-1972 # 80024770 <sb>
    80004f2c:	43dc                	lw	a5,4(a5)
    80004f2e:	eef76fe3          	bltu	a4,a5,80004e2c <balloc+0x5a>
      }
    }
    brelse(bp);
    80004f32:	fe043503          	ld	a0,-32(s0)
    80004f36:	00000097          	auipc	ra,0x0
    80004f3a:	bf4080e7          	jalr	-1036(ra) # 80004b2a <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004f3e:	fec42783          	lw	a5,-20(s0)
    80004f42:	873e                	mv	a4,a5
    80004f44:	6789                	lui	a5,0x2
    80004f46:	9fb9                	addw	a5,a5,a4
    80004f48:	fef42623          	sw	a5,-20(s0)
    80004f4c:	00020797          	auipc	a5,0x20
    80004f50:	82478793          	addi	a5,a5,-2012 # 80024770 <sb>
    80004f54:	43d8                	lw	a4,4(a5)
    80004f56:	fec42783          	lw	a5,-20(s0)
    80004f5a:	e8e7e8e3          	bltu	a5,a4,80004dea <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004f5e:	00006517          	auipc	a0,0x6
    80004f62:	52250513          	addi	a0,a0,1314 # 8000b480 <etext+0x480>
    80004f66:	ffffc097          	auipc	ra,0xffffc
    80004f6a:	acc080e7          	jalr	-1332(ra) # 80000a32 <printf>
  return 0;
    80004f6e:	4781                	li	a5,0
}
    80004f70:	853e                	mv	a0,a5
    80004f72:	70e2                	ld	ra,56(sp)
    80004f74:	7442                	ld	s0,48(sp)
    80004f76:	6121                	addi	sp,sp,64
    80004f78:	8082                	ret

0000000080004f7a <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004f7a:	7179                	addi	sp,sp,-48
    80004f7c:	f406                	sd	ra,40(sp)
    80004f7e:	f022                	sd	s0,32(sp)
    80004f80:	1800                	addi	s0,sp,48
    80004f82:	87aa                	mv	a5,a0
    80004f84:	872e                	mv	a4,a1
    80004f86:	fcf42e23          	sw	a5,-36(s0)
    80004f8a:	87ba                	mv	a5,a4
    80004f8c:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004f90:	fdc42683          	lw	a3,-36(s0)
    80004f94:	fd842783          	lw	a5,-40(s0)
    80004f98:	00d7d79b          	srliw	a5,a5,0xd
    80004f9c:	0007871b          	sext.w	a4,a5
    80004fa0:	0001f797          	auipc	a5,0x1f
    80004fa4:	7d078793          	addi	a5,a5,2000 # 80024770 <sb>
    80004fa8:	4fdc                	lw	a5,28(a5)
    80004faa:	9fb9                	addw	a5,a5,a4
    80004fac:	2781                	sext.w	a5,a5
    80004fae:	85be                	mv	a1,a5
    80004fb0:	8536                	mv	a0,a3
    80004fb2:	00000097          	auipc	ra,0x0
    80004fb6:	ad2080e7          	jalr	-1326(ra) # 80004a84 <bread>
    80004fba:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004fbe:	fd842703          	lw	a4,-40(s0)
    80004fc2:	6789                	lui	a5,0x2
    80004fc4:	17fd                	addi	a5,a5,-1 # 1fff <_entry-0x7fffe001>
    80004fc6:	8ff9                	and	a5,a5,a4
    80004fc8:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004fcc:	fe442783          	lw	a5,-28(s0)
    80004fd0:	8b9d                	andi	a5,a5,7
    80004fd2:	2781                	sext.w	a5,a5
    80004fd4:	4705                	li	a4,1
    80004fd6:	00f717bb          	sllw	a5,a4,a5
    80004fda:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004fde:	fe442783          	lw	a5,-28(s0)
    80004fe2:	41f7d71b          	sraiw	a4,a5,0x1f
    80004fe6:	01d7571b          	srliw	a4,a4,0x1d
    80004fea:	9fb9                	addw	a5,a5,a4
    80004fec:	4037d79b          	sraiw	a5,a5,0x3
    80004ff0:	2781                	sext.w	a5,a5
    80004ff2:	fe843703          	ld	a4,-24(s0)
    80004ff6:	97ba                	add	a5,a5,a4
    80004ff8:	0587c783          	lbu	a5,88(a5)
    80004ffc:	2781                	sext.w	a5,a5
    80004ffe:	fe042703          	lw	a4,-32(s0)
    80005002:	8ff9                	and	a5,a5,a4
    80005004:	2781                	sext.w	a5,a5
    80005006:	eb89                	bnez	a5,80005018 <bfree+0x9e>
    panic("freeing free block");
    80005008:	00006517          	auipc	a0,0x6
    8000500c:	49050513          	addi	a0,a0,1168 # 8000b498 <etext+0x498>
    80005010:	ffffc097          	auipc	ra,0xffffc
    80005014:	c78080e7          	jalr	-904(ra) # 80000c88 <panic>
  bp->data[bi/8] &= ~m;
    80005018:	fe442783          	lw	a5,-28(s0)
    8000501c:	41f7d71b          	sraiw	a4,a5,0x1f
    80005020:	01d7571b          	srliw	a4,a4,0x1d
    80005024:	9fb9                	addw	a5,a5,a4
    80005026:	4037d79b          	sraiw	a5,a5,0x3
    8000502a:	2781                	sext.w	a5,a5
    8000502c:	fe843703          	ld	a4,-24(s0)
    80005030:	973e                	add	a4,a4,a5
    80005032:	05874703          	lbu	a4,88(a4)
    80005036:	0187169b          	slliw	a3,a4,0x18
    8000503a:	4186d69b          	sraiw	a3,a3,0x18
    8000503e:	fe042703          	lw	a4,-32(s0)
    80005042:	0187171b          	slliw	a4,a4,0x18
    80005046:	4187571b          	sraiw	a4,a4,0x18
    8000504a:	fff74713          	not	a4,a4
    8000504e:	0187171b          	slliw	a4,a4,0x18
    80005052:	4187571b          	sraiw	a4,a4,0x18
    80005056:	8f75                	and	a4,a4,a3
    80005058:	0187171b          	slliw	a4,a4,0x18
    8000505c:	4187571b          	sraiw	a4,a4,0x18
    80005060:	0ff77713          	zext.b	a4,a4
    80005064:	fe843683          	ld	a3,-24(s0)
    80005068:	97b6                	add	a5,a5,a3
    8000506a:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    8000506e:	fe843503          	ld	a0,-24(s0)
    80005072:	00001097          	auipc	ra,0x1
    80005076:	75c080e7          	jalr	1884(ra) # 800067ce <log_write>
  brelse(bp);
    8000507a:	fe843503          	ld	a0,-24(s0)
    8000507e:	00000097          	auipc	ra,0x0
    80005082:	aac080e7          	jalr	-1364(ra) # 80004b2a <brelse>
}
    80005086:	0001                	nop
    80005088:	70a2                	ld	ra,40(sp)
    8000508a:	7402                	ld	s0,32(sp)
    8000508c:	6145                	addi	sp,sp,48
    8000508e:	8082                	ret

0000000080005090 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80005090:	1101                	addi	sp,sp,-32
    80005092:	ec06                	sd	ra,24(sp)
    80005094:	e822                	sd	s0,16(sp)
    80005096:	1000                	addi	s0,sp,32
  int i = 0;
    80005098:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    8000509c:	00006597          	auipc	a1,0x6
    800050a0:	41458593          	addi	a1,a1,1044 # 8000b4b0 <etext+0x4b0>
    800050a4:	0001f517          	auipc	a0,0x1f
    800050a8:	6ec50513          	addi	a0,a0,1772 # 80024790 <itable>
    800050ac:	ffffc097          	auipc	ra,0xffffc
    800050b0:	254080e7          	jalr	596(ra) # 80001300 <initlock>
  for(i = 0; i < NINODE; i++) {
    800050b4:	fe042623          	sw	zero,-20(s0)
    800050b8:	a82d                	j	800050f2 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    800050ba:	fec42703          	lw	a4,-20(s0)
    800050be:	87ba                	mv	a5,a4
    800050c0:	0792                	slli	a5,a5,0x4
    800050c2:	97ba                	add	a5,a5,a4
    800050c4:	078e                	slli	a5,a5,0x3
    800050c6:	02078713          	addi	a4,a5,32
    800050ca:	0001f797          	auipc	a5,0x1f
    800050ce:	6c678793          	addi	a5,a5,1734 # 80024790 <itable>
    800050d2:	97ba                	add	a5,a5,a4
    800050d4:	07a1                	addi	a5,a5,8
    800050d6:	00006597          	auipc	a1,0x6
    800050da:	3e258593          	addi	a1,a1,994 # 8000b4b8 <etext+0x4b8>
    800050de:	853e                	mv	a0,a5
    800050e0:	00002097          	auipc	ra,0x2
    800050e4:	822080e7          	jalr	-2014(ra) # 80006902 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    800050e8:	fec42783          	lw	a5,-20(s0)
    800050ec:	2785                	addiw	a5,a5,1
    800050ee:	fef42623          	sw	a5,-20(s0)
    800050f2:	fec42783          	lw	a5,-20(s0)
    800050f6:	0007871b          	sext.w	a4,a5
    800050fa:	03100793          	li	a5,49
    800050fe:	fae7dee3          	bge	a5,a4,800050ba <iinit+0x2a>
  }
}
    80005102:	0001                	nop
    80005104:	0001                	nop
    80005106:	60e2                	ld	ra,24(sp)
    80005108:	6442                	ld	s0,16(sp)
    8000510a:	6105                	addi	sp,sp,32
    8000510c:	8082                	ret

000000008000510e <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    8000510e:	7139                	addi	sp,sp,-64
    80005110:	fc06                	sd	ra,56(sp)
    80005112:	f822                	sd	s0,48(sp)
    80005114:	0080                	addi	s0,sp,64
    80005116:	87aa                	mv	a5,a0
    80005118:	872e                	mv	a4,a1
    8000511a:	fcf42623          	sw	a5,-52(s0)
    8000511e:	87ba                	mv	a5,a4
    80005120:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80005124:	4785                	li	a5,1
    80005126:	fef42623          	sw	a5,-20(s0)
    8000512a:	a855                	j	800051de <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    8000512c:	fec42783          	lw	a5,-20(s0)
    80005130:	8391                	srli	a5,a5,0x4
    80005132:	0007871b          	sext.w	a4,a5
    80005136:	0001f797          	auipc	a5,0x1f
    8000513a:	63a78793          	addi	a5,a5,1594 # 80024770 <sb>
    8000513e:	4f9c                	lw	a5,24(a5)
    80005140:	9fb9                	addw	a5,a5,a4
    80005142:	0007871b          	sext.w	a4,a5
    80005146:	fcc42783          	lw	a5,-52(s0)
    8000514a:	85ba                	mv	a1,a4
    8000514c:	853e                	mv	a0,a5
    8000514e:	00000097          	auipc	ra,0x0
    80005152:	936080e7          	jalr	-1738(ra) # 80004a84 <bread>
    80005156:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    8000515a:	fe043783          	ld	a5,-32(s0)
    8000515e:	05878713          	addi	a4,a5,88
    80005162:	fec42783          	lw	a5,-20(s0)
    80005166:	8bbd                	andi	a5,a5,15
    80005168:	079a                	slli	a5,a5,0x6
    8000516a:	97ba                	add	a5,a5,a4
    8000516c:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80005170:	fd843783          	ld	a5,-40(s0)
    80005174:	00079783          	lh	a5,0(a5)
    80005178:	eba1                	bnez	a5,800051c8 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    8000517a:	04000613          	li	a2,64
    8000517e:	4581                	li	a1,0
    80005180:	fd843503          	ld	a0,-40(s0)
    80005184:	ffffc097          	auipc	ra,0xffffc
    80005188:	380080e7          	jalr	896(ra) # 80001504 <memset>
      dip->type = type;
    8000518c:	fd843783          	ld	a5,-40(s0)
    80005190:	fca45703          	lhu	a4,-54(s0)
    80005194:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80005198:	fe043503          	ld	a0,-32(s0)
    8000519c:	00001097          	auipc	ra,0x1
    800051a0:	632080e7          	jalr	1586(ra) # 800067ce <log_write>
      brelse(bp);
    800051a4:	fe043503          	ld	a0,-32(s0)
    800051a8:	00000097          	auipc	ra,0x0
    800051ac:	982080e7          	jalr	-1662(ra) # 80004b2a <brelse>
      return iget(dev, inum);
    800051b0:	fec42703          	lw	a4,-20(s0)
    800051b4:	fcc42783          	lw	a5,-52(s0)
    800051b8:	85ba                	mv	a1,a4
    800051ba:	853e                	mv	a0,a5
    800051bc:	00000097          	auipc	ra,0x0
    800051c0:	138080e7          	jalr	312(ra) # 800052f4 <iget>
    800051c4:	87aa                	mv	a5,a0
    800051c6:	a835                	j	80005202 <ialloc+0xf4>
    }
    brelse(bp);
    800051c8:	fe043503          	ld	a0,-32(s0)
    800051cc:	00000097          	auipc	ra,0x0
    800051d0:	95e080e7          	jalr	-1698(ra) # 80004b2a <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    800051d4:	fec42783          	lw	a5,-20(s0)
    800051d8:	2785                	addiw	a5,a5,1
    800051da:	fef42623          	sw	a5,-20(s0)
    800051de:	0001f797          	auipc	a5,0x1f
    800051e2:	59278793          	addi	a5,a5,1426 # 80024770 <sb>
    800051e6:	47d8                	lw	a4,12(a5)
    800051e8:	fec42783          	lw	a5,-20(s0)
    800051ec:	f4e7e0e3          	bltu	a5,a4,8000512c <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    800051f0:	00006517          	auipc	a0,0x6
    800051f4:	2d050513          	addi	a0,a0,720 # 8000b4c0 <etext+0x4c0>
    800051f8:	ffffc097          	auipc	ra,0xffffc
    800051fc:	83a080e7          	jalr	-1990(ra) # 80000a32 <printf>
  return 0;
    80005200:	4781                	li	a5,0
}
    80005202:	853e                	mv	a0,a5
    80005204:	70e2                	ld	ra,56(sp)
    80005206:	7442                	ld	s0,48(sp)
    80005208:	6121                	addi	sp,sp,64
    8000520a:	8082                	ret

000000008000520c <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    8000520c:	7179                	addi	sp,sp,-48
    8000520e:	f406                	sd	ra,40(sp)
    80005210:	f022                	sd	s0,32(sp)
    80005212:	1800                	addi	s0,sp,48
    80005214:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005218:	fd843783          	ld	a5,-40(s0)
    8000521c:	4394                	lw	a3,0(a5)
    8000521e:	fd843783          	ld	a5,-40(s0)
    80005222:	43dc                	lw	a5,4(a5)
    80005224:	0047d79b          	srliw	a5,a5,0x4
    80005228:	0007871b          	sext.w	a4,a5
    8000522c:	0001f797          	auipc	a5,0x1f
    80005230:	54478793          	addi	a5,a5,1348 # 80024770 <sb>
    80005234:	4f9c                	lw	a5,24(a5)
    80005236:	9fb9                	addw	a5,a5,a4
    80005238:	2781                	sext.w	a5,a5
    8000523a:	85be                	mv	a1,a5
    8000523c:	8536                	mv	a0,a3
    8000523e:	00000097          	auipc	ra,0x0
    80005242:	846080e7          	jalr	-1978(ra) # 80004a84 <bread>
    80005246:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    8000524a:	fe843783          	ld	a5,-24(s0)
    8000524e:	05878713          	addi	a4,a5,88
    80005252:	fd843783          	ld	a5,-40(s0)
    80005256:	43dc                	lw	a5,4(a5)
    80005258:	1782                	slli	a5,a5,0x20
    8000525a:	9381                	srli	a5,a5,0x20
    8000525c:	8bbd                	andi	a5,a5,15
    8000525e:	079a                	slli	a5,a5,0x6
    80005260:	97ba                	add	a5,a5,a4
    80005262:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    80005266:	fd843783          	ld	a5,-40(s0)
    8000526a:	04479703          	lh	a4,68(a5)
    8000526e:	fe043783          	ld	a5,-32(s0)
    80005272:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80005276:	fd843783          	ld	a5,-40(s0)
    8000527a:	04679703          	lh	a4,70(a5)
    8000527e:	fe043783          	ld	a5,-32(s0)
    80005282:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80005286:	fd843783          	ld	a5,-40(s0)
    8000528a:	04879703          	lh	a4,72(a5)
    8000528e:	fe043783          	ld	a5,-32(s0)
    80005292:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80005296:	fd843783          	ld	a5,-40(s0)
    8000529a:	04a79703          	lh	a4,74(a5)
    8000529e:	fe043783          	ld	a5,-32(s0)
    800052a2:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    800052a6:	fd843783          	ld	a5,-40(s0)
    800052aa:	47f8                	lw	a4,76(a5)
    800052ac:	fe043783          	ld	a5,-32(s0)
    800052b0:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    800052b2:	fe043783          	ld	a5,-32(s0)
    800052b6:	00c78713          	addi	a4,a5,12
    800052ba:	fd843783          	ld	a5,-40(s0)
    800052be:	05078793          	addi	a5,a5,80
    800052c2:	03400613          	li	a2,52
    800052c6:	85be                	mv	a1,a5
    800052c8:	853a                	mv	a0,a4
    800052ca:	ffffc097          	auipc	ra,0xffffc
    800052ce:	31e080e7          	jalr	798(ra) # 800015e8 <memmove>
  log_write(bp);
    800052d2:	fe843503          	ld	a0,-24(s0)
    800052d6:	00001097          	auipc	ra,0x1
    800052da:	4f8080e7          	jalr	1272(ra) # 800067ce <log_write>
  brelse(bp);
    800052de:	fe843503          	ld	a0,-24(s0)
    800052e2:	00000097          	auipc	ra,0x0
    800052e6:	848080e7          	jalr	-1976(ra) # 80004b2a <brelse>
}
    800052ea:	0001                	nop
    800052ec:	70a2                	ld	ra,40(sp)
    800052ee:	7402                	ld	s0,32(sp)
    800052f0:	6145                	addi	sp,sp,48
    800052f2:	8082                	ret

00000000800052f4 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    800052f4:	7179                	addi	sp,sp,-48
    800052f6:	f406                	sd	ra,40(sp)
    800052f8:	f022                	sd	s0,32(sp)
    800052fa:	1800                	addi	s0,sp,48
    800052fc:	87aa                	mv	a5,a0
    800052fe:	872e                	mv	a4,a1
    80005300:	fcf42e23          	sw	a5,-36(s0)
    80005304:	87ba                	mv	a5,a4
    80005306:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    8000530a:	0001f517          	auipc	a0,0x1f
    8000530e:	48650513          	addi	a0,a0,1158 # 80024790 <itable>
    80005312:	ffffc097          	auipc	ra,0xffffc
    80005316:	01e080e7          	jalr	30(ra) # 80001330 <acquire>

  // Is the inode already in the table?
  empty = 0;
    8000531a:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    8000531e:	0001f797          	auipc	a5,0x1f
    80005322:	48a78793          	addi	a5,a5,1162 # 800247a8 <itable+0x18>
    80005326:	fef43423          	sd	a5,-24(s0)
    8000532a:	a89d                	j	800053a0 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    8000532c:	fe843783          	ld	a5,-24(s0)
    80005330:	479c                	lw	a5,8(a5)
    80005332:	04f05663          	blez	a5,8000537e <iget+0x8a>
    80005336:	fe843783          	ld	a5,-24(s0)
    8000533a:	4398                	lw	a4,0(a5)
    8000533c:	fdc42783          	lw	a5,-36(s0)
    80005340:	2781                	sext.w	a5,a5
    80005342:	02e79e63          	bne	a5,a4,8000537e <iget+0x8a>
    80005346:	fe843783          	ld	a5,-24(s0)
    8000534a:	43d8                	lw	a4,4(a5)
    8000534c:	fd842783          	lw	a5,-40(s0)
    80005350:	2781                	sext.w	a5,a5
    80005352:	02e79663          	bne	a5,a4,8000537e <iget+0x8a>
      ip->ref++;
    80005356:	fe843783          	ld	a5,-24(s0)
    8000535a:	479c                	lw	a5,8(a5)
    8000535c:	2785                	addiw	a5,a5,1
    8000535e:	0007871b          	sext.w	a4,a5
    80005362:	fe843783          	ld	a5,-24(s0)
    80005366:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    80005368:	0001f517          	auipc	a0,0x1f
    8000536c:	42850513          	addi	a0,a0,1064 # 80024790 <itable>
    80005370:	ffffc097          	auipc	ra,0xffffc
    80005374:	024080e7          	jalr	36(ra) # 80001394 <release>
      return ip;
    80005378:	fe843783          	ld	a5,-24(s0)
    8000537c:	a069                	j	80005406 <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    8000537e:	fe043783          	ld	a5,-32(s0)
    80005382:	eb89                	bnez	a5,80005394 <iget+0xa0>
    80005384:	fe843783          	ld	a5,-24(s0)
    80005388:	479c                	lw	a5,8(a5)
    8000538a:	e789                	bnez	a5,80005394 <iget+0xa0>
      empty = ip;
    8000538c:	fe843783          	ld	a5,-24(s0)
    80005390:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005394:	fe843783          	ld	a5,-24(s0)
    80005398:	08878793          	addi	a5,a5,136
    8000539c:	fef43423          	sd	a5,-24(s0)
    800053a0:	fe843703          	ld	a4,-24(s0)
    800053a4:	00021797          	auipc	a5,0x21
    800053a8:	e9478793          	addi	a5,a5,-364 # 80026238 <log>
    800053ac:	f8f760e3          	bltu	a4,a5,8000532c <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    800053b0:	fe043783          	ld	a5,-32(s0)
    800053b4:	eb89                	bnez	a5,800053c6 <iget+0xd2>
    panic("iget: no inodes");
    800053b6:	00006517          	auipc	a0,0x6
    800053ba:	12250513          	addi	a0,a0,290 # 8000b4d8 <etext+0x4d8>
    800053be:	ffffc097          	auipc	ra,0xffffc
    800053c2:	8ca080e7          	jalr	-1846(ra) # 80000c88 <panic>

  ip = empty;
    800053c6:	fe043783          	ld	a5,-32(s0)
    800053ca:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    800053ce:	fe843783          	ld	a5,-24(s0)
    800053d2:	fdc42703          	lw	a4,-36(s0)
    800053d6:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    800053d8:	fe843783          	ld	a5,-24(s0)
    800053dc:	fd842703          	lw	a4,-40(s0)
    800053e0:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    800053e2:	fe843783          	ld	a5,-24(s0)
    800053e6:	4705                	li	a4,1
    800053e8:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    800053ea:	fe843783          	ld	a5,-24(s0)
    800053ee:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    800053f2:	0001f517          	auipc	a0,0x1f
    800053f6:	39e50513          	addi	a0,a0,926 # 80024790 <itable>
    800053fa:	ffffc097          	auipc	ra,0xffffc
    800053fe:	f9a080e7          	jalr	-102(ra) # 80001394 <release>

  return ip;
    80005402:	fe843783          	ld	a5,-24(s0)
}
    80005406:	853e                	mv	a0,a5
    80005408:	70a2                	ld	ra,40(sp)
    8000540a:	7402                	ld	s0,32(sp)
    8000540c:	6145                	addi	sp,sp,48
    8000540e:	8082                	ret

0000000080005410 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    80005410:	1101                	addi	sp,sp,-32
    80005412:	ec06                	sd	ra,24(sp)
    80005414:	e822                	sd	s0,16(sp)
    80005416:	1000                	addi	s0,sp,32
    80005418:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000541c:	0001f517          	auipc	a0,0x1f
    80005420:	37450513          	addi	a0,a0,884 # 80024790 <itable>
    80005424:	ffffc097          	auipc	ra,0xffffc
    80005428:	f0c080e7          	jalr	-244(ra) # 80001330 <acquire>
  ip->ref++;
    8000542c:	fe843783          	ld	a5,-24(s0)
    80005430:	479c                	lw	a5,8(a5)
    80005432:	2785                	addiw	a5,a5,1
    80005434:	0007871b          	sext.w	a4,a5
    80005438:	fe843783          	ld	a5,-24(s0)
    8000543c:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    8000543e:	0001f517          	auipc	a0,0x1f
    80005442:	35250513          	addi	a0,a0,850 # 80024790 <itable>
    80005446:	ffffc097          	auipc	ra,0xffffc
    8000544a:	f4e080e7          	jalr	-178(ra) # 80001394 <release>
  return ip;
    8000544e:	fe843783          	ld	a5,-24(s0)
}
    80005452:	853e                	mv	a0,a5
    80005454:	60e2                	ld	ra,24(sp)
    80005456:	6442                	ld	s0,16(sp)
    80005458:	6105                	addi	sp,sp,32
    8000545a:	8082                	ret

000000008000545c <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    8000545c:	7179                	addi	sp,sp,-48
    8000545e:	f406                	sd	ra,40(sp)
    80005460:	f022                	sd	s0,32(sp)
    80005462:	1800                	addi	s0,sp,48
    80005464:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    80005468:	fd843783          	ld	a5,-40(s0)
    8000546c:	c791                	beqz	a5,80005478 <ilock+0x1c>
    8000546e:	fd843783          	ld	a5,-40(s0)
    80005472:	479c                	lw	a5,8(a5)
    80005474:	00f04a63          	bgtz	a5,80005488 <ilock+0x2c>
    panic("ilock");
    80005478:	00006517          	auipc	a0,0x6
    8000547c:	07050513          	addi	a0,a0,112 # 8000b4e8 <etext+0x4e8>
    80005480:	ffffc097          	auipc	ra,0xffffc
    80005484:	808080e7          	jalr	-2040(ra) # 80000c88 <panic>

  acquiresleep(&ip->lock);
    80005488:	fd843783          	ld	a5,-40(s0)
    8000548c:	07c1                	addi	a5,a5,16
    8000548e:	853e                	mv	a0,a5
    80005490:	00001097          	auipc	ra,0x1
    80005494:	4be080e7          	jalr	1214(ra) # 8000694e <acquiresleep>

  if(ip->valid == 0){
    80005498:	fd843783          	ld	a5,-40(s0)
    8000549c:	43bc                	lw	a5,64(a5)
    8000549e:	e7e5                	bnez	a5,80005586 <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800054a0:	fd843783          	ld	a5,-40(s0)
    800054a4:	4394                	lw	a3,0(a5)
    800054a6:	fd843783          	ld	a5,-40(s0)
    800054aa:	43dc                	lw	a5,4(a5)
    800054ac:	0047d79b          	srliw	a5,a5,0x4
    800054b0:	0007871b          	sext.w	a4,a5
    800054b4:	0001f797          	auipc	a5,0x1f
    800054b8:	2bc78793          	addi	a5,a5,700 # 80024770 <sb>
    800054bc:	4f9c                	lw	a5,24(a5)
    800054be:	9fb9                	addw	a5,a5,a4
    800054c0:	2781                	sext.w	a5,a5
    800054c2:	85be                	mv	a1,a5
    800054c4:	8536                	mv	a0,a3
    800054c6:	fffff097          	auipc	ra,0xfffff
    800054ca:	5be080e7          	jalr	1470(ra) # 80004a84 <bread>
    800054ce:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    800054d2:	fe843783          	ld	a5,-24(s0)
    800054d6:	05878713          	addi	a4,a5,88
    800054da:	fd843783          	ld	a5,-40(s0)
    800054de:	43dc                	lw	a5,4(a5)
    800054e0:	1782                	slli	a5,a5,0x20
    800054e2:	9381                	srli	a5,a5,0x20
    800054e4:	8bbd                	andi	a5,a5,15
    800054e6:	079a                	slli	a5,a5,0x6
    800054e8:	97ba                	add	a5,a5,a4
    800054ea:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    800054ee:	fe043783          	ld	a5,-32(s0)
    800054f2:	00079703          	lh	a4,0(a5)
    800054f6:	fd843783          	ld	a5,-40(s0)
    800054fa:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800054fe:	fe043783          	ld	a5,-32(s0)
    80005502:	00279703          	lh	a4,2(a5)
    80005506:	fd843783          	ld	a5,-40(s0)
    8000550a:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    8000550e:	fe043783          	ld	a5,-32(s0)
    80005512:	00479703          	lh	a4,4(a5)
    80005516:	fd843783          	ld	a5,-40(s0)
    8000551a:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    8000551e:	fe043783          	ld	a5,-32(s0)
    80005522:	00679703          	lh	a4,6(a5)
    80005526:	fd843783          	ld	a5,-40(s0)
    8000552a:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    8000552e:	fe043783          	ld	a5,-32(s0)
    80005532:	4798                	lw	a4,8(a5)
    80005534:	fd843783          	ld	a5,-40(s0)
    80005538:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    8000553a:	fd843783          	ld	a5,-40(s0)
    8000553e:	05078713          	addi	a4,a5,80
    80005542:	fe043783          	ld	a5,-32(s0)
    80005546:	07b1                	addi	a5,a5,12
    80005548:	03400613          	li	a2,52
    8000554c:	85be                	mv	a1,a5
    8000554e:	853a                	mv	a0,a4
    80005550:	ffffc097          	auipc	ra,0xffffc
    80005554:	098080e7          	jalr	152(ra) # 800015e8 <memmove>
    brelse(bp);
    80005558:	fe843503          	ld	a0,-24(s0)
    8000555c:	fffff097          	auipc	ra,0xfffff
    80005560:	5ce080e7          	jalr	1486(ra) # 80004b2a <brelse>
    ip->valid = 1;
    80005564:	fd843783          	ld	a5,-40(s0)
    80005568:	4705                	li	a4,1
    8000556a:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    8000556c:	fd843783          	ld	a5,-40(s0)
    80005570:	04479783          	lh	a5,68(a5)
    80005574:	eb89                	bnez	a5,80005586 <ilock+0x12a>
      panic("ilock: no type");
    80005576:	00006517          	auipc	a0,0x6
    8000557a:	f7a50513          	addi	a0,a0,-134 # 8000b4f0 <etext+0x4f0>
    8000557e:	ffffb097          	auipc	ra,0xffffb
    80005582:	70a080e7          	jalr	1802(ra) # 80000c88 <panic>
  }
}
    80005586:	0001                	nop
    80005588:	70a2                	ld	ra,40(sp)
    8000558a:	7402                	ld	s0,32(sp)
    8000558c:	6145                	addi	sp,sp,48
    8000558e:	8082                	ret

0000000080005590 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005590:	1101                	addi	sp,sp,-32
    80005592:	ec06                	sd	ra,24(sp)
    80005594:	e822                	sd	s0,16(sp)
    80005596:	1000                	addi	s0,sp,32
    80005598:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    8000559c:	fe843783          	ld	a5,-24(s0)
    800055a0:	c385                	beqz	a5,800055c0 <iunlock+0x30>
    800055a2:	fe843783          	ld	a5,-24(s0)
    800055a6:	07c1                	addi	a5,a5,16
    800055a8:	853e                	mv	a0,a5
    800055aa:	00001097          	auipc	ra,0x1
    800055ae:	464080e7          	jalr	1124(ra) # 80006a0e <holdingsleep>
    800055b2:	87aa                	mv	a5,a0
    800055b4:	c791                	beqz	a5,800055c0 <iunlock+0x30>
    800055b6:	fe843783          	ld	a5,-24(s0)
    800055ba:	479c                	lw	a5,8(a5)
    800055bc:	00f04a63          	bgtz	a5,800055d0 <iunlock+0x40>
    panic("iunlock");
    800055c0:	00006517          	auipc	a0,0x6
    800055c4:	f4050513          	addi	a0,a0,-192 # 8000b500 <etext+0x500>
    800055c8:	ffffb097          	auipc	ra,0xffffb
    800055cc:	6c0080e7          	jalr	1728(ra) # 80000c88 <panic>

  releasesleep(&ip->lock);
    800055d0:	fe843783          	ld	a5,-24(s0)
    800055d4:	07c1                	addi	a5,a5,16
    800055d6:	853e                	mv	a0,a5
    800055d8:	00001097          	auipc	ra,0x1
    800055dc:	3e4080e7          	jalr	996(ra) # 800069bc <releasesleep>
}
    800055e0:	0001                	nop
    800055e2:	60e2                	ld	ra,24(sp)
    800055e4:	6442                	ld	s0,16(sp)
    800055e6:	6105                	addi	sp,sp,32
    800055e8:	8082                	ret

00000000800055ea <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800055ea:	1101                	addi	sp,sp,-32
    800055ec:	ec06                	sd	ra,24(sp)
    800055ee:	e822                	sd	s0,16(sp)
    800055f0:	1000                	addi	s0,sp,32
    800055f2:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800055f6:	0001f517          	auipc	a0,0x1f
    800055fa:	19a50513          	addi	a0,a0,410 # 80024790 <itable>
    800055fe:	ffffc097          	auipc	ra,0xffffc
    80005602:	d32080e7          	jalr	-718(ra) # 80001330 <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    80005606:	fe843783          	ld	a5,-24(s0)
    8000560a:	479c                	lw	a5,8(a5)
    8000560c:	873e                	mv	a4,a5
    8000560e:	4785                	li	a5,1
    80005610:	06f71f63          	bne	a4,a5,8000568e <iput+0xa4>
    80005614:	fe843783          	ld	a5,-24(s0)
    80005618:	43bc                	lw	a5,64(a5)
    8000561a:	cbb5                	beqz	a5,8000568e <iput+0xa4>
    8000561c:	fe843783          	ld	a5,-24(s0)
    80005620:	04a79783          	lh	a5,74(a5)
    80005624:	e7ad                	bnez	a5,8000568e <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    80005626:	fe843783          	ld	a5,-24(s0)
    8000562a:	07c1                	addi	a5,a5,16
    8000562c:	853e                	mv	a0,a5
    8000562e:	00001097          	auipc	ra,0x1
    80005632:	320080e7          	jalr	800(ra) # 8000694e <acquiresleep>

    release(&itable.lock);
    80005636:	0001f517          	auipc	a0,0x1f
    8000563a:	15a50513          	addi	a0,a0,346 # 80024790 <itable>
    8000563e:	ffffc097          	auipc	ra,0xffffc
    80005642:	d56080e7          	jalr	-682(ra) # 80001394 <release>

    itrunc(ip);
    80005646:	fe843503          	ld	a0,-24(s0)
    8000564a:	00000097          	auipc	ra,0x0
    8000564e:	21a080e7          	jalr	538(ra) # 80005864 <itrunc>
    ip->type = 0;
    80005652:	fe843783          	ld	a5,-24(s0)
    80005656:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    8000565a:	fe843503          	ld	a0,-24(s0)
    8000565e:	00000097          	auipc	ra,0x0
    80005662:	bae080e7          	jalr	-1106(ra) # 8000520c <iupdate>
    ip->valid = 0;
    80005666:	fe843783          	ld	a5,-24(s0)
    8000566a:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    8000566e:	fe843783          	ld	a5,-24(s0)
    80005672:	07c1                	addi	a5,a5,16
    80005674:	853e                	mv	a0,a5
    80005676:	00001097          	auipc	ra,0x1
    8000567a:	346080e7          	jalr	838(ra) # 800069bc <releasesleep>

    acquire(&itable.lock);
    8000567e:	0001f517          	auipc	a0,0x1f
    80005682:	11250513          	addi	a0,a0,274 # 80024790 <itable>
    80005686:	ffffc097          	auipc	ra,0xffffc
    8000568a:	caa080e7          	jalr	-854(ra) # 80001330 <acquire>
  }

  ip->ref--;
    8000568e:	fe843783          	ld	a5,-24(s0)
    80005692:	479c                	lw	a5,8(a5)
    80005694:	37fd                	addiw	a5,a5,-1
    80005696:	0007871b          	sext.w	a4,a5
    8000569a:	fe843783          	ld	a5,-24(s0)
    8000569e:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800056a0:	0001f517          	auipc	a0,0x1f
    800056a4:	0f050513          	addi	a0,a0,240 # 80024790 <itable>
    800056a8:	ffffc097          	auipc	ra,0xffffc
    800056ac:	cec080e7          	jalr	-788(ra) # 80001394 <release>
}
    800056b0:	0001                	nop
    800056b2:	60e2                	ld	ra,24(sp)
    800056b4:	6442                	ld	s0,16(sp)
    800056b6:	6105                	addi	sp,sp,32
    800056b8:	8082                	ret

00000000800056ba <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    800056ba:	1101                	addi	sp,sp,-32
    800056bc:	ec06                	sd	ra,24(sp)
    800056be:	e822                	sd	s0,16(sp)
    800056c0:	1000                	addi	s0,sp,32
    800056c2:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    800056c6:	fe843503          	ld	a0,-24(s0)
    800056ca:	00000097          	auipc	ra,0x0
    800056ce:	ec6080e7          	jalr	-314(ra) # 80005590 <iunlock>
  iput(ip);
    800056d2:	fe843503          	ld	a0,-24(s0)
    800056d6:	00000097          	auipc	ra,0x0
    800056da:	f14080e7          	jalr	-236(ra) # 800055ea <iput>
}
    800056de:	0001                	nop
    800056e0:	60e2                	ld	ra,24(sp)
    800056e2:	6442                	ld	s0,16(sp)
    800056e4:	6105                	addi	sp,sp,32
    800056e6:	8082                	ret

00000000800056e8 <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    800056e8:	7139                	addi	sp,sp,-64
    800056ea:	fc06                	sd	ra,56(sp)
    800056ec:	f822                	sd	s0,48(sp)
    800056ee:	0080                	addi	s0,sp,64
    800056f0:	fca43423          	sd	a0,-56(s0)
    800056f4:	87ae                	mv	a5,a1
    800056f6:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800056fa:	fc442783          	lw	a5,-60(s0)
    800056fe:	0007871b          	sext.w	a4,a5
    80005702:	47ad                	li	a5,11
    80005704:	04e7ee63          	bltu	a5,a4,80005760 <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    80005708:	fc843703          	ld	a4,-56(s0)
    8000570c:	fc446783          	lwu	a5,-60(s0)
    80005710:	07d1                	addi	a5,a5,20
    80005712:	078a                	slli	a5,a5,0x2
    80005714:	97ba                	add	a5,a5,a4
    80005716:	439c                	lw	a5,0(a5)
    80005718:	fef42623          	sw	a5,-20(s0)
    8000571c:	fec42783          	lw	a5,-20(s0)
    80005720:	2781                	sext.w	a5,a5
    80005722:	ef85                	bnez	a5,8000575a <bmap+0x72>
      addr = balloc(ip->dev);
    80005724:	fc843783          	ld	a5,-56(s0)
    80005728:	439c                	lw	a5,0(a5)
    8000572a:	853e                	mv	a0,a5
    8000572c:	fffff097          	auipc	ra,0xfffff
    80005730:	6a6080e7          	jalr	1702(ra) # 80004dd2 <balloc>
    80005734:	87aa                	mv	a5,a0
    80005736:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    8000573a:	fec42783          	lw	a5,-20(s0)
    8000573e:	2781                	sext.w	a5,a5
    80005740:	e399                	bnez	a5,80005746 <bmap+0x5e>
        return 0;
    80005742:	4781                	li	a5,0
    80005744:	aa19                	j	8000585a <bmap+0x172>
      ip->addrs[bn] = addr;
    80005746:	fc843703          	ld	a4,-56(s0)
    8000574a:	fc446783          	lwu	a5,-60(s0)
    8000574e:	07d1                	addi	a5,a5,20
    80005750:	078a                	slli	a5,a5,0x2
    80005752:	97ba                	add	a5,a5,a4
    80005754:	fec42703          	lw	a4,-20(s0)
    80005758:	c398                	sw	a4,0(a5)
    }
    return addr;
    8000575a:	fec42783          	lw	a5,-20(s0)
    8000575e:	a8f5                	j	8000585a <bmap+0x172>
  }
  bn -= NDIRECT;
    80005760:	fc442783          	lw	a5,-60(s0)
    80005764:	37d1                	addiw	a5,a5,-12
    80005766:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    8000576a:	fc442783          	lw	a5,-60(s0)
    8000576e:	0007871b          	sext.w	a4,a5
    80005772:	0ff00793          	li	a5,255
    80005776:	0ce7ea63          	bltu	a5,a4,8000584a <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    8000577a:	fc843783          	ld	a5,-56(s0)
    8000577e:	0807a783          	lw	a5,128(a5)
    80005782:	fef42623          	sw	a5,-20(s0)
    80005786:	fec42783          	lw	a5,-20(s0)
    8000578a:	2781                	sext.w	a5,a5
    8000578c:	eb85                	bnez	a5,800057bc <bmap+0xd4>
      addr = balloc(ip->dev);
    8000578e:	fc843783          	ld	a5,-56(s0)
    80005792:	439c                	lw	a5,0(a5)
    80005794:	853e                	mv	a0,a5
    80005796:	fffff097          	auipc	ra,0xfffff
    8000579a:	63c080e7          	jalr	1596(ra) # 80004dd2 <balloc>
    8000579e:	87aa                	mv	a5,a0
    800057a0:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    800057a4:	fec42783          	lw	a5,-20(s0)
    800057a8:	2781                	sext.w	a5,a5
    800057aa:	e399                	bnez	a5,800057b0 <bmap+0xc8>
        return 0;
    800057ac:	4781                	li	a5,0
    800057ae:	a075                	j	8000585a <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    800057b0:	fc843783          	ld	a5,-56(s0)
    800057b4:	fec42703          	lw	a4,-20(s0)
    800057b8:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    800057bc:	fc843783          	ld	a5,-56(s0)
    800057c0:	439c                	lw	a5,0(a5)
    800057c2:	fec42703          	lw	a4,-20(s0)
    800057c6:	85ba                	mv	a1,a4
    800057c8:	853e                	mv	a0,a5
    800057ca:	fffff097          	auipc	ra,0xfffff
    800057ce:	2ba080e7          	jalr	698(ra) # 80004a84 <bread>
    800057d2:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800057d6:	fe043783          	ld	a5,-32(s0)
    800057da:	05878793          	addi	a5,a5,88
    800057de:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    800057e2:	fc446783          	lwu	a5,-60(s0)
    800057e6:	078a                	slli	a5,a5,0x2
    800057e8:	fd843703          	ld	a4,-40(s0)
    800057ec:	97ba                	add	a5,a5,a4
    800057ee:	439c                	lw	a5,0(a5)
    800057f0:	fef42623          	sw	a5,-20(s0)
    800057f4:	fec42783          	lw	a5,-20(s0)
    800057f8:	2781                	sext.w	a5,a5
    800057fa:	ef9d                	bnez	a5,80005838 <bmap+0x150>
      addr = balloc(ip->dev);
    800057fc:	fc843783          	ld	a5,-56(s0)
    80005800:	439c                	lw	a5,0(a5)
    80005802:	853e                	mv	a0,a5
    80005804:	fffff097          	auipc	ra,0xfffff
    80005808:	5ce080e7          	jalr	1486(ra) # 80004dd2 <balloc>
    8000580c:	87aa                	mv	a5,a0
    8000580e:	fef42623          	sw	a5,-20(s0)
      if(addr){
    80005812:	fec42783          	lw	a5,-20(s0)
    80005816:	2781                	sext.w	a5,a5
    80005818:	c385                	beqz	a5,80005838 <bmap+0x150>
        a[bn] = addr;
    8000581a:	fc446783          	lwu	a5,-60(s0)
    8000581e:	078a                	slli	a5,a5,0x2
    80005820:	fd843703          	ld	a4,-40(s0)
    80005824:	97ba                	add	a5,a5,a4
    80005826:	fec42703          	lw	a4,-20(s0)
    8000582a:	c398                	sw	a4,0(a5)
        log_write(bp);
    8000582c:	fe043503          	ld	a0,-32(s0)
    80005830:	00001097          	auipc	ra,0x1
    80005834:	f9e080e7          	jalr	-98(ra) # 800067ce <log_write>
      }
    }
    brelse(bp);
    80005838:	fe043503          	ld	a0,-32(s0)
    8000583c:	fffff097          	auipc	ra,0xfffff
    80005840:	2ee080e7          	jalr	750(ra) # 80004b2a <brelse>
    return addr;
    80005844:	fec42783          	lw	a5,-20(s0)
    80005848:	a809                	j	8000585a <bmap+0x172>
  }

  panic("bmap: out of range");
    8000584a:	00006517          	auipc	a0,0x6
    8000584e:	cbe50513          	addi	a0,a0,-834 # 8000b508 <etext+0x508>
    80005852:	ffffb097          	auipc	ra,0xffffb
    80005856:	436080e7          	jalr	1078(ra) # 80000c88 <panic>
}
    8000585a:	853e                	mv	a0,a5
    8000585c:	70e2                	ld	ra,56(sp)
    8000585e:	7442                	ld	s0,48(sp)
    80005860:	6121                	addi	sp,sp,64
    80005862:	8082                	ret

0000000080005864 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    80005864:	7139                	addi	sp,sp,-64
    80005866:	fc06                	sd	ra,56(sp)
    80005868:	f822                	sd	s0,48(sp)
    8000586a:	0080                	addi	s0,sp,64
    8000586c:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005870:	fe042623          	sw	zero,-20(s0)
    80005874:	a899                	j	800058ca <itrunc+0x66>
    if(ip->addrs[i]){
    80005876:	fc843703          	ld	a4,-56(s0)
    8000587a:	fec42783          	lw	a5,-20(s0)
    8000587e:	07d1                	addi	a5,a5,20
    80005880:	078a                	slli	a5,a5,0x2
    80005882:	97ba                	add	a5,a5,a4
    80005884:	439c                	lw	a5,0(a5)
    80005886:	cf8d                	beqz	a5,800058c0 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    80005888:	fc843783          	ld	a5,-56(s0)
    8000588c:	439c                	lw	a5,0(a5)
    8000588e:	0007869b          	sext.w	a3,a5
    80005892:	fc843703          	ld	a4,-56(s0)
    80005896:	fec42783          	lw	a5,-20(s0)
    8000589a:	07d1                	addi	a5,a5,20
    8000589c:	078a                	slli	a5,a5,0x2
    8000589e:	97ba                	add	a5,a5,a4
    800058a0:	439c                	lw	a5,0(a5)
    800058a2:	85be                	mv	a1,a5
    800058a4:	8536                	mv	a0,a3
    800058a6:	fffff097          	auipc	ra,0xfffff
    800058aa:	6d4080e7          	jalr	1748(ra) # 80004f7a <bfree>
      ip->addrs[i] = 0;
    800058ae:	fc843703          	ld	a4,-56(s0)
    800058b2:	fec42783          	lw	a5,-20(s0)
    800058b6:	07d1                	addi	a5,a5,20
    800058b8:	078a                	slli	a5,a5,0x2
    800058ba:	97ba                	add	a5,a5,a4
    800058bc:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    800058c0:	fec42783          	lw	a5,-20(s0)
    800058c4:	2785                	addiw	a5,a5,1
    800058c6:	fef42623          	sw	a5,-20(s0)
    800058ca:	fec42783          	lw	a5,-20(s0)
    800058ce:	0007871b          	sext.w	a4,a5
    800058d2:	47ad                	li	a5,11
    800058d4:	fae7d1e3          	bge	a5,a4,80005876 <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    800058d8:	fc843783          	ld	a5,-56(s0)
    800058dc:	0807a783          	lw	a5,128(a5)
    800058e0:	cbc5                	beqz	a5,80005990 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    800058e2:	fc843783          	ld	a5,-56(s0)
    800058e6:	4398                	lw	a4,0(a5)
    800058e8:	fc843783          	ld	a5,-56(s0)
    800058ec:	0807a783          	lw	a5,128(a5)
    800058f0:	85be                	mv	a1,a5
    800058f2:	853a                	mv	a0,a4
    800058f4:	fffff097          	auipc	ra,0xfffff
    800058f8:	190080e7          	jalr	400(ra) # 80004a84 <bread>
    800058fc:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005900:	fe043783          	ld	a5,-32(s0)
    80005904:	05878793          	addi	a5,a5,88
    80005908:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    8000590c:	fe042423          	sw	zero,-24(s0)
    80005910:	a081                	j	80005950 <itrunc+0xec>
      if(a[j])
    80005912:	fe842783          	lw	a5,-24(s0)
    80005916:	078a                	slli	a5,a5,0x2
    80005918:	fd843703          	ld	a4,-40(s0)
    8000591c:	97ba                	add	a5,a5,a4
    8000591e:	439c                	lw	a5,0(a5)
    80005920:	c39d                	beqz	a5,80005946 <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80005922:	fc843783          	ld	a5,-56(s0)
    80005926:	439c                	lw	a5,0(a5)
    80005928:	0007869b          	sext.w	a3,a5
    8000592c:	fe842783          	lw	a5,-24(s0)
    80005930:	078a                	slli	a5,a5,0x2
    80005932:	fd843703          	ld	a4,-40(s0)
    80005936:	97ba                	add	a5,a5,a4
    80005938:	439c                	lw	a5,0(a5)
    8000593a:	85be                	mv	a1,a5
    8000593c:	8536                	mv	a0,a3
    8000593e:	fffff097          	auipc	ra,0xfffff
    80005942:	63c080e7          	jalr	1596(ra) # 80004f7a <bfree>
    for(j = 0; j < NINDIRECT; j++){
    80005946:	fe842783          	lw	a5,-24(s0)
    8000594a:	2785                	addiw	a5,a5,1
    8000594c:	fef42423          	sw	a5,-24(s0)
    80005950:	fe842783          	lw	a5,-24(s0)
    80005954:	873e                	mv	a4,a5
    80005956:	0ff00793          	li	a5,255
    8000595a:	fae7fce3          	bgeu	a5,a4,80005912 <itrunc+0xae>
    }
    brelse(bp);
    8000595e:	fe043503          	ld	a0,-32(s0)
    80005962:	fffff097          	auipc	ra,0xfffff
    80005966:	1c8080e7          	jalr	456(ra) # 80004b2a <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    8000596a:	fc843783          	ld	a5,-56(s0)
    8000596e:	439c                	lw	a5,0(a5)
    80005970:	0007871b          	sext.w	a4,a5
    80005974:	fc843783          	ld	a5,-56(s0)
    80005978:	0807a783          	lw	a5,128(a5)
    8000597c:	85be                	mv	a1,a5
    8000597e:	853a                	mv	a0,a4
    80005980:	fffff097          	auipc	ra,0xfffff
    80005984:	5fa080e7          	jalr	1530(ra) # 80004f7a <bfree>
    ip->addrs[NDIRECT] = 0;
    80005988:	fc843783          	ld	a5,-56(s0)
    8000598c:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005990:	fc843783          	ld	a5,-56(s0)
    80005994:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80005998:	fc843503          	ld	a0,-56(s0)
    8000599c:	00000097          	auipc	ra,0x0
    800059a0:	870080e7          	jalr	-1936(ra) # 8000520c <iupdate>
}
    800059a4:	0001                	nop
    800059a6:	70e2                	ld	ra,56(sp)
    800059a8:	7442                	ld	s0,48(sp)
    800059aa:	6121                	addi	sp,sp,64
    800059ac:	8082                	ret

00000000800059ae <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    800059ae:	1101                	addi	sp,sp,-32
    800059b0:	ec22                	sd	s0,24(sp)
    800059b2:	1000                	addi	s0,sp,32
    800059b4:	fea43423          	sd	a0,-24(s0)
    800059b8:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    800059bc:	fe843783          	ld	a5,-24(s0)
    800059c0:	439c                	lw	a5,0(a5)
    800059c2:	0007871b          	sext.w	a4,a5
    800059c6:	fe043783          	ld	a5,-32(s0)
    800059ca:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    800059cc:	fe843783          	ld	a5,-24(s0)
    800059d0:	43d8                	lw	a4,4(a5)
    800059d2:	fe043783          	ld	a5,-32(s0)
    800059d6:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    800059d8:	fe843783          	ld	a5,-24(s0)
    800059dc:	04479703          	lh	a4,68(a5)
    800059e0:	fe043783          	ld	a5,-32(s0)
    800059e4:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    800059e8:	fe843783          	ld	a5,-24(s0)
    800059ec:	04a79703          	lh	a4,74(a5)
    800059f0:	fe043783          	ld	a5,-32(s0)
    800059f4:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    800059f8:	fe843783          	ld	a5,-24(s0)
    800059fc:	47fc                	lw	a5,76(a5)
    800059fe:	02079713          	slli	a4,a5,0x20
    80005a02:	9301                	srli	a4,a4,0x20
    80005a04:	fe043783          	ld	a5,-32(s0)
    80005a08:	eb98                	sd	a4,16(a5)
}
    80005a0a:	0001                	nop
    80005a0c:	6462                	ld	s0,24(sp)
    80005a0e:	6105                	addi	sp,sp,32
    80005a10:	8082                	ret

0000000080005a12 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005a12:	715d                	addi	sp,sp,-80
    80005a14:	e486                	sd	ra,72(sp)
    80005a16:	e0a2                	sd	s0,64(sp)
    80005a18:	0880                	addi	s0,sp,80
    80005a1a:	fca43423          	sd	a0,-56(s0)
    80005a1e:	87ae                	mv	a5,a1
    80005a20:	fac43c23          	sd	a2,-72(s0)
    80005a24:	fcf42223          	sw	a5,-60(s0)
    80005a28:	87b6                	mv	a5,a3
    80005a2a:	fcf42023          	sw	a5,-64(s0)
    80005a2e:	87ba                	mv	a5,a4
    80005a30:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005a34:	fc843783          	ld	a5,-56(s0)
    80005a38:	47f8                	lw	a4,76(a5)
    80005a3a:	fc042783          	lw	a5,-64(s0)
    80005a3e:	2781                	sext.w	a5,a5
    80005a40:	00f76f63          	bltu	a4,a5,80005a5e <readi+0x4c>
    80005a44:	fc042783          	lw	a5,-64(s0)
    80005a48:	873e                	mv	a4,a5
    80005a4a:	fb442783          	lw	a5,-76(s0)
    80005a4e:	9fb9                	addw	a5,a5,a4
    80005a50:	0007871b          	sext.w	a4,a5
    80005a54:	fc042783          	lw	a5,-64(s0)
    80005a58:	2781                	sext.w	a5,a5
    80005a5a:	00f77463          	bgeu	a4,a5,80005a62 <readi+0x50>
    return 0;
    80005a5e:	4781                	li	a5,0
    80005a60:	a299                	j	80005ba6 <readi+0x194>
  if(off + n > ip->size)
    80005a62:	fc042783          	lw	a5,-64(s0)
    80005a66:	873e                	mv	a4,a5
    80005a68:	fb442783          	lw	a5,-76(s0)
    80005a6c:	9fb9                	addw	a5,a5,a4
    80005a6e:	0007871b          	sext.w	a4,a5
    80005a72:	fc843783          	ld	a5,-56(s0)
    80005a76:	47fc                	lw	a5,76(a5)
    80005a78:	00e7fa63          	bgeu	a5,a4,80005a8c <readi+0x7a>
    n = ip->size - off;
    80005a7c:	fc843783          	ld	a5,-56(s0)
    80005a80:	47fc                	lw	a5,76(a5)
    80005a82:	fc042703          	lw	a4,-64(s0)
    80005a86:	9f99                	subw	a5,a5,a4
    80005a88:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005a8c:	fe042623          	sw	zero,-20(s0)
    80005a90:	a8f5                	j	80005b8c <readi+0x17a>
    uint addr = bmap(ip, off/BSIZE);
    80005a92:	fc042783          	lw	a5,-64(s0)
    80005a96:	00a7d79b          	srliw	a5,a5,0xa
    80005a9a:	2781                	sext.w	a5,a5
    80005a9c:	85be                	mv	a1,a5
    80005a9e:	fc843503          	ld	a0,-56(s0)
    80005aa2:	00000097          	auipc	ra,0x0
    80005aa6:	c46080e7          	jalr	-954(ra) # 800056e8 <bmap>
    80005aaa:	87aa                	mv	a5,a0
    80005aac:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005ab0:	fe842783          	lw	a5,-24(s0)
    80005ab4:	2781                	sext.w	a5,a5
    80005ab6:	c7ed                	beqz	a5,80005ba0 <readi+0x18e>
      break;
    bp = bread(ip->dev, addr);
    80005ab8:	fc843783          	ld	a5,-56(s0)
    80005abc:	439c                	lw	a5,0(a5)
    80005abe:	fe842703          	lw	a4,-24(s0)
    80005ac2:	85ba                	mv	a1,a4
    80005ac4:	853e                	mv	a0,a5
    80005ac6:	fffff097          	auipc	ra,0xfffff
    80005aca:	fbe080e7          	jalr	-66(ra) # 80004a84 <bread>
    80005ace:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005ad2:	fc042783          	lw	a5,-64(s0)
    80005ad6:	3ff7f793          	andi	a5,a5,1023
    80005ada:	2781                	sext.w	a5,a5
    80005adc:	40000713          	li	a4,1024
    80005ae0:	40f707bb          	subw	a5,a4,a5
    80005ae4:	2781                	sext.w	a5,a5
    80005ae6:	fb442703          	lw	a4,-76(s0)
    80005aea:	86ba                	mv	a3,a4
    80005aec:	fec42703          	lw	a4,-20(s0)
    80005af0:	40e6873b          	subw	a4,a3,a4
    80005af4:	2701                	sext.w	a4,a4
    80005af6:	863a                	mv	a2,a4
    80005af8:	0007869b          	sext.w	a3,a5
    80005afc:	0006071b          	sext.w	a4,a2
    80005b00:	00d77363          	bgeu	a4,a3,80005b06 <readi+0xf4>
    80005b04:	87b2                	mv	a5,a2
    80005b06:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005b0a:	fe043783          	ld	a5,-32(s0)
    80005b0e:	05878713          	addi	a4,a5,88
    80005b12:	fc046783          	lwu	a5,-64(s0)
    80005b16:	3ff7f793          	andi	a5,a5,1023
    80005b1a:	973e                	add	a4,a4,a5
    80005b1c:	fdc46683          	lwu	a3,-36(s0)
    80005b20:	fc442783          	lw	a5,-60(s0)
    80005b24:	863a                	mv	a2,a4
    80005b26:	fb843583          	ld	a1,-72(s0)
    80005b2a:	853e                	mv	a0,a5
    80005b2c:	ffffe097          	auipc	ra,0xffffe
    80005b30:	de2080e7          	jalr	-542(ra) # 8000390e <either_copyout>
    80005b34:	87aa                	mv	a5,a0
    80005b36:	873e                	mv	a4,a5
    80005b38:	57fd                	li	a5,-1
    80005b3a:	00f71c63          	bne	a4,a5,80005b52 <readi+0x140>
      brelse(bp);
    80005b3e:	fe043503          	ld	a0,-32(s0)
    80005b42:	fffff097          	auipc	ra,0xfffff
    80005b46:	fe8080e7          	jalr	-24(ra) # 80004b2a <brelse>
      tot = -1;
    80005b4a:	57fd                	li	a5,-1
    80005b4c:	fef42623          	sw	a5,-20(s0)
      break;
    80005b50:	a889                	j	80005ba2 <readi+0x190>
    }
    brelse(bp);
    80005b52:	fe043503          	ld	a0,-32(s0)
    80005b56:	fffff097          	auipc	ra,0xfffff
    80005b5a:	fd4080e7          	jalr	-44(ra) # 80004b2a <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005b5e:	fec42783          	lw	a5,-20(s0)
    80005b62:	873e                	mv	a4,a5
    80005b64:	fdc42783          	lw	a5,-36(s0)
    80005b68:	9fb9                	addw	a5,a5,a4
    80005b6a:	fef42623          	sw	a5,-20(s0)
    80005b6e:	fc042783          	lw	a5,-64(s0)
    80005b72:	873e                	mv	a4,a5
    80005b74:	fdc42783          	lw	a5,-36(s0)
    80005b78:	9fb9                	addw	a5,a5,a4
    80005b7a:	fcf42023          	sw	a5,-64(s0)
    80005b7e:	fdc46783          	lwu	a5,-36(s0)
    80005b82:	fb843703          	ld	a4,-72(s0)
    80005b86:	97ba                	add	a5,a5,a4
    80005b88:	faf43c23          	sd	a5,-72(s0)
    80005b8c:	fec42783          	lw	a5,-20(s0)
    80005b90:	873e                	mv	a4,a5
    80005b92:	fb442783          	lw	a5,-76(s0)
    80005b96:	2701                	sext.w	a4,a4
    80005b98:	2781                	sext.w	a5,a5
    80005b9a:	eef76ce3          	bltu	a4,a5,80005a92 <readi+0x80>
    80005b9e:	a011                	j	80005ba2 <readi+0x190>
      break;
    80005ba0:	0001                	nop
  }
  return tot;
    80005ba2:	fec42783          	lw	a5,-20(s0)
}
    80005ba6:	853e                	mv	a0,a5
    80005ba8:	60a6                	ld	ra,72(sp)
    80005baa:	6406                	ld	s0,64(sp)
    80005bac:	6161                	addi	sp,sp,80
    80005bae:	8082                	ret

0000000080005bb0 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005bb0:	715d                	addi	sp,sp,-80
    80005bb2:	e486                	sd	ra,72(sp)
    80005bb4:	e0a2                	sd	s0,64(sp)
    80005bb6:	0880                	addi	s0,sp,80
    80005bb8:	fca43423          	sd	a0,-56(s0)
    80005bbc:	87ae                	mv	a5,a1
    80005bbe:	fac43c23          	sd	a2,-72(s0)
    80005bc2:	fcf42223          	sw	a5,-60(s0)
    80005bc6:	87b6                	mv	a5,a3
    80005bc8:	fcf42023          	sw	a5,-64(s0)
    80005bcc:	87ba                	mv	a5,a4
    80005bce:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005bd2:	fc843783          	ld	a5,-56(s0)
    80005bd6:	47f8                	lw	a4,76(a5)
    80005bd8:	fc042783          	lw	a5,-64(s0)
    80005bdc:	2781                	sext.w	a5,a5
    80005bde:	00f76f63          	bltu	a4,a5,80005bfc <writei+0x4c>
    80005be2:	fc042783          	lw	a5,-64(s0)
    80005be6:	873e                	mv	a4,a5
    80005be8:	fb442783          	lw	a5,-76(s0)
    80005bec:	9fb9                	addw	a5,a5,a4
    80005bee:	0007871b          	sext.w	a4,a5
    80005bf2:	fc042783          	lw	a5,-64(s0)
    80005bf6:	2781                	sext.w	a5,a5
    80005bf8:	00f77463          	bgeu	a4,a5,80005c00 <writei+0x50>
    return -1;
    80005bfc:	57fd                	li	a5,-1
    80005bfe:	a295                	j	80005d62 <writei+0x1b2>
  if(off + n > MAXFILE*BSIZE)
    80005c00:	fc042783          	lw	a5,-64(s0)
    80005c04:	873e                	mv	a4,a5
    80005c06:	fb442783          	lw	a5,-76(s0)
    80005c0a:	9fb9                	addw	a5,a5,a4
    80005c0c:	2781                	sext.w	a5,a5
    80005c0e:	873e                	mv	a4,a5
    80005c10:	000437b7          	lui	a5,0x43
    80005c14:	00e7f463          	bgeu	a5,a4,80005c1c <writei+0x6c>
    return -1;
    80005c18:	57fd                	li	a5,-1
    80005c1a:	a2a1                	j	80005d62 <writei+0x1b2>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005c1c:	fe042623          	sw	zero,-20(s0)
    80005c20:	a209                	j	80005d22 <writei+0x172>
    uint addr = bmap(ip, off/BSIZE);
    80005c22:	fc042783          	lw	a5,-64(s0)
    80005c26:	00a7d79b          	srliw	a5,a5,0xa
    80005c2a:	2781                	sext.w	a5,a5
    80005c2c:	85be                	mv	a1,a5
    80005c2e:	fc843503          	ld	a0,-56(s0)
    80005c32:	00000097          	auipc	ra,0x0
    80005c36:	ab6080e7          	jalr	-1354(ra) # 800056e8 <bmap>
    80005c3a:	87aa                	mv	a5,a0
    80005c3c:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005c40:	fe842783          	lw	a5,-24(s0)
    80005c44:	2781                	sext.w	a5,a5
    80005c46:	cbe5                	beqz	a5,80005d36 <writei+0x186>
      break;
    bp = bread(ip->dev, addr);
    80005c48:	fc843783          	ld	a5,-56(s0)
    80005c4c:	439c                	lw	a5,0(a5)
    80005c4e:	fe842703          	lw	a4,-24(s0)
    80005c52:	85ba                	mv	a1,a4
    80005c54:	853e                	mv	a0,a5
    80005c56:	fffff097          	auipc	ra,0xfffff
    80005c5a:	e2e080e7          	jalr	-466(ra) # 80004a84 <bread>
    80005c5e:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005c62:	fc042783          	lw	a5,-64(s0)
    80005c66:	3ff7f793          	andi	a5,a5,1023
    80005c6a:	2781                	sext.w	a5,a5
    80005c6c:	40000713          	li	a4,1024
    80005c70:	40f707bb          	subw	a5,a4,a5
    80005c74:	2781                	sext.w	a5,a5
    80005c76:	fb442703          	lw	a4,-76(s0)
    80005c7a:	86ba                	mv	a3,a4
    80005c7c:	fec42703          	lw	a4,-20(s0)
    80005c80:	40e6873b          	subw	a4,a3,a4
    80005c84:	2701                	sext.w	a4,a4
    80005c86:	863a                	mv	a2,a4
    80005c88:	0007869b          	sext.w	a3,a5
    80005c8c:	0006071b          	sext.w	a4,a2
    80005c90:	00d77363          	bgeu	a4,a3,80005c96 <writei+0xe6>
    80005c94:	87b2                	mv	a5,a2
    80005c96:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005c9a:	fe043783          	ld	a5,-32(s0)
    80005c9e:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005ca2:	fc046783          	lwu	a5,-64(s0)
    80005ca6:	3ff7f793          	andi	a5,a5,1023
    80005caa:	97ba                	add	a5,a5,a4
    80005cac:	fdc46683          	lwu	a3,-36(s0)
    80005cb0:	fc442703          	lw	a4,-60(s0)
    80005cb4:	fb843603          	ld	a2,-72(s0)
    80005cb8:	85ba                	mv	a1,a4
    80005cba:	853e                	mv	a0,a5
    80005cbc:	ffffe097          	auipc	ra,0xffffe
    80005cc0:	cc6080e7          	jalr	-826(ra) # 80003982 <either_copyin>
    80005cc4:	87aa                	mv	a5,a0
    80005cc6:	873e                	mv	a4,a5
    80005cc8:	57fd                	li	a5,-1
    80005cca:	00f71963          	bne	a4,a5,80005cdc <writei+0x12c>
      brelse(bp);
    80005cce:	fe043503          	ld	a0,-32(s0)
    80005cd2:	fffff097          	auipc	ra,0xfffff
    80005cd6:	e58080e7          	jalr	-424(ra) # 80004b2a <brelse>
      break;
    80005cda:	a8b9                	j	80005d38 <writei+0x188>
    }
    log_write(bp);
    80005cdc:	fe043503          	ld	a0,-32(s0)
    80005ce0:	00001097          	auipc	ra,0x1
    80005ce4:	aee080e7          	jalr	-1298(ra) # 800067ce <log_write>
    brelse(bp);
    80005ce8:	fe043503          	ld	a0,-32(s0)
    80005cec:	fffff097          	auipc	ra,0xfffff
    80005cf0:	e3e080e7          	jalr	-450(ra) # 80004b2a <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005cf4:	fec42783          	lw	a5,-20(s0)
    80005cf8:	873e                	mv	a4,a5
    80005cfa:	fdc42783          	lw	a5,-36(s0)
    80005cfe:	9fb9                	addw	a5,a5,a4
    80005d00:	fef42623          	sw	a5,-20(s0)
    80005d04:	fc042783          	lw	a5,-64(s0)
    80005d08:	873e                	mv	a4,a5
    80005d0a:	fdc42783          	lw	a5,-36(s0)
    80005d0e:	9fb9                	addw	a5,a5,a4
    80005d10:	fcf42023          	sw	a5,-64(s0)
    80005d14:	fdc46783          	lwu	a5,-36(s0)
    80005d18:	fb843703          	ld	a4,-72(s0)
    80005d1c:	97ba                	add	a5,a5,a4
    80005d1e:	faf43c23          	sd	a5,-72(s0)
    80005d22:	fec42783          	lw	a5,-20(s0)
    80005d26:	873e                	mv	a4,a5
    80005d28:	fb442783          	lw	a5,-76(s0)
    80005d2c:	2701                	sext.w	a4,a4
    80005d2e:	2781                	sext.w	a5,a5
    80005d30:	eef769e3          	bltu	a4,a5,80005c22 <writei+0x72>
    80005d34:	a011                	j	80005d38 <writei+0x188>
      break;
    80005d36:	0001                	nop
  }

  if(off > ip->size)
    80005d38:	fc843783          	ld	a5,-56(s0)
    80005d3c:	47f8                	lw	a4,76(a5)
    80005d3e:	fc042783          	lw	a5,-64(s0)
    80005d42:	2781                	sext.w	a5,a5
    80005d44:	00f77763          	bgeu	a4,a5,80005d52 <writei+0x1a2>
    ip->size = off;
    80005d48:	fc843783          	ld	a5,-56(s0)
    80005d4c:	fc042703          	lw	a4,-64(s0)
    80005d50:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005d52:	fc843503          	ld	a0,-56(s0)
    80005d56:	fffff097          	auipc	ra,0xfffff
    80005d5a:	4b6080e7          	jalr	1206(ra) # 8000520c <iupdate>

  return tot;
    80005d5e:	fec42783          	lw	a5,-20(s0)
}
    80005d62:	853e                	mv	a0,a5
    80005d64:	60a6                	ld	ra,72(sp)
    80005d66:	6406                	ld	s0,64(sp)
    80005d68:	6161                	addi	sp,sp,80
    80005d6a:	8082                	ret

0000000080005d6c <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005d6c:	1101                	addi	sp,sp,-32
    80005d6e:	ec06                	sd	ra,24(sp)
    80005d70:	e822                	sd	s0,16(sp)
    80005d72:	1000                	addi	s0,sp,32
    80005d74:	fea43423          	sd	a0,-24(s0)
    80005d78:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005d7c:	4639                	li	a2,14
    80005d7e:	fe043583          	ld	a1,-32(s0)
    80005d82:	fe843503          	ld	a0,-24(s0)
    80005d86:	ffffc097          	auipc	ra,0xffffc
    80005d8a:	976080e7          	jalr	-1674(ra) # 800016fc <strncmp>
    80005d8e:	87aa                	mv	a5,a0
}
    80005d90:	853e                	mv	a0,a5
    80005d92:	60e2                	ld	ra,24(sp)
    80005d94:	6442                	ld	s0,16(sp)
    80005d96:	6105                	addi	sp,sp,32
    80005d98:	8082                	ret

0000000080005d9a <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005d9a:	715d                	addi	sp,sp,-80
    80005d9c:	e486                	sd	ra,72(sp)
    80005d9e:	e0a2                	sd	s0,64(sp)
    80005da0:	0880                	addi	s0,sp,80
    80005da2:	fca43423          	sd	a0,-56(s0)
    80005da6:	fcb43023          	sd	a1,-64(s0)
    80005daa:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005dae:	fc843783          	ld	a5,-56(s0)
    80005db2:	04479783          	lh	a5,68(a5)
    80005db6:	873e                	mv	a4,a5
    80005db8:	4785                	li	a5,1
    80005dba:	00f70a63          	beq	a4,a5,80005dce <dirlookup+0x34>
    panic("dirlookup not DIR");
    80005dbe:	00005517          	auipc	a0,0x5
    80005dc2:	76250513          	addi	a0,a0,1890 # 8000b520 <etext+0x520>
    80005dc6:	ffffb097          	auipc	ra,0xffffb
    80005dca:	ec2080e7          	jalr	-318(ra) # 80000c88 <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005dce:	fe042623          	sw	zero,-20(s0)
    80005dd2:	a849                	j	80005e64 <dirlookup+0xca>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005dd4:	fd840793          	addi	a5,s0,-40
    80005dd8:	fec42683          	lw	a3,-20(s0)
    80005ddc:	4741                	li	a4,16
    80005dde:	863e                	mv	a2,a5
    80005de0:	4581                	li	a1,0
    80005de2:	fc843503          	ld	a0,-56(s0)
    80005de6:	00000097          	auipc	ra,0x0
    80005dea:	c2c080e7          	jalr	-980(ra) # 80005a12 <readi>
    80005dee:	87aa                	mv	a5,a0
    80005df0:	873e                	mv	a4,a5
    80005df2:	47c1                	li	a5,16
    80005df4:	00f70a63          	beq	a4,a5,80005e08 <dirlookup+0x6e>
      panic("dirlookup read");
    80005df8:	00005517          	auipc	a0,0x5
    80005dfc:	74050513          	addi	a0,a0,1856 # 8000b538 <etext+0x538>
    80005e00:	ffffb097          	auipc	ra,0xffffb
    80005e04:	e88080e7          	jalr	-376(ra) # 80000c88 <panic>
    if(de.inum == 0)
    80005e08:	fd845783          	lhu	a5,-40(s0)
    80005e0c:	c7b1                	beqz	a5,80005e58 <dirlookup+0xbe>
      continue;
    if(namecmp(name, de.name) == 0){
    80005e0e:	fd840793          	addi	a5,s0,-40
    80005e12:	0789                	addi	a5,a5,2
    80005e14:	85be                	mv	a1,a5
    80005e16:	fc043503          	ld	a0,-64(s0)
    80005e1a:	00000097          	auipc	ra,0x0
    80005e1e:	f52080e7          	jalr	-174(ra) # 80005d6c <namecmp>
    80005e22:	87aa                	mv	a5,a0
    80005e24:	eb9d                	bnez	a5,80005e5a <dirlookup+0xc0>
      // entry matches path element
      if(poff)
    80005e26:	fb843783          	ld	a5,-72(s0)
    80005e2a:	c791                	beqz	a5,80005e36 <dirlookup+0x9c>
        *poff = off;
    80005e2c:	fb843783          	ld	a5,-72(s0)
    80005e30:	fec42703          	lw	a4,-20(s0)
    80005e34:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005e36:	fd845783          	lhu	a5,-40(s0)
    80005e3a:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005e3e:	fc843783          	ld	a5,-56(s0)
    80005e42:	439c                	lw	a5,0(a5)
    80005e44:	fe842703          	lw	a4,-24(s0)
    80005e48:	85ba                	mv	a1,a4
    80005e4a:	853e                	mv	a0,a5
    80005e4c:	fffff097          	auipc	ra,0xfffff
    80005e50:	4a8080e7          	jalr	1192(ra) # 800052f4 <iget>
    80005e54:	87aa                	mv	a5,a0
    80005e56:	a005                	j	80005e76 <dirlookup+0xdc>
      continue;
    80005e58:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005e5a:	fec42783          	lw	a5,-20(s0)
    80005e5e:	27c1                	addiw	a5,a5,16
    80005e60:	fef42623          	sw	a5,-20(s0)
    80005e64:	fc843783          	ld	a5,-56(s0)
    80005e68:	47f8                	lw	a4,76(a5)
    80005e6a:	fec42783          	lw	a5,-20(s0)
    80005e6e:	2781                	sext.w	a5,a5
    80005e70:	f6e7e2e3          	bltu	a5,a4,80005dd4 <dirlookup+0x3a>
    }
  }

  return 0;
    80005e74:	4781                	li	a5,0
}
    80005e76:	853e                	mv	a0,a5
    80005e78:	60a6                	ld	ra,72(sp)
    80005e7a:	6406                	ld	s0,64(sp)
    80005e7c:	6161                	addi	sp,sp,80
    80005e7e:	8082                	ret

0000000080005e80 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005e80:	715d                	addi	sp,sp,-80
    80005e82:	e486                	sd	ra,72(sp)
    80005e84:	e0a2                	sd	s0,64(sp)
    80005e86:	0880                	addi	s0,sp,80
    80005e88:	fca43423          	sd	a0,-56(s0)
    80005e8c:	fcb43023          	sd	a1,-64(s0)
    80005e90:	87b2                	mv	a5,a2
    80005e92:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005e96:	4601                	li	a2,0
    80005e98:	fc043583          	ld	a1,-64(s0)
    80005e9c:	fc843503          	ld	a0,-56(s0)
    80005ea0:	00000097          	auipc	ra,0x0
    80005ea4:	efa080e7          	jalr	-262(ra) # 80005d9a <dirlookup>
    80005ea8:	fea43023          	sd	a0,-32(s0)
    80005eac:	fe043783          	ld	a5,-32(s0)
    80005eb0:	cb89                	beqz	a5,80005ec2 <dirlink+0x42>
    iput(ip);
    80005eb2:	fe043503          	ld	a0,-32(s0)
    80005eb6:	fffff097          	auipc	ra,0xfffff
    80005eba:	734080e7          	jalr	1844(ra) # 800055ea <iput>
    return -1;
    80005ebe:	57fd                	li	a5,-1
    80005ec0:	a075                	j	80005f6c <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005ec2:	fe042623          	sw	zero,-20(s0)
    80005ec6:	a0a1                	j	80005f0e <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005ec8:	fd040793          	addi	a5,s0,-48
    80005ecc:	fec42683          	lw	a3,-20(s0)
    80005ed0:	4741                	li	a4,16
    80005ed2:	863e                	mv	a2,a5
    80005ed4:	4581                	li	a1,0
    80005ed6:	fc843503          	ld	a0,-56(s0)
    80005eda:	00000097          	auipc	ra,0x0
    80005ede:	b38080e7          	jalr	-1224(ra) # 80005a12 <readi>
    80005ee2:	87aa                	mv	a5,a0
    80005ee4:	873e                	mv	a4,a5
    80005ee6:	47c1                	li	a5,16
    80005ee8:	00f70a63          	beq	a4,a5,80005efc <dirlink+0x7c>
      panic("dirlink read");
    80005eec:	00005517          	auipc	a0,0x5
    80005ef0:	65c50513          	addi	a0,a0,1628 # 8000b548 <etext+0x548>
    80005ef4:	ffffb097          	auipc	ra,0xffffb
    80005ef8:	d94080e7          	jalr	-620(ra) # 80000c88 <panic>
    if(de.inum == 0)
    80005efc:	fd045783          	lhu	a5,-48(s0)
    80005f00:	cf99                	beqz	a5,80005f1e <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005f02:	fec42783          	lw	a5,-20(s0)
    80005f06:	27c1                	addiw	a5,a5,16
    80005f08:	2781                	sext.w	a5,a5
    80005f0a:	fef42623          	sw	a5,-20(s0)
    80005f0e:	fc843783          	ld	a5,-56(s0)
    80005f12:	47f8                	lw	a4,76(a5)
    80005f14:	fec42783          	lw	a5,-20(s0)
    80005f18:	fae7e8e3          	bltu	a5,a4,80005ec8 <dirlink+0x48>
    80005f1c:	a011                	j	80005f20 <dirlink+0xa0>
      break;
    80005f1e:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005f20:	fd040793          	addi	a5,s0,-48
    80005f24:	0789                	addi	a5,a5,2
    80005f26:	4639                	li	a2,14
    80005f28:	fc043583          	ld	a1,-64(s0)
    80005f2c:	853e                	mv	a0,a5
    80005f2e:	ffffc097          	auipc	ra,0xffffc
    80005f32:	858080e7          	jalr	-1960(ra) # 80001786 <strncpy>
  de.inum = inum;
    80005f36:	fbc42783          	lw	a5,-68(s0)
    80005f3a:	17c2                	slli	a5,a5,0x30
    80005f3c:	93c1                	srli	a5,a5,0x30
    80005f3e:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005f42:	fd040793          	addi	a5,s0,-48
    80005f46:	fec42683          	lw	a3,-20(s0)
    80005f4a:	4741                	li	a4,16
    80005f4c:	863e                	mv	a2,a5
    80005f4e:	4581                	li	a1,0
    80005f50:	fc843503          	ld	a0,-56(s0)
    80005f54:	00000097          	auipc	ra,0x0
    80005f58:	c5c080e7          	jalr	-932(ra) # 80005bb0 <writei>
    80005f5c:	87aa                	mv	a5,a0
    80005f5e:	873e                	mv	a4,a5
    80005f60:	47c1                	li	a5,16
    80005f62:	00f70463          	beq	a4,a5,80005f6a <dirlink+0xea>
    return -1;
    80005f66:	57fd                	li	a5,-1
    80005f68:	a011                	j	80005f6c <dirlink+0xec>

  return 0;
    80005f6a:	4781                	li	a5,0
}
    80005f6c:	853e                	mv	a0,a5
    80005f6e:	60a6                	ld	ra,72(sp)
    80005f70:	6406                	ld	s0,64(sp)
    80005f72:	6161                	addi	sp,sp,80
    80005f74:	8082                	ret

0000000080005f76 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005f76:	7179                	addi	sp,sp,-48
    80005f78:	f406                	sd	ra,40(sp)
    80005f7a:	f022                	sd	s0,32(sp)
    80005f7c:	1800                	addi	s0,sp,48
    80005f7e:	fca43c23          	sd	a0,-40(s0)
    80005f82:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005f86:	a031                	j	80005f92 <skipelem+0x1c>
    path++;
    80005f88:	fd843783          	ld	a5,-40(s0)
    80005f8c:	0785                	addi	a5,a5,1
    80005f8e:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005f92:	fd843783          	ld	a5,-40(s0)
    80005f96:	0007c783          	lbu	a5,0(a5)
    80005f9a:	873e                	mv	a4,a5
    80005f9c:	02f00793          	li	a5,47
    80005fa0:	fef704e3          	beq	a4,a5,80005f88 <skipelem+0x12>
  if(*path == 0)
    80005fa4:	fd843783          	ld	a5,-40(s0)
    80005fa8:	0007c783          	lbu	a5,0(a5)
    80005fac:	e399                	bnez	a5,80005fb2 <skipelem+0x3c>
    return 0;
    80005fae:	4781                	li	a5,0
    80005fb0:	a06d                	j	8000605a <skipelem+0xe4>
  s = path;
    80005fb2:	fd843783          	ld	a5,-40(s0)
    80005fb6:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005fba:	a031                	j	80005fc6 <skipelem+0x50>
    path++;
    80005fbc:	fd843783          	ld	a5,-40(s0)
    80005fc0:	0785                	addi	a5,a5,1
    80005fc2:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005fc6:	fd843783          	ld	a5,-40(s0)
    80005fca:	0007c783          	lbu	a5,0(a5)
    80005fce:	873e                	mv	a4,a5
    80005fd0:	02f00793          	li	a5,47
    80005fd4:	00f70763          	beq	a4,a5,80005fe2 <skipelem+0x6c>
    80005fd8:	fd843783          	ld	a5,-40(s0)
    80005fdc:	0007c783          	lbu	a5,0(a5)
    80005fe0:	fff1                	bnez	a5,80005fbc <skipelem+0x46>
  len = path - s;
    80005fe2:	fd843703          	ld	a4,-40(s0)
    80005fe6:	fe843783          	ld	a5,-24(s0)
    80005fea:	40f707b3          	sub	a5,a4,a5
    80005fee:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005ff2:	fe442783          	lw	a5,-28(s0)
    80005ff6:	0007871b          	sext.w	a4,a5
    80005ffa:	47b5                	li	a5,13
    80005ffc:	00e7dc63          	bge	a5,a4,80006014 <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80006000:	4639                	li	a2,14
    80006002:	fe843583          	ld	a1,-24(s0)
    80006006:	fd043503          	ld	a0,-48(s0)
    8000600a:	ffffb097          	auipc	ra,0xffffb
    8000600e:	5de080e7          	jalr	1502(ra) # 800015e8 <memmove>
    80006012:	a80d                	j	80006044 <skipelem+0xce>
  else {
    memmove(name, s, len);
    80006014:	fe442783          	lw	a5,-28(s0)
    80006018:	863e                	mv	a2,a5
    8000601a:	fe843583          	ld	a1,-24(s0)
    8000601e:	fd043503          	ld	a0,-48(s0)
    80006022:	ffffb097          	auipc	ra,0xffffb
    80006026:	5c6080e7          	jalr	1478(ra) # 800015e8 <memmove>
    name[len] = 0;
    8000602a:	fe442783          	lw	a5,-28(s0)
    8000602e:	fd043703          	ld	a4,-48(s0)
    80006032:	97ba                	add	a5,a5,a4
    80006034:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80006038:	a031                	j	80006044 <skipelem+0xce>
    path++;
    8000603a:	fd843783          	ld	a5,-40(s0)
    8000603e:	0785                	addi	a5,a5,1
    80006040:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80006044:	fd843783          	ld	a5,-40(s0)
    80006048:	0007c783          	lbu	a5,0(a5)
    8000604c:	873e                	mv	a4,a5
    8000604e:	02f00793          	li	a5,47
    80006052:	fef704e3          	beq	a4,a5,8000603a <skipelem+0xc4>
  return path;
    80006056:	fd843783          	ld	a5,-40(s0)
}
    8000605a:	853e                	mv	a0,a5
    8000605c:	70a2                	ld	ra,40(sp)
    8000605e:	7402                	ld	s0,32(sp)
    80006060:	6145                	addi	sp,sp,48
    80006062:	8082                	ret

0000000080006064 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80006064:	7139                	addi	sp,sp,-64
    80006066:	fc06                	sd	ra,56(sp)
    80006068:	f822                	sd	s0,48(sp)
    8000606a:	0080                	addi	s0,sp,64
    8000606c:	fca43c23          	sd	a0,-40(s0)
    80006070:	87ae                	mv	a5,a1
    80006072:	fcc43423          	sd	a2,-56(s0)
    80006076:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    8000607a:	fd843783          	ld	a5,-40(s0)
    8000607e:	0007c783          	lbu	a5,0(a5)
    80006082:	873e                	mv	a4,a5
    80006084:	02f00793          	li	a5,47
    80006088:	00f71b63          	bne	a4,a5,8000609e <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    8000608c:	4585                	li	a1,1
    8000608e:	4505                	li	a0,1
    80006090:	fffff097          	auipc	ra,0xfffff
    80006094:	264080e7          	jalr	612(ra) # 800052f4 <iget>
    80006098:	fea43423          	sd	a0,-24(s0)
    8000609c:	a845                	j	8000614c <namex+0xe8>
  else
    ip = idup(myproc()->cwd);
    8000609e:	ffffd097          	auipc	ra,0xffffd
    800060a2:	a60080e7          	jalr	-1440(ra) # 80002afe <myproc>
    800060a6:	87aa                	mv	a5,a0
    800060a8:	1507b783          	ld	a5,336(a5)
    800060ac:	853e                	mv	a0,a5
    800060ae:	fffff097          	auipc	ra,0xfffff
    800060b2:	362080e7          	jalr	866(ra) # 80005410 <idup>
    800060b6:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    800060ba:	a849                	j	8000614c <namex+0xe8>
    ilock(ip);
    800060bc:	fe843503          	ld	a0,-24(s0)
    800060c0:	fffff097          	auipc	ra,0xfffff
    800060c4:	39c080e7          	jalr	924(ra) # 8000545c <ilock>
    if(ip->type != T_DIR){
    800060c8:	fe843783          	ld	a5,-24(s0)
    800060cc:	04479783          	lh	a5,68(a5)
    800060d0:	873e                	mv	a4,a5
    800060d2:	4785                	li	a5,1
    800060d4:	00f70a63          	beq	a4,a5,800060e8 <namex+0x84>
      iunlockput(ip);
    800060d8:	fe843503          	ld	a0,-24(s0)
    800060dc:	fffff097          	auipc	ra,0xfffff
    800060e0:	5de080e7          	jalr	1502(ra) # 800056ba <iunlockput>
      return 0;
    800060e4:	4781                	li	a5,0
    800060e6:	a871                	j	80006182 <namex+0x11e>
    }
    if(nameiparent && *path == '\0'){
    800060e8:	fd442783          	lw	a5,-44(s0)
    800060ec:	2781                	sext.w	a5,a5
    800060ee:	cf99                	beqz	a5,8000610c <namex+0xa8>
    800060f0:	fd843783          	ld	a5,-40(s0)
    800060f4:	0007c783          	lbu	a5,0(a5)
    800060f8:	eb91                	bnez	a5,8000610c <namex+0xa8>
      // Stop one level early.
      iunlock(ip);
    800060fa:	fe843503          	ld	a0,-24(s0)
    800060fe:	fffff097          	auipc	ra,0xfffff
    80006102:	492080e7          	jalr	1170(ra) # 80005590 <iunlock>
      return ip;
    80006106:	fe843783          	ld	a5,-24(s0)
    8000610a:	a8a5                	j	80006182 <namex+0x11e>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    8000610c:	4601                	li	a2,0
    8000610e:	fc843583          	ld	a1,-56(s0)
    80006112:	fe843503          	ld	a0,-24(s0)
    80006116:	00000097          	auipc	ra,0x0
    8000611a:	c84080e7          	jalr	-892(ra) # 80005d9a <dirlookup>
    8000611e:	fea43023          	sd	a0,-32(s0)
    80006122:	fe043783          	ld	a5,-32(s0)
    80006126:	eb89                	bnez	a5,80006138 <namex+0xd4>
      iunlockput(ip);
    80006128:	fe843503          	ld	a0,-24(s0)
    8000612c:	fffff097          	auipc	ra,0xfffff
    80006130:	58e080e7          	jalr	1422(ra) # 800056ba <iunlockput>
      return 0;
    80006134:	4781                	li	a5,0
    80006136:	a0b1                	j	80006182 <namex+0x11e>
    }
    iunlockput(ip);
    80006138:	fe843503          	ld	a0,-24(s0)
    8000613c:	fffff097          	auipc	ra,0xfffff
    80006140:	57e080e7          	jalr	1406(ra) # 800056ba <iunlockput>
    ip = next;
    80006144:	fe043783          	ld	a5,-32(s0)
    80006148:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    8000614c:	fc843583          	ld	a1,-56(s0)
    80006150:	fd843503          	ld	a0,-40(s0)
    80006154:	00000097          	auipc	ra,0x0
    80006158:	e22080e7          	jalr	-478(ra) # 80005f76 <skipelem>
    8000615c:	fca43c23          	sd	a0,-40(s0)
    80006160:	fd843783          	ld	a5,-40(s0)
    80006164:	ffa1                	bnez	a5,800060bc <namex+0x58>
  }
  if(nameiparent){
    80006166:	fd442783          	lw	a5,-44(s0)
    8000616a:	2781                	sext.w	a5,a5
    8000616c:	cb89                	beqz	a5,8000617e <namex+0x11a>
    iput(ip);
    8000616e:	fe843503          	ld	a0,-24(s0)
    80006172:	fffff097          	auipc	ra,0xfffff
    80006176:	478080e7          	jalr	1144(ra) # 800055ea <iput>
    return 0;
    8000617a:	4781                	li	a5,0
    8000617c:	a019                	j	80006182 <namex+0x11e>
  }
  return ip;
    8000617e:	fe843783          	ld	a5,-24(s0)
}
    80006182:	853e                	mv	a0,a5
    80006184:	70e2                	ld	ra,56(sp)
    80006186:	7442                	ld	s0,48(sp)
    80006188:	6121                	addi	sp,sp,64
    8000618a:	8082                	ret

000000008000618c <namei>:

struct inode*
namei(char *path)
{
    8000618c:	7179                	addi	sp,sp,-48
    8000618e:	f406                	sd	ra,40(sp)
    80006190:	f022                	sd	s0,32(sp)
    80006192:	1800                	addi	s0,sp,48
    80006194:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80006198:	fe040793          	addi	a5,s0,-32
    8000619c:	863e                	mv	a2,a5
    8000619e:	4581                	li	a1,0
    800061a0:	fd843503          	ld	a0,-40(s0)
    800061a4:	00000097          	auipc	ra,0x0
    800061a8:	ec0080e7          	jalr	-320(ra) # 80006064 <namex>
    800061ac:	87aa                	mv	a5,a0
}
    800061ae:	853e                	mv	a0,a5
    800061b0:	70a2                	ld	ra,40(sp)
    800061b2:	7402                	ld	s0,32(sp)
    800061b4:	6145                	addi	sp,sp,48
    800061b6:	8082                	ret

00000000800061b8 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    800061b8:	1101                	addi	sp,sp,-32
    800061ba:	ec06                	sd	ra,24(sp)
    800061bc:	e822                	sd	s0,16(sp)
    800061be:	1000                	addi	s0,sp,32
    800061c0:	fea43423          	sd	a0,-24(s0)
    800061c4:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    800061c8:	fe043603          	ld	a2,-32(s0)
    800061cc:	4585                	li	a1,1
    800061ce:	fe843503          	ld	a0,-24(s0)
    800061d2:	00000097          	auipc	ra,0x0
    800061d6:	e92080e7          	jalr	-366(ra) # 80006064 <namex>
    800061da:	87aa                	mv	a5,a0
}
    800061dc:	853e                	mv	a0,a5
    800061de:	60e2                	ld	ra,24(sp)
    800061e0:	6442                	ld	s0,16(sp)
    800061e2:	6105                	addi	sp,sp,32
    800061e4:	8082                	ret

00000000800061e6 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    800061e6:	1101                	addi	sp,sp,-32
    800061e8:	ec06                	sd	ra,24(sp)
    800061ea:	e822                	sd	s0,16(sp)
    800061ec:	1000                	addi	s0,sp,32
    800061ee:	87aa                	mv	a5,a0
    800061f0:	feb43023          	sd	a1,-32(s0)
    800061f4:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    800061f8:	00005597          	auipc	a1,0x5
    800061fc:	36058593          	addi	a1,a1,864 # 8000b558 <etext+0x558>
    80006200:	00020517          	auipc	a0,0x20
    80006204:	03850513          	addi	a0,a0,56 # 80026238 <log>
    80006208:	ffffb097          	auipc	ra,0xffffb
    8000620c:	0f8080e7          	jalr	248(ra) # 80001300 <initlock>
  log.start = sb->logstart;
    80006210:	fe043783          	ld	a5,-32(s0)
    80006214:	4bdc                	lw	a5,20(a5)
    80006216:	0007871b          	sext.w	a4,a5
    8000621a:	00020797          	auipc	a5,0x20
    8000621e:	01e78793          	addi	a5,a5,30 # 80026238 <log>
    80006222:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80006224:	fe043783          	ld	a5,-32(s0)
    80006228:	4b9c                	lw	a5,16(a5)
    8000622a:	0007871b          	sext.w	a4,a5
    8000622e:	00020797          	auipc	a5,0x20
    80006232:	00a78793          	addi	a5,a5,10 # 80026238 <log>
    80006236:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80006238:	00020797          	auipc	a5,0x20
    8000623c:	00078793          	mv	a5,a5
    80006240:	fec42703          	lw	a4,-20(s0)
    80006244:	d798                	sw	a4,40(a5)
  recover_from_log();
    80006246:	00000097          	auipc	ra,0x0
    8000624a:	272080e7          	jalr	626(ra) # 800064b8 <recover_from_log>
}
    8000624e:	0001                	nop
    80006250:	60e2                	ld	ra,24(sp)
    80006252:	6442                	ld	s0,16(sp)
    80006254:	6105                	addi	sp,sp,32
    80006256:	8082                	ret

0000000080006258 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80006258:	7139                	addi	sp,sp,-64
    8000625a:	fc06                	sd	ra,56(sp)
    8000625c:	f822                	sd	s0,48(sp)
    8000625e:	0080                	addi	s0,sp,64
    80006260:	87aa                	mv	a5,a0
    80006262:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006266:	fe042623          	sw	zero,-20(s0)
    8000626a:	a0f9                	j	80006338 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    8000626c:	00020797          	auipc	a5,0x20
    80006270:	fcc78793          	addi	a5,a5,-52 # 80026238 <log>
    80006274:	579c                	lw	a5,40(a5)
    80006276:	0007871b          	sext.w	a4,a5
    8000627a:	00020797          	auipc	a5,0x20
    8000627e:	fbe78793          	addi	a5,a5,-66 # 80026238 <log>
    80006282:	4f9c                	lw	a5,24(a5)
    80006284:	fec42683          	lw	a3,-20(s0)
    80006288:	9fb5                	addw	a5,a5,a3
    8000628a:	2781                	sext.w	a5,a5
    8000628c:	2785                	addiw	a5,a5,1
    8000628e:	2781                	sext.w	a5,a5
    80006290:	2781                	sext.w	a5,a5
    80006292:	85be                	mv	a1,a5
    80006294:	853a                	mv	a0,a4
    80006296:	ffffe097          	auipc	ra,0xffffe
    8000629a:	7ee080e7          	jalr	2030(ra) # 80004a84 <bread>
    8000629e:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    800062a2:	00020797          	auipc	a5,0x20
    800062a6:	f9678793          	addi	a5,a5,-106 # 80026238 <log>
    800062aa:	579c                	lw	a5,40(a5)
    800062ac:	0007869b          	sext.w	a3,a5
    800062b0:	00020717          	auipc	a4,0x20
    800062b4:	f8870713          	addi	a4,a4,-120 # 80026238 <log>
    800062b8:	fec42783          	lw	a5,-20(s0)
    800062bc:	07a1                	addi	a5,a5,8
    800062be:	078a                	slli	a5,a5,0x2
    800062c0:	97ba                	add	a5,a5,a4
    800062c2:	4b9c                	lw	a5,16(a5)
    800062c4:	2781                	sext.w	a5,a5
    800062c6:	85be                	mv	a1,a5
    800062c8:	8536                	mv	a0,a3
    800062ca:	ffffe097          	auipc	ra,0xffffe
    800062ce:	7ba080e7          	jalr	1978(ra) # 80004a84 <bread>
    800062d2:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    800062d6:	fd843783          	ld	a5,-40(s0)
    800062da:	05878713          	addi	a4,a5,88
    800062de:	fe043783          	ld	a5,-32(s0)
    800062e2:	05878793          	addi	a5,a5,88
    800062e6:	40000613          	li	a2,1024
    800062ea:	85be                	mv	a1,a5
    800062ec:	853a                	mv	a0,a4
    800062ee:	ffffb097          	auipc	ra,0xffffb
    800062f2:	2fa080e7          	jalr	762(ra) # 800015e8 <memmove>
    bwrite(dbuf);  // write dst to disk
    800062f6:	fd843503          	ld	a0,-40(s0)
    800062fa:	ffffe097          	auipc	ra,0xffffe
    800062fe:	7e6080e7          	jalr	2022(ra) # 80004ae0 <bwrite>
    if(recovering == 0)
    80006302:	fcc42783          	lw	a5,-52(s0)
    80006306:	2781                	sext.w	a5,a5
    80006308:	e799                	bnez	a5,80006316 <install_trans+0xbe>
      bunpin(dbuf);
    8000630a:	fd843503          	ld	a0,-40(s0)
    8000630e:	fffff097          	auipc	ra,0xfffff
    80006312:	952080e7          	jalr	-1710(ra) # 80004c60 <bunpin>
    brelse(lbuf);
    80006316:	fe043503          	ld	a0,-32(s0)
    8000631a:	fffff097          	auipc	ra,0xfffff
    8000631e:	810080e7          	jalr	-2032(ra) # 80004b2a <brelse>
    brelse(dbuf);
    80006322:	fd843503          	ld	a0,-40(s0)
    80006326:	fffff097          	auipc	ra,0xfffff
    8000632a:	804080e7          	jalr	-2044(ra) # 80004b2a <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    8000632e:	fec42783          	lw	a5,-20(s0)
    80006332:	2785                	addiw	a5,a5,1
    80006334:	fef42623          	sw	a5,-20(s0)
    80006338:	00020797          	auipc	a5,0x20
    8000633c:	f0078793          	addi	a5,a5,-256 # 80026238 <log>
    80006340:	57d8                	lw	a4,44(a5)
    80006342:	fec42783          	lw	a5,-20(s0)
    80006346:	2781                	sext.w	a5,a5
    80006348:	f2e7c2e3          	blt	a5,a4,8000626c <install_trans+0x14>
  }
}
    8000634c:	0001                	nop
    8000634e:	0001                	nop
    80006350:	70e2                	ld	ra,56(sp)
    80006352:	7442                	ld	s0,48(sp)
    80006354:	6121                	addi	sp,sp,64
    80006356:	8082                	ret

0000000080006358 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    80006358:	7179                	addi	sp,sp,-48
    8000635a:	f406                	sd	ra,40(sp)
    8000635c:	f022                	sd	s0,32(sp)
    8000635e:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006360:	00020797          	auipc	a5,0x20
    80006364:	ed878793          	addi	a5,a5,-296 # 80026238 <log>
    80006368:	579c                	lw	a5,40(a5)
    8000636a:	0007871b          	sext.w	a4,a5
    8000636e:	00020797          	auipc	a5,0x20
    80006372:	eca78793          	addi	a5,a5,-310 # 80026238 <log>
    80006376:	4f9c                	lw	a5,24(a5)
    80006378:	2781                	sext.w	a5,a5
    8000637a:	85be                	mv	a1,a5
    8000637c:	853a                	mv	a0,a4
    8000637e:	ffffe097          	auipc	ra,0xffffe
    80006382:	706080e7          	jalr	1798(ra) # 80004a84 <bread>
    80006386:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    8000638a:	fe043783          	ld	a5,-32(s0)
    8000638e:	05878793          	addi	a5,a5,88
    80006392:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80006396:	fd843783          	ld	a5,-40(s0)
    8000639a:	4398                	lw	a4,0(a5)
    8000639c:	00020797          	auipc	a5,0x20
    800063a0:	e9c78793          	addi	a5,a5,-356 # 80026238 <log>
    800063a4:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    800063a6:	fe042623          	sw	zero,-20(s0)
    800063aa:	a03d                	j	800063d8 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    800063ac:	fd843703          	ld	a4,-40(s0)
    800063b0:	fec42783          	lw	a5,-20(s0)
    800063b4:	078a                	slli	a5,a5,0x2
    800063b6:	97ba                	add	a5,a5,a4
    800063b8:	43d8                	lw	a4,4(a5)
    800063ba:	00020697          	auipc	a3,0x20
    800063be:	e7e68693          	addi	a3,a3,-386 # 80026238 <log>
    800063c2:	fec42783          	lw	a5,-20(s0)
    800063c6:	07a1                	addi	a5,a5,8
    800063c8:	078a                	slli	a5,a5,0x2
    800063ca:	97b6                	add	a5,a5,a3
    800063cc:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    800063ce:	fec42783          	lw	a5,-20(s0)
    800063d2:	2785                	addiw	a5,a5,1
    800063d4:	fef42623          	sw	a5,-20(s0)
    800063d8:	00020797          	auipc	a5,0x20
    800063dc:	e6078793          	addi	a5,a5,-416 # 80026238 <log>
    800063e0:	57d8                	lw	a4,44(a5)
    800063e2:	fec42783          	lw	a5,-20(s0)
    800063e6:	2781                	sext.w	a5,a5
    800063e8:	fce7c2e3          	blt	a5,a4,800063ac <read_head+0x54>
  }
  brelse(buf);
    800063ec:	fe043503          	ld	a0,-32(s0)
    800063f0:	ffffe097          	auipc	ra,0xffffe
    800063f4:	73a080e7          	jalr	1850(ra) # 80004b2a <brelse>
}
    800063f8:	0001                	nop
    800063fa:	70a2                	ld	ra,40(sp)
    800063fc:	7402                	ld	s0,32(sp)
    800063fe:	6145                	addi	sp,sp,48
    80006400:	8082                	ret

0000000080006402 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    80006402:	7179                	addi	sp,sp,-48
    80006404:	f406                	sd	ra,40(sp)
    80006406:	f022                	sd	s0,32(sp)
    80006408:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    8000640a:	00020797          	auipc	a5,0x20
    8000640e:	e2e78793          	addi	a5,a5,-466 # 80026238 <log>
    80006412:	579c                	lw	a5,40(a5)
    80006414:	0007871b          	sext.w	a4,a5
    80006418:	00020797          	auipc	a5,0x20
    8000641c:	e2078793          	addi	a5,a5,-480 # 80026238 <log>
    80006420:	4f9c                	lw	a5,24(a5)
    80006422:	2781                	sext.w	a5,a5
    80006424:	85be                	mv	a1,a5
    80006426:	853a                	mv	a0,a4
    80006428:	ffffe097          	auipc	ra,0xffffe
    8000642c:	65c080e7          	jalr	1628(ra) # 80004a84 <bread>
    80006430:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    80006434:	fe043783          	ld	a5,-32(s0)
    80006438:	05878793          	addi	a5,a5,88
    8000643c:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    80006440:	00020797          	auipc	a5,0x20
    80006444:	df878793          	addi	a5,a5,-520 # 80026238 <log>
    80006448:	57d8                	lw	a4,44(a5)
    8000644a:	fd843783          	ld	a5,-40(s0)
    8000644e:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006450:	fe042623          	sw	zero,-20(s0)
    80006454:	a03d                	j	80006482 <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    80006456:	00020717          	auipc	a4,0x20
    8000645a:	de270713          	addi	a4,a4,-542 # 80026238 <log>
    8000645e:	fec42783          	lw	a5,-20(s0)
    80006462:	07a1                	addi	a5,a5,8
    80006464:	078a                	slli	a5,a5,0x2
    80006466:	97ba                	add	a5,a5,a4
    80006468:	4b98                	lw	a4,16(a5)
    8000646a:	fd843683          	ld	a3,-40(s0)
    8000646e:	fec42783          	lw	a5,-20(s0)
    80006472:	078a                	slli	a5,a5,0x2
    80006474:	97b6                	add	a5,a5,a3
    80006476:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006478:	fec42783          	lw	a5,-20(s0)
    8000647c:	2785                	addiw	a5,a5,1
    8000647e:	fef42623          	sw	a5,-20(s0)
    80006482:	00020797          	auipc	a5,0x20
    80006486:	db678793          	addi	a5,a5,-586 # 80026238 <log>
    8000648a:	57d8                	lw	a4,44(a5)
    8000648c:	fec42783          	lw	a5,-20(s0)
    80006490:	2781                	sext.w	a5,a5
    80006492:	fce7c2e3          	blt	a5,a4,80006456 <write_head+0x54>
  }
  bwrite(buf);
    80006496:	fe043503          	ld	a0,-32(s0)
    8000649a:	ffffe097          	auipc	ra,0xffffe
    8000649e:	646080e7          	jalr	1606(ra) # 80004ae0 <bwrite>
  brelse(buf);
    800064a2:	fe043503          	ld	a0,-32(s0)
    800064a6:	ffffe097          	auipc	ra,0xffffe
    800064aa:	684080e7          	jalr	1668(ra) # 80004b2a <brelse>
}
    800064ae:	0001                	nop
    800064b0:	70a2                	ld	ra,40(sp)
    800064b2:	7402                	ld	s0,32(sp)
    800064b4:	6145                	addi	sp,sp,48
    800064b6:	8082                	ret

00000000800064b8 <recover_from_log>:

static void
recover_from_log(void)
{
    800064b8:	1141                	addi	sp,sp,-16
    800064ba:	e406                	sd	ra,8(sp)
    800064bc:	e022                	sd	s0,0(sp)
    800064be:	0800                	addi	s0,sp,16
  read_head();
    800064c0:	00000097          	auipc	ra,0x0
    800064c4:	e98080e7          	jalr	-360(ra) # 80006358 <read_head>
  install_trans(1); // if committed, copy from log to disk
    800064c8:	4505                	li	a0,1
    800064ca:	00000097          	auipc	ra,0x0
    800064ce:	d8e080e7          	jalr	-626(ra) # 80006258 <install_trans>
  log.lh.n = 0;
    800064d2:	00020797          	auipc	a5,0x20
    800064d6:	d6678793          	addi	a5,a5,-666 # 80026238 <log>
    800064da:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    800064de:	00000097          	auipc	ra,0x0
    800064e2:	f24080e7          	jalr	-220(ra) # 80006402 <write_head>
}
    800064e6:	0001                	nop
    800064e8:	60a2                	ld	ra,8(sp)
    800064ea:	6402                	ld	s0,0(sp)
    800064ec:	0141                	addi	sp,sp,16
    800064ee:	8082                	ret

00000000800064f0 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    800064f0:	1141                	addi	sp,sp,-16
    800064f2:	e406                	sd	ra,8(sp)
    800064f4:	e022                	sd	s0,0(sp)
    800064f6:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    800064f8:	00020517          	auipc	a0,0x20
    800064fc:	d4050513          	addi	a0,a0,-704 # 80026238 <log>
    80006500:	ffffb097          	auipc	ra,0xffffb
    80006504:	e30080e7          	jalr	-464(ra) # 80001330 <acquire>
  while(1){
    if(log.committing){
    80006508:	00020797          	auipc	a5,0x20
    8000650c:	d3078793          	addi	a5,a5,-720 # 80026238 <log>
    80006510:	53dc                	lw	a5,36(a5)
    80006512:	cf91                	beqz	a5,8000652e <begin_op+0x3e>
      sleep(&log, &log.lock);
    80006514:	00020597          	auipc	a1,0x20
    80006518:	d2458593          	addi	a1,a1,-732 # 80026238 <log>
    8000651c:	00020517          	auipc	a0,0x20
    80006520:	d1c50513          	addi	a0,a0,-740 # 80026238 <log>
    80006524:	ffffd097          	auipc	ra,0xffffd
    80006528:	19c080e7          	jalr	412(ra) # 800036c0 <sleep>
    8000652c:	bff1                	j	80006508 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    8000652e:	00020797          	auipc	a5,0x20
    80006532:	d0a78793          	addi	a5,a5,-758 # 80026238 <log>
    80006536:	57d8                	lw	a4,44(a5)
    80006538:	00020797          	auipc	a5,0x20
    8000653c:	d0078793          	addi	a5,a5,-768 # 80026238 <log>
    80006540:	539c                	lw	a5,32(a5)
    80006542:	2785                	addiw	a5,a5,1
    80006544:	2781                	sext.w	a5,a5
    80006546:	86be                	mv	a3,a5
    80006548:	87b6                	mv	a5,a3
    8000654a:	0027979b          	slliw	a5,a5,0x2
    8000654e:	9fb5                	addw	a5,a5,a3
    80006550:	0017979b          	slliw	a5,a5,0x1
    80006554:	2781                	sext.w	a5,a5
    80006556:	9fb9                	addw	a5,a5,a4
    80006558:	2781                	sext.w	a5,a5
    8000655a:	873e                	mv	a4,a5
    8000655c:	47f9                	li	a5,30
    8000655e:	00e7df63          	bge	a5,a4,8000657c <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    80006562:	00020597          	auipc	a1,0x20
    80006566:	cd658593          	addi	a1,a1,-810 # 80026238 <log>
    8000656a:	00020517          	auipc	a0,0x20
    8000656e:	cce50513          	addi	a0,a0,-818 # 80026238 <log>
    80006572:	ffffd097          	auipc	ra,0xffffd
    80006576:	14e080e7          	jalr	334(ra) # 800036c0 <sleep>
    8000657a:	b779                	j	80006508 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    8000657c:	00020797          	auipc	a5,0x20
    80006580:	cbc78793          	addi	a5,a5,-836 # 80026238 <log>
    80006584:	539c                	lw	a5,32(a5)
    80006586:	2785                	addiw	a5,a5,1
    80006588:	0007871b          	sext.w	a4,a5
    8000658c:	00020797          	auipc	a5,0x20
    80006590:	cac78793          	addi	a5,a5,-852 # 80026238 <log>
    80006594:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006596:	00020517          	auipc	a0,0x20
    8000659a:	ca250513          	addi	a0,a0,-862 # 80026238 <log>
    8000659e:	ffffb097          	auipc	ra,0xffffb
    800065a2:	df6080e7          	jalr	-522(ra) # 80001394 <release>
      break;
    800065a6:	0001                	nop
    }
  }
}
    800065a8:	0001                	nop
    800065aa:	60a2                	ld	ra,8(sp)
    800065ac:	6402                	ld	s0,0(sp)
    800065ae:	0141                	addi	sp,sp,16
    800065b0:	8082                	ret

00000000800065b2 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    800065b2:	1101                	addi	sp,sp,-32
    800065b4:	ec06                	sd	ra,24(sp)
    800065b6:	e822                	sd	s0,16(sp)
    800065b8:	1000                	addi	s0,sp,32
  int do_commit = 0;
    800065ba:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    800065be:	00020517          	auipc	a0,0x20
    800065c2:	c7a50513          	addi	a0,a0,-902 # 80026238 <log>
    800065c6:	ffffb097          	auipc	ra,0xffffb
    800065ca:	d6a080e7          	jalr	-662(ra) # 80001330 <acquire>
  log.outstanding -= 1;
    800065ce:	00020797          	auipc	a5,0x20
    800065d2:	c6a78793          	addi	a5,a5,-918 # 80026238 <log>
    800065d6:	539c                	lw	a5,32(a5)
    800065d8:	37fd                	addiw	a5,a5,-1
    800065da:	0007871b          	sext.w	a4,a5
    800065de:	00020797          	auipc	a5,0x20
    800065e2:	c5a78793          	addi	a5,a5,-934 # 80026238 <log>
    800065e6:	d398                	sw	a4,32(a5)
  if(log.committing)
    800065e8:	00020797          	auipc	a5,0x20
    800065ec:	c5078793          	addi	a5,a5,-944 # 80026238 <log>
    800065f0:	53dc                	lw	a5,36(a5)
    800065f2:	cb89                	beqz	a5,80006604 <end_op+0x52>
    panic("log.committing");
    800065f4:	00005517          	auipc	a0,0x5
    800065f8:	f6c50513          	addi	a0,a0,-148 # 8000b560 <etext+0x560>
    800065fc:	ffffa097          	auipc	ra,0xffffa
    80006600:	68c080e7          	jalr	1676(ra) # 80000c88 <panic>
  if(log.outstanding == 0){
    80006604:	00020797          	auipc	a5,0x20
    80006608:	c3478793          	addi	a5,a5,-972 # 80026238 <log>
    8000660c:	539c                	lw	a5,32(a5)
    8000660e:	eb99                	bnez	a5,80006624 <end_op+0x72>
    do_commit = 1;
    80006610:	4785                	li	a5,1
    80006612:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    80006616:	00020797          	auipc	a5,0x20
    8000661a:	c2278793          	addi	a5,a5,-990 # 80026238 <log>
    8000661e:	4705                	li	a4,1
    80006620:	d3d8                	sw	a4,36(a5)
    80006622:	a809                	j	80006634 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    80006624:	00020517          	auipc	a0,0x20
    80006628:	c1450513          	addi	a0,a0,-1004 # 80026238 <log>
    8000662c:	ffffd097          	auipc	ra,0xffffd
    80006630:	110080e7          	jalr	272(ra) # 8000373c <wakeup>
  }
  release(&log.lock);
    80006634:	00020517          	auipc	a0,0x20
    80006638:	c0450513          	addi	a0,a0,-1020 # 80026238 <log>
    8000663c:	ffffb097          	auipc	ra,0xffffb
    80006640:	d58080e7          	jalr	-680(ra) # 80001394 <release>

  if(do_commit){
    80006644:	fec42783          	lw	a5,-20(s0)
    80006648:	2781                	sext.w	a5,a5
    8000664a:	c3b9                	beqz	a5,80006690 <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    8000664c:	00000097          	auipc	ra,0x0
    80006650:	134080e7          	jalr	308(ra) # 80006780 <commit>
    acquire(&log.lock);
    80006654:	00020517          	auipc	a0,0x20
    80006658:	be450513          	addi	a0,a0,-1052 # 80026238 <log>
    8000665c:	ffffb097          	auipc	ra,0xffffb
    80006660:	cd4080e7          	jalr	-812(ra) # 80001330 <acquire>
    log.committing = 0;
    80006664:	00020797          	auipc	a5,0x20
    80006668:	bd478793          	addi	a5,a5,-1068 # 80026238 <log>
    8000666c:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    80006670:	00020517          	auipc	a0,0x20
    80006674:	bc850513          	addi	a0,a0,-1080 # 80026238 <log>
    80006678:	ffffd097          	auipc	ra,0xffffd
    8000667c:	0c4080e7          	jalr	196(ra) # 8000373c <wakeup>
    release(&log.lock);
    80006680:	00020517          	auipc	a0,0x20
    80006684:	bb850513          	addi	a0,a0,-1096 # 80026238 <log>
    80006688:	ffffb097          	auipc	ra,0xffffb
    8000668c:	d0c080e7          	jalr	-756(ra) # 80001394 <release>
  }
}
    80006690:	0001                	nop
    80006692:	60e2                	ld	ra,24(sp)
    80006694:	6442                	ld	s0,16(sp)
    80006696:	6105                	addi	sp,sp,32
    80006698:	8082                	ret

000000008000669a <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    8000669a:	7179                	addi	sp,sp,-48
    8000669c:	f406                	sd	ra,40(sp)
    8000669e:	f022                	sd	s0,32(sp)
    800066a0:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800066a2:	fe042623          	sw	zero,-20(s0)
    800066a6:	a86d                	j	80006760 <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    800066a8:	00020797          	auipc	a5,0x20
    800066ac:	b9078793          	addi	a5,a5,-1136 # 80026238 <log>
    800066b0:	579c                	lw	a5,40(a5)
    800066b2:	0007871b          	sext.w	a4,a5
    800066b6:	00020797          	auipc	a5,0x20
    800066ba:	b8278793          	addi	a5,a5,-1150 # 80026238 <log>
    800066be:	4f9c                	lw	a5,24(a5)
    800066c0:	fec42683          	lw	a3,-20(s0)
    800066c4:	9fb5                	addw	a5,a5,a3
    800066c6:	2781                	sext.w	a5,a5
    800066c8:	2785                	addiw	a5,a5,1
    800066ca:	2781                	sext.w	a5,a5
    800066cc:	2781                	sext.w	a5,a5
    800066ce:	85be                	mv	a1,a5
    800066d0:	853a                	mv	a0,a4
    800066d2:	ffffe097          	auipc	ra,0xffffe
    800066d6:	3b2080e7          	jalr	946(ra) # 80004a84 <bread>
    800066da:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    800066de:	00020797          	auipc	a5,0x20
    800066e2:	b5a78793          	addi	a5,a5,-1190 # 80026238 <log>
    800066e6:	579c                	lw	a5,40(a5)
    800066e8:	0007869b          	sext.w	a3,a5
    800066ec:	00020717          	auipc	a4,0x20
    800066f0:	b4c70713          	addi	a4,a4,-1204 # 80026238 <log>
    800066f4:	fec42783          	lw	a5,-20(s0)
    800066f8:	07a1                	addi	a5,a5,8
    800066fa:	078a                	slli	a5,a5,0x2
    800066fc:	97ba                	add	a5,a5,a4
    800066fe:	4b9c                	lw	a5,16(a5)
    80006700:	2781                	sext.w	a5,a5
    80006702:	85be                	mv	a1,a5
    80006704:	8536                	mv	a0,a3
    80006706:	ffffe097          	auipc	ra,0xffffe
    8000670a:	37e080e7          	jalr	894(ra) # 80004a84 <bread>
    8000670e:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    80006712:	fe043783          	ld	a5,-32(s0)
    80006716:	05878713          	addi	a4,a5,88
    8000671a:	fd843783          	ld	a5,-40(s0)
    8000671e:	05878793          	addi	a5,a5,88
    80006722:	40000613          	li	a2,1024
    80006726:	85be                	mv	a1,a5
    80006728:	853a                	mv	a0,a4
    8000672a:	ffffb097          	auipc	ra,0xffffb
    8000672e:	ebe080e7          	jalr	-322(ra) # 800015e8 <memmove>
    bwrite(to);  // write the log
    80006732:	fe043503          	ld	a0,-32(s0)
    80006736:	ffffe097          	auipc	ra,0xffffe
    8000673a:	3aa080e7          	jalr	938(ra) # 80004ae0 <bwrite>
    brelse(from);
    8000673e:	fd843503          	ld	a0,-40(s0)
    80006742:	ffffe097          	auipc	ra,0xffffe
    80006746:	3e8080e7          	jalr	1000(ra) # 80004b2a <brelse>
    brelse(to);
    8000674a:	fe043503          	ld	a0,-32(s0)
    8000674e:	ffffe097          	auipc	ra,0xffffe
    80006752:	3dc080e7          	jalr	988(ra) # 80004b2a <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006756:	fec42783          	lw	a5,-20(s0)
    8000675a:	2785                	addiw	a5,a5,1
    8000675c:	fef42623          	sw	a5,-20(s0)
    80006760:	00020797          	auipc	a5,0x20
    80006764:	ad878793          	addi	a5,a5,-1320 # 80026238 <log>
    80006768:	57d8                	lw	a4,44(a5)
    8000676a:	fec42783          	lw	a5,-20(s0)
    8000676e:	2781                	sext.w	a5,a5
    80006770:	f2e7cce3          	blt	a5,a4,800066a8 <write_log+0xe>
  }
}
    80006774:	0001                	nop
    80006776:	0001                	nop
    80006778:	70a2                	ld	ra,40(sp)
    8000677a:	7402                	ld	s0,32(sp)
    8000677c:	6145                	addi	sp,sp,48
    8000677e:	8082                	ret

0000000080006780 <commit>:

static void
commit()
{
    80006780:	1141                	addi	sp,sp,-16
    80006782:	e406                	sd	ra,8(sp)
    80006784:	e022                	sd	s0,0(sp)
    80006786:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006788:	00020797          	auipc	a5,0x20
    8000678c:	ab078793          	addi	a5,a5,-1360 # 80026238 <log>
    80006790:	57dc                	lw	a5,44(a5)
    80006792:	02f05963          	blez	a5,800067c4 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006796:	00000097          	auipc	ra,0x0
    8000679a:	f04080e7          	jalr	-252(ra) # 8000669a <write_log>
    write_head();    // Write header to disk -- the real commit
    8000679e:	00000097          	auipc	ra,0x0
    800067a2:	c64080e7          	jalr	-924(ra) # 80006402 <write_head>
    install_trans(0); // Now install writes to home locations
    800067a6:	4501                	li	a0,0
    800067a8:	00000097          	auipc	ra,0x0
    800067ac:	ab0080e7          	jalr	-1360(ra) # 80006258 <install_trans>
    log.lh.n = 0;
    800067b0:	00020797          	auipc	a5,0x20
    800067b4:	a8878793          	addi	a5,a5,-1400 # 80026238 <log>
    800067b8:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    800067bc:	00000097          	auipc	ra,0x0
    800067c0:	c46080e7          	jalr	-954(ra) # 80006402 <write_head>
  }
}
    800067c4:	0001                	nop
    800067c6:	60a2                	ld	ra,8(sp)
    800067c8:	6402                	ld	s0,0(sp)
    800067ca:	0141                	addi	sp,sp,16
    800067cc:	8082                	ret

00000000800067ce <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    800067ce:	7179                	addi	sp,sp,-48
    800067d0:	f406                	sd	ra,40(sp)
    800067d2:	f022                	sd	s0,32(sp)
    800067d4:	1800                	addi	s0,sp,48
    800067d6:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    800067da:	00020517          	auipc	a0,0x20
    800067de:	a5e50513          	addi	a0,a0,-1442 # 80026238 <log>
    800067e2:	ffffb097          	auipc	ra,0xffffb
    800067e6:	b4e080e7          	jalr	-1202(ra) # 80001330 <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    800067ea:	00020797          	auipc	a5,0x20
    800067ee:	a4e78793          	addi	a5,a5,-1458 # 80026238 <log>
    800067f2:	57dc                	lw	a5,44(a5)
    800067f4:	873e                	mv	a4,a5
    800067f6:	47f5                	li	a5,29
    800067f8:	02e7c063          	blt	a5,a4,80006818 <log_write+0x4a>
    800067fc:	00020797          	auipc	a5,0x20
    80006800:	a3c78793          	addi	a5,a5,-1476 # 80026238 <log>
    80006804:	57d8                	lw	a4,44(a5)
    80006806:	00020797          	auipc	a5,0x20
    8000680a:	a3278793          	addi	a5,a5,-1486 # 80026238 <log>
    8000680e:	4fdc                	lw	a5,28(a5)
    80006810:	37fd                	addiw	a5,a5,-1
    80006812:	2781                	sext.w	a5,a5
    80006814:	00f74a63          	blt	a4,a5,80006828 <log_write+0x5a>
    panic("too big a transaction");
    80006818:	00005517          	auipc	a0,0x5
    8000681c:	d5850513          	addi	a0,a0,-680 # 8000b570 <etext+0x570>
    80006820:	ffffa097          	auipc	ra,0xffffa
    80006824:	468080e7          	jalr	1128(ra) # 80000c88 <panic>
  if (log.outstanding < 1)
    80006828:	00020797          	auipc	a5,0x20
    8000682c:	a1078793          	addi	a5,a5,-1520 # 80026238 <log>
    80006830:	539c                	lw	a5,32(a5)
    80006832:	00f04a63          	bgtz	a5,80006846 <log_write+0x78>
    panic("log_write outside of trans");
    80006836:	00005517          	auipc	a0,0x5
    8000683a:	d5250513          	addi	a0,a0,-686 # 8000b588 <etext+0x588>
    8000683e:	ffffa097          	auipc	ra,0xffffa
    80006842:	44a080e7          	jalr	1098(ra) # 80000c88 <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006846:	fe042623          	sw	zero,-20(s0)
    8000684a:	a03d                	j	80006878 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    8000684c:	00020717          	auipc	a4,0x20
    80006850:	9ec70713          	addi	a4,a4,-1556 # 80026238 <log>
    80006854:	fec42783          	lw	a5,-20(s0)
    80006858:	07a1                	addi	a5,a5,8
    8000685a:	078a                	slli	a5,a5,0x2
    8000685c:	97ba                	add	a5,a5,a4
    8000685e:	4b9c                	lw	a5,16(a5)
    80006860:	0007871b          	sext.w	a4,a5
    80006864:	fd843783          	ld	a5,-40(s0)
    80006868:	47dc                	lw	a5,12(a5)
    8000686a:	02f70263          	beq	a4,a5,8000688e <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    8000686e:	fec42783          	lw	a5,-20(s0)
    80006872:	2785                	addiw	a5,a5,1
    80006874:	fef42623          	sw	a5,-20(s0)
    80006878:	00020797          	auipc	a5,0x20
    8000687c:	9c078793          	addi	a5,a5,-1600 # 80026238 <log>
    80006880:	57d8                	lw	a4,44(a5)
    80006882:	fec42783          	lw	a5,-20(s0)
    80006886:	2781                	sext.w	a5,a5
    80006888:	fce7c2e3          	blt	a5,a4,8000684c <log_write+0x7e>
    8000688c:	a011                	j	80006890 <log_write+0xc2>
      break;
    8000688e:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    80006890:	fd843783          	ld	a5,-40(s0)
    80006894:	47dc                	lw	a5,12(a5)
    80006896:	0007871b          	sext.w	a4,a5
    8000689a:	00020697          	auipc	a3,0x20
    8000689e:	99e68693          	addi	a3,a3,-1634 # 80026238 <log>
    800068a2:	fec42783          	lw	a5,-20(s0)
    800068a6:	07a1                	addi	a5,a5,8
    800068a8:	078a                	slli	a5,a5,0x2
    800068aa:	97b6                	add	a5,a5,a3
    800068ac:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    800068ae:	00020797          	auipc	a5,0x20
    800068b2:	98a78793          	addi	a5,a5,-1654 # 80026238 <log>
    800068b6:	57d8                	lw	a4,44(a5)
    800068b8:	fec42783          	lw	a5,-20(s0)
    800068bc:	2781                	sext.w	a5,a5
    800068be:	02e79563          	bne	a5,a4,800068e8 <log_write+0x11a>
    bpin(b);
    800068c2:	fd843503          	ld	a0,-40(s0)
    800068c6:	ffffe097          	auipc	ra,0xffffe
    800068ca:	352080e7          	jalr	850(ra) # 80004c18 <bpin>
    log.lh.n++;
    800068ce:	00020797          	auipc	a5,0x20
    800068d2:	96a78793          	addi	a5,a5,-1686 # 80026238 <log>
    800068d6:	57dc                	lw	a5,44(a5)
    800068d8:	2785                	addiw	a5,a5,1
    800068da:	0007871b          	sext.w	a4,a5
    800068de:	00020797          	auipc	a5,0x20
    800068e2:	95a78793          	addi	a5,a5,-1702 # 80026238 <log>
    800068e6:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    800068e8:	00020517          	auipc	a0,0x20
    800068ec:	95050513          	addi	a0,a0,-1712 # 80026238 <log>
    800068f0:	ffffb097          	auipc	ra,0xffffb
    800068f4:	aa4080e7          	jalr	-1372(ra) # 80001394 <release>
}
    800068f8:	0001                	nop
    800068fa:	70a2                	ld	ra,40(sp)
    800068fc:	7402                	ld	s0,32(sp)
    800068fe:	6145                	addi	sp,sp,48
    80006900:	8082                	ret

0000000080006902 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80006902:	1101                	addi	sp,sp,-32
    80006904:	ec06                	sd	ra,24(sp)
    80006906:	e822                	sd	s0,16(sp)
    80006908:	1000                	addi	s0,sp,32
    8000690a:	fea43423          	sd	a0,-24(s0)
    8000690e:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    80006912:	fe843783          	ld	a5,-24(s0)
    80006916:	07a1                	addi	a5,a5,8
    80006918:	00005597          	auipc	a1,0x5
    8000691c:	c9058593          	addi	a1,a1,-880 # 8000b5a8 <etext+0x5a8>
    80006920:	853e                	mv	a0,a5
    80006922:	ffffb097          	auipc	ra,0xffffb
    80006926:	9de080e7          	jalr	-1570(ra) # 80001300 <initlock>
  lk->name = name;
    8000692a:	fe843783          	ld	a5,-24(s0)
    8000692e:	fe043703          	ld	a4,-32(s0)
    80006932:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006934:	fe843783          	ld	a5,-24(s0)
    80006938:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    8000693c:	fe843783          	ld	a5,-24(s0)
    80006940:	0207a423          	sw	zero,40(a5)
}
    80006944:	0001                	nop
    80006946:	60e2                	ld	ra,24(sp)
    80006948:	6442                	ld	s0,16(sp)
    8000694a:	6105                	addi	sp,sp,32
    8000694c:	8082                	ret

000000008000694e <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    8000694e:	1101                	addi	sp,sp,-32
    80006950:	ec06                	sd	ra,24(sp)
    80006952:	e822                	sd	s0,16(sp)
    80006954:	1000                	addi	s0,sp,32
    80006956:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    8000695a:	fe843783          	ld	a5,-24(s0)
    8000695e:	07a1                	addi	a5,a5,8
    80006960:	853e                	mv	a0,a5
    80006962:	ffffb097          	auipc	ra,0xffffb
    80006966:	9ce080e7          	jalr	-1586(ra) # 80001330 <acquire>
  while (lk->locked) {
    8000696a:	a819                	j	80006980 <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    8000696c:	fe843783          	ld	a5,-24(s0)
    80006970:	07a1                	addi	a5,a5,8
    80006972:	85be                	mv	a1,a5
    80006974:	fe843503          	ld	a0,-24(s0)
    80006978:	ffffd097          	auipc	ra,0xffffd
    8000697c:	d48080e7          	jalr	-696(ra) # 800036c0 <sleep>
  while (lk->locked) {
    80006980:	fe843783          	ld	a5,-24(s0)
    80006984:	439c                	lw	a5,0(a5)
    80006986:	f3fd                	bnez	a5,8000696c <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006988:	fe843783          	ld	a5,-24(s0)
    8000698c:	4705                	li	a4,1
    8000698e:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    80006990:	ffffc097          	auipc	ra,0xffffc
    80006994:	16e080e7          	jalr	366(ra) # 80002afe <myproc>
    80006998:	87aa                	mv	a5,a0
    8000699a:	5b98                	lw	a4,48(a5)
    8000699c:	fe843783          	ld	a5,-24(s0)
    800069a0:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    800069a2:	fe843783          	ld	a5,-24(s0)
    800069a6:	07a1                	addi	a5,a5,8
    800069a8:	853e                	mv	a0,a5
    800069aa:	ffffb097          	auipc	ra,0xffffb
    800069ae:	9ea080e7          	jalr	-1558(ra) # 80001394 <release>
}
    800069b2:	0001                	nop
    800069b4:	60e2                	ld	ra,24(sp)
    800069b6:	6442                	ld	s0,16(sp)
    800069b8:	6105                	addi	sp,sp,32
    800069ba:	8082                	ret

00000000800069bc <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    800069bc:	1101                	addi	sp,sp,-32
    800069be:	ec06                	sd	ra,24(sp)
    800069c0:	e822                	sd	s0,16(sp)
    800069c2:	1000                	addi	s0,sp,32
    800069c4:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800069c8:	fe843783          	ld	a5,-24(s0)
    800069cc:	07a1                	addi	a5,a5,8
    800069ce:	853e                	mv	a0,a5
    800069d0:	ffffb097          	auipc	ra,0xffffb
    800069d4:	960080e7          	jalr	-1696(ra) # 80001330 <acquire>
  lk->locked = 0;
    800069d8:	fe843783          	ld	a5,-24(s0)
    800069dc:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800069e0:	fe843783          	ld	a5,-24(s0)
    800069e4:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    800069e8:	fe843503          	ld	a0,-24(s0)
    800069ec:	ffffd097          	auipc	ra,0xffffd
    800069f0:	d50080e7          	jalr	-688(ra) # 8000373c <wakeup>
  release(&lk->lk);
    800069f4:	fe843783          	ld	a5,-24(s0)
    800069f8:	07a1                	addi	a5,a5,8
    800069fa:	853e                	mv	a0,a5
    800069fc:	ffffb097          	auipc	ra,0xffffb
    80006a00:	998080e7          	jalr	-1640(ra) # 80001394 <release>
}
    80006a04:	0001                	nop
    80006a06:	60e2                	ld	ra,24(sp)
    80006a08:	6442                	ld	s0,16(sp)
    80006a0a:	6105                	addi	sp,sp,32
    80006a0c:	8082                	ret

0000000080006a0e <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80006a0e:	7139                	addi	sp,sp,-64
    80006a10:	fc06                	sd	ra,56(sp)
    80006a12:	f822                	sd	s0,48(sp)
    80006a14:	f426                	sd	s1,40(sp)
    80006a16:	0080                	addi	s0,sp,64
    80006a18:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006a1c:	fc843783          	ld	a5,-56(s0)
    80006a20:	07a1                	addi	a5,a5,8
    80006a22:	853e                	mv	a0,a5
    80006a24:	ffffb097          	auipc	ra,0xffffb
    80006a28:	90c080e7          	jalr	-1780(ra) # 80001330 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006a2c:	fc843783          	ld	a5,-56(s0)
    80006a30:	439c                	lw	a5,0(a5)
    80006a32:	cf99                	beqz	a5,80006a50 <holdingsleep+0x42>
    80006a34:	fc843783          	ld	a5,-56(s0)
    80006a38:	5784                	lw	s1,40(a5)
    80006a3a:	ffffc097          	auipc	ra,0xffffc
    80006a3e:	0c4080e7          	jalr	196(ra) # 80002afe <myproc>
    80006a42:	87aa                	mv	a5,a0
    80006a44:	5b9c                	lw	a5,48(a5)
    80006a46:	8726                	mv	a4,s1
    80006a48:	00f71463          	bne	a4,a5,80006a50 <holdingsleep+0x42>
    80006a4c:	4785                	li	a5,1
    80006a4e:	a011                	j	80006a52 <holdingsleep+0x44>
    80006a50:	4781                	li	a5,0
    80006a52:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006a56:	fc843783          	ld	a5,-56(s0)
    80006a5a:	07a1                	addi	a5,a5,8
    80006a5c:	853e                	mv	a0,a5
    80006a5e:	ffffb097          	auipc	ra,0xffffb
    80006a62:	936080e7          	jalr	-1738(ra) # 80001394 <release>
  return r;
    80006a66:	fdc42783          	lw	a5,-36(s0)
}
    80006a6a:	853e                	mv	a0,a5
    80006a6c:	70e2                	ld	ra,56(sp)
    80006a6e:	7442                	ld	s0,48(sp)
    80006a70:	74a2                	ld	s1,40(sp)
    80006a72:	6121                	addi	sp,sp,64
    80006a74:	8082                	ret

0000000080006a76 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006a76:	1141                	addi	sp,sp,-16
    80006a78:	e406                	sd	ra,8(sp)
    80006a7a:	e022                	sd	s0,0(sp)
    80006a7c:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006a7e:	00005597          	auipc	a1,0x5
    80006a82:	b3a58593          	addi	a1,a1,-1222 # 8000b5b8 <etext+0x5b8>
    80006a86:	00020517          	auipc	a0,0x20
    80006a8a:	8fa50513          	addi	a0,a0,-1798 # 80026380 <ftable>
    80006a8e:	ffffb097          	auipc	ra,0xffffb
    80006a92:	872080e7          	jalr	-1934(ra) # 80001300 <initlock>
}
    80006a96:	0001                	nop
    80006a98:	60a2                	ld	ra,8(sp)
    80006a9a:	6402                	ld	s0,0(sp)
    80006a9c:	0141                	addi	sp,sp,16
    80006a9e:	8082                	ret

0000000080006aa0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006aa0:	1101                	addi	sp,sp,-32
    80006aa2:	ec06                	sd	ra,24(sp)
    80006aa4:	e822                	sd	s0,16(sp)
    80006aa6:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006aa8:	00020517          	auipc	a0,0x20
    80006aac:	8d850513          	addi	a0,a0,-1832 # 80026380 <ftable>
    80006ab0:	ffffb097          	auipc	ra,0xffffb
    80006ab4:	880080e7          	jalr	-1920(ra) # 80001330 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006ab8:	00020797          	auipc	a5,0x20
    80006abc:	8e078793          	addi	a5,a5,-1824 # 80026398 <ftable+0x18>
    80006ac0:	fef43423          	sd	a5,-24(s0)
    80006ac4:	a815                	j	80006af8 <filealloc+0x58>
    if(f->ref == 0){
    80006ac6:	fe843783          	ld	a5,-24(s0)
    80006aca:	43dc                	lw	a5,4(a5)
    80006acc:	e385                	bnez	a5,80006aec <filealloc+0x4c>
      f->ref = 1;
    80006ace:	fe843783          	ld	a5,-24(s0)
    80006ad2:	4705                	li	a4,1
    80006ad4:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006ad6:	00020517          	auipc	a0,0x20
    80006ada:	8aa50513          	addi	a0,a0,-1878 # 80026380 <ftable>
    80006ade:	ffffb097          	auipc	ra,0xffffb
    80006ae2:	8b6080e7          	jalr	-1866(ra) # 80001394 <release>
      return f;
    80006ae6:	fe843783          	ld	a5,-24(s0)
    80006aea:	a805                	j	80006b1a <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006aec:	fe843783          	ld	a5,-24(s0)
    80006af0:	02878793          	addi	a5,a5,40
    80006af4:	fef43423          	sd	a5,-24(s0)
    80006af8:	00021797          	auipc	a5,0x21
    80006afc:	84078793          	addi	a5,a5,-1984 # 80027338 <disk>
    80006b00:	fe843703          	ld	a4,-24(s0)
    80006b04:	fcf761e3          	bltu	a4,a5,80006ac6 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006b08:	00020517          	auipc	a0,0x20
    80006b0c:	87850513          	addi	a0,a0,-1928 # 80026380 <ftable>
    80006b10:	ffffb097          	auipc	ra,0xffffb
    80006b14:	884080e7          	jalr	-1916(ra) # 80001394 <release>
  return 0;
    80006b18:	4781                	li	a5,0
}
    80006b1a:	853e                	mv	a0,a5
    80006b1c:	60e2                	ld	ra,24(sp)
    80006b1e:	6442                	ld	s0,16(sp)
    80006b20:	6105                	addi	sp,sp,32
    80006b22:	8082                	ret

0000000080006b24 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006b24:	1101                	addi	sp,sp,-32
    80006b26:	ec06                	sd	ra,24(sp)
    80006b28:	e822                	sd	s0,16(sp)
    80006b2a:	1000                	addi	s0,sp,32
    80006b2c:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80006b30:	00020517          	auipc	a0,0x20
    80006b34:	85050513          	addi	a0,a0,-1968 # 80026380 <ftable>
    80006b38:	ffffa097          	auipc	ra,0xffffa
    80006b3c:	7f8080e7          	jalr	2040(ra) # 80001330 <acquire>
  if(f->ref < 1)
    80006b40:	fe843783          	ld	a5,-24(s0)
    80006b44:	43dc                	lw	a5,4(a5)
    80006b46:	00f04a63          	bgtz	a5,80006b5a <filedup+0x36>
    panic("filedup");
    80006b4a:	00005517          	auipc	a0,0x5
    80006b4e:	a7650513          	addi	a0,a0,-1418 # 8000b5c0 <etext+0x5c0>
    80006b52:	ffffa097          	auipc	ra,0xffffa
    80006b56:	136080e7          	jalr	310(ra) # 80000c88 <panic>
  f->ref++;
    80006b5a:	fe843783          	ld	a5,-24(s0)
    80006b5e:	43dc                	lw	a5,4(a5)
    80006b60:	2785                	addiw	a5,a5,1
    80006b62:	0007871b          	sext.w	a4,a5
    80006b66:	fe843783          	ld	a5,-24(s0)
    80006b6a:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006b6c:	00020517          	auipc	a0,0x20
    80006b70:	81450513          	addi	a0,a0,-2028 # 80026380 <ftable>
    80006b74:	ffffb097          	auipc	ra,0xffffb
    80006b78:	820080e7          	jalr	-2016(ra) # 80001394 <release>
  return f;
    80006b7c:	fe843783          	ld	a5,-24(s0)
}
    80006b80:	853e                	mv	a0,a5
    80006b82:	60e2                	ld	ra,24(sp)
    80006b84:	6442                	ld	s0,16(sp)
    80006b86:	6105                	addi	sp,sp,32
    80006b88:	8082                	ret

0000000080006b8a <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006b8a:	715d                	addi	sp,sp,-80
    80006b8c:	e486                	sd	ra,72(sp)
    80006b8e:	e0a2                	sd	s0,64(sp)
    80006b90:	0880                	addi	s0,sp,80
    80006b92:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006b96:	0001f517          	auipc	a0,0x1f
    80006b9a:	7ea50513          	addi	a0,a0,2026 # 80026380 <ftable>
    80006b9e:	ffffa097          	auipc	ra,0xffffa
    80006ba2:	792080e7          	jalr	1938(ra) # 80001330 <acquire>
  if(f->ref < 1)
    80006ba6:	fb843783          	ld	a5,-72(s0)
    80006baa:	43dc                	lw	a5,4(a5)
    80006bac:	00f04a63          	bgtz	a5,80006bc0 <fileclose+0x36>
    panic("fileclose");
    80006bb0:	00005517          	auipc	a0,0x5
    80006bb4:	a1850513          	addi	a0,a0,-1512 # 8000b5c8 <etext+0x5c8>
    80006bb8:	ffffa097          	auipc	ra,0xffffa
    80006bbc:	0d0080e7          	jalr	208(ra) # 80000c88 <panic>
  if(--f->ref > 0){
    80006bc0:	fb843783          	ld	a5,-72(s0)
    80006bc4:	43dc                	lw	a5,4(a5)
    80006bc6:	37fd                	addiw	a5,a5,-1
    80006bc8:	0007871b          	sext.w	a4,a5
    80006bcc:	fb843783          	ld	a5,-72(s0)
    80006bd0:	c3d8                	sw	a4,4(a5)
    80006bd2:	fb843783          	ld	a5,-72(s0)
    80006bd6:	43dc                	lw	a5,4(a5)
    80006bd8:	00f05b63          	blez	a5,80006bee <fileclose+0x64>
    release(&ftable.lock);
    80006bdc:	0001f517          	auipc	a0,0x1f
    80006be0:	7a450513          	addi	a0,a0,1956 # 80026380 <ftable>
    80006be4:	ffffa097          	auipc	ra,0xffffa
    80006be8:	7b0080e7          	jalr	1968(ra) # 80001394 <release>
    80006bec:	a879                	j	80006c8a <fileclose+0x100>
    return;
  }
  ff = *f;
    80006bee:	fb843783          	ld	a5,-72(s0)
    80006bf2:	638c                	ld	a1,0(a5)
    80006bf4:	6790                	ld	a2,8(a5)
    80006bf6:	6b94                	ld	a3,16(a5)
    80006bf8:	6f98                	ld	a4,24(a5)
    80006bfa:	739c                	ld	a5,32(a5)
    80006bfc:	fcb43423          	sd	a1,-56(s0)
    80006c00:	fcc43823          	sd	a2,-48(s0)
    80006c04:	fcd43c23          	sd	a3,-40(s0)
    80006c08:	fee43023          	sd	a4,-32(s0)
    80006c0c:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006c10:	fb843783          	ld	a5,-72(s0)
    80006c14:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006c18:	fb843783          	ld	a5,-72(s0)
    80006c1c:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006c20:	0001f517          	auipc	a0,0x1f
    80006c24:	76050513          	addi	a0,a0,1888 # 80026380 <ftable>
    80006c28:	ffffa097          	auipc	ra,0xffffa
    80006c2c:	76c080e7          	jalr	1900(ra) # 80001394 <release>

  if(ff.type == FD_PIPE){
    80006c30:	fc842783          	lw	a5,-56(s0)
    80006c34:	873e                	mv	a4,a5
    80006c36:	4785                	li	a5,1
    80006c38:	00f71e63          	bne	a4,a5,80006c54 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006c3c:	fd843783          	ld	a5,-40(s0)
    80006c40:	fd144703          	lbu	a4,-47(s0)
    80006c44:	2701                	sext.w	a4,a4
    80006c46:	85ba                	mv	a1,a4
    80006c48:	853e                	mv	a0,a5
    80006c4a:	00000097          	auipc	ra,0x0
    80006c4e:	5a6080e7          	jalr	1446(ra) # 800071f0 <pipeclose>
    80006c52:	a825                	j	80006c8a <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006c54:	fc842783          	lw	a5,-56(s0)
    80006c58:	873e                	mv	a4,a5
    80006c5a:	4789                	li	a5,2
    80006c5c:	00f70863          	beq	a4,a5,80006c6c <fileclose+0xe2>
    80006c60:	fc842783          	lw	a5,-56(s0)
    80006c64:	873e                	mv	a4,a5
    80006c66:	478d                	li	a5,3
    80006c68:	02f71163          	bne	a4,a5,80006c8a <fileclose+0x100>
    begin_op();
    80006c6c:	00000097          	auipc	ra,0x0
    80006c70:	884080e7          	jalr	-1916(ra) # 800064f0 <begin_op>
    iput(ff.ip);
    80006c74:	fe043783          	ld	a5,-32(s0)
    80006c78:	853e                	mv	a0,a5
    80006c7a:	fffff097          	auipc	ra,0xfffff
    80006c7e:	970080e7          	jalr	-1680(ra) # 800055ea <iput>
    end_op();
    80006c82:	00000097          	auipc	ra,0x0
    80006c86:	930080e7          	jalr	-1744(ra) # 800065b2 <end_op>
  }
}
    80006c8a:	60a6                	ld	ra,72(sp)
    80006c8c:	6406                	ld	s0,64(sp)
    80006c8e:	6161                	addi	sp,sp,80
    80006c90:	8082                	ret

0000000080006c92 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006c92:	7139                	addi	sp,sp,-64
    80006c94:	fc06                	sd	ra,56(sp)
    80006c96:	f822                	sd	s0,48(sp)
    80006c98:	0080                	addi	s0,sp,64
    80006c9a:	fca43423          	sd	a0,-56(s0)
    80006c9e:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006ca2:	ffffc097          	auipc	ra,0xffffc
    80006ca6:	e5c080e7          	jalr	-420(ra) # 80002afe <myproc>
    80006caa:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006cae:	fc843783          	ld	a5,-56(s0)
    80006cb2:	439c                	lw	a5,0(a5)
    80006cb4:	873e                	mv	a4,a5
    80006cb6:	4789                	li	a5,2
    80006cb8:	00f70963          	beq	a4,a5,80006cca <filestat+0x38>
    80006cbc:	fc843783          	ld	a5,-56(s0)
    80006cc0:	439c                	lw	a5,0(a5)
    80006cc2:	873e                	mv	a4,a5
    80006cc4:	478d                	li	a5,3
    80006cc6:	06f71263          	bne	a4,a5,80006d2a <filestat+0x98>
    ilock(f->ip);
    80006cca:	fc843783          	ld	a5,-56(s0)
    80006cce:	6f9c                	ld	a5,24(a5)
    80006cd0:	853e                	mv	a0,a5
    80006cd2:	ffffe097          	auipc	ra,0xffffe
    80006cd6:	78a080e7          	jalr	1930(ra) # 8000545c <ilock>
    stati(f->ip, &st);
    80006cda:	fc843783          	ld	a5,-56(s0)
    80006cde:	6f9c                	ld	a5,24(a5)
    80006ce0:	fd040713          	addi	a4,s0,-48
    80006ce4:	85ba                	mv	a1,a4
    80006ce6:	853e                	mv	a0,a5
    80006ce8:	fffff097          	auipc	ra,0xfffff
    80006cec:	cc6080e7          	jalr	-826(ra) # 800059ae <stati>
    iunlock(f->ip);
    80006cf0:	fc843783          	ld	a5,-56(s0)
    80006cf4:	6f9c                	ld	a5,24(a5)
    80006cf6:	853e                	mv	a0,a5
    80006cf8:	fffff097          	auipc	ra,0xfffff
    80006cfc:	898080e7          	jalr	-1896(ra) # 80005590 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006d00:	fe843783          	ld	a5,-24(s0)
    80006d04:	6bbc                	ld	a5,80(a5)
    80006d06:	fd040713          	addi	a4,s0,-48
    80006d0a:	46e1                	li	a3,24
    80006d0c:	863a                	mv	a2,a4
    80006d0e:	fc043583          	ld	a1,-64(s0)
    80006d12:	853e                	mv	a0,a5
    80006d14:	ffffc097          	auipc	ra,0xffffc
    80006d18:	8b4080e7          	jalr	-1868(ra) # 800025c8 <copyout>
    80006d1c:	87aa                	mv	a5,a0
    80006d1e:	0007d463          	bgez	a5,80006d26 <filestat+0x94>
      return -1;
    80006d22:	57fd                	li	a5,-1
    80006d24:	a021                	j	80006d2c <filestat+0x9a>
    return 0;
    80006d26:	4781                	li	a5,0
    80006d28:	a011                	j	80006d2c <filestat+0x9a>
  }
  return -1;
    80006d2a:	57fd                	li	a5,-1
}
    80006d2c:	853e                	mv	a0,a5
    80006d2e:	70e2                	ld	ra,56(sp)
    80006d30:	7442                	ld	s0,48(sp)
    80006d32:	6121                	addi	sp,sp,64
    80006d34:	8082                	ret

0000000080006d36 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006d36:	7139                	addi	sp,sp,-64
    80006d38:	fc06                	sd	ra,56(sp)
    80006d3a:	f822                	sd	s0,48(sp)
    80006d3c:	0080                	addi	s0,sp,64
    80006d3e:	fca43c23          	sd	a0,-40(s0)
    80006d42:	fcb43823          	sd	a1,-48(s0)
    80006d46:	87b2                	mv	a5,a2
    80006d48:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006d4c:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006d50:	fd843783          	ld	a5,-40(s0)
    80006d54:	0087c783          	lbu	a5,8(a5)
    80006d58:	e399                	bnez	a5,80006d5e <fileread+0x28>
    return -1;
    80006d5a:	57fd                	li	a5,-1
    80006d5c:	a23d                	j	80006e8a <fileread+0x154>

  if(f->type == FD_PIPE){
    80006d5e:	fd843783          	ld	a5,-40(s0)
    80006d62:	439c                	lw	a5,0(a5)
    80006d64:	873e                	mv	a4,a5
    80006d66:	4785                	li	a5,1
    80006d68:	02f71363          	bne	a4,a5,80006d8e <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006d6c:	fd843783          	ld	a5,-40(s0)
    80006d70:	6b9c                	ld	a5,16(a5)
    80006d72:	fcc42703          	lw	a4,-52(s0)
    80006d76:	863a                	mv	a2,a4
    80006d78:	fd043583          	ld	a1,-48(s0)
    80006d7c:	853e                	mv	a0,a5
    80006d7e:	00000097          	auipc	ra,0x0
    80006d82:	66e080e7          	jalr	1646(ra) # 800073ec <piperead>
    80006d86:	87aa                	mv	a5,a0
    80006d88:	fef42623          	sw	a5,-20(s0)
    80006d8c:	a8ed                	j	80006e86 <fileread+0x150>
  } else if(f->type == FD_DEVICE){
    80006d8e:	fd843783          	ld	a5,-40(s0)
    80006d92:	439c                	lw	a5,0(a5)
    80006d94:	873e                	mv	a4,a5
    80006d96:	478d                	li	a5,3
    80006d98:	06f71463          	bne	a4,a5,80006e00 <fileread+0xca>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006d9c:	fd843783          	ld	a5,-40(s0)
    80006da0:	02479783          	lh	a5,36(a5)
    80006da4:	0207c663          	bltz	a5,80006dd0 <fileread+0x9a>
    80006da8:	fd843783          	ld	a5,-40(s0)
    80006dac:	02479783          	lh	a5,36(a5)
    80006db0:	873e                	mv	a4,a5
    80006db2:	47a5                	li	a5,9
    80006db4:	00e7ce63          	blt	a5,a4,80006dd0 <fileread+0x9a>
    80006db8:	fd843783          	ld	a5,-40(s0)
    80006dbc:	02479783          	lh	a5,36(a5)
    80006dc0:	0001f717          	auipc	a4,0x1f
    80006dc4:	52070713          	addi	a4,a4,1312 # 800262e0 <devsw>
    80006dc8:	0792                	slli	a5,a5,0x4
    80006dca:	97ba                	add	a5,a5,a4
    80006dcc:	639c                	ld	a5,0(a5)
    80006dce:	e399                	bnez	a5,80006dd4 <fileread+0x9e>
      return -1;
    80006dd0:	57fd                	li	a5,-1
    80006dd2:	a865                	j	80006e8a <fileread+0x154>
    r = devsw[f->major].read(1, addr, n);
    80006dd4:	fd843783          	ld	a5,-40(s0)
    80006dd8:	02479783          	lh	a5,36(a5)
    80006ddc:	0001f717          	auipc	a4,0x1f
    80006de0:	50470713          	addi	a4,a4,1284 # 800262e0 <devsw>
    80006de4:	0792                	slli	a5,a5,0x4
    80006de6:	97ba                	add	a5,a5,a4
    80006de8:	639c                	ld	a5,0(a5)
    80006dea:	fcc42703          	lw	a4,-52(s0)
    80006dee:	863a                	mv	a2,a4
    80006df0:	fd043583          	ld	a1,-48(s0)
    80006df4:	4505                	li	a0,1
    80006df6:	9782                	jalr	a5
    80006df8:	87aa                	mv	a5,a0
    80006dfa:	fef42623          	sw	a5,-20(s0)
    80006dfe:	a061                	j	80006e86 <fileread+0x150>
  } else if(f->type == FD_INODE){
    80006e00:	fd843783          	ld	a5,-40(s0)
    80006e04:	439c                	lw	a5,0(a5)
    80006e06:	873e                	mv	a4,a5
    80006e08:	4789                	li	a5,2
    80006e0a:	06f71663          	bne	a4,a5,80006e76 <fileread+0x140>
    ilock(f->ip);
    80006e0e:	fd843783          	ld	a5,-40(s0)
    80006e12:	6f9c                	ld	a5,24(a5)
    80006e14:	853e                	mv	a0,a5
    80006e16:	ffffe097          	auipc	ra,0xffffe
    80006e1a:	646080e7          	jalr	1606(ra) # 8000545c <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006e1e:	fd843783          	ld	a5,-40(s0)
    80006e22:	6f88                	ld	a0,24(a5)
    80006e24:	fd843783          	ld	a5,-40(s0)
    80006e28:	539c                	lw	a5,32(a5)
    80006e2a:	fcc42703          	lw	a4,-52(s0)
    80006e2e:	86be                	mv	a3,a5
    80006e30:	fd043603          	ld	a2,-48(s0)
    80006e34:	4585                	li	a1,1
    80006e36:	fffff097          	auipc	ra,0xfffff
    80006e3a:	bdc080e7          	jalr	-1060(ra) # 80005a12 <readi>
    80006e3e:	87aa                	mv	a5,a0
    80006e40:	fef42623          	sw	a5,-20(s0)
    80006e44:	fec42783          	lw	a5,-20(s0)
    80006e48:	2781                	sext.w	a5,a5
    80006e4a:	00f05d63          	blez	a5,80006e64 <fileread+0x12e>
      f->off += r;
    80006e4e:	fd843783          	ld	a5,-40(s0)
    80006e52:	5398                	lw	a4,32(a5)
    80006e54:	fec42783          	lw	a5,-20(s0)
    80006e58:	9fb9                	addw	a5,a5,a4
    80006e5a:	0007871b          	sext.w	a4,a5
    80006e5e:	fd843783          	ld	a5,-40(s0)
    80006e62:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006e64:	fd843783          	ld	a5,-40(s0)
    80006e68:	6f9c                	ld	a5,24(a5)
    80006e6a:	853e                	mv	a0,a5
    80006e6c:	ffffe097          	auipc	ra,0xffffe
    80006e70:	724080e7          	jalr	1828(ra) # 80005590 <iunlock>
    80006e74:	a809                	j	80006e86 <fileread+0x150>
  } else {
    panic("fileread");
    80006e76:	00004517          	auipc	a0,0x4
    80006e7a:	76250513          	addi	a0,a0,1890 # 8000b5d8 <etext+0x5d8>
    80006e7e:	ffffa097          	auipc	ra,0xffffa
    80006e82:	e0a080e7          	jalr	-502(ra) # 80000c88 <panic>
  }

  return r;
    80006e86:	fec42783          	lw	a5,-20(s0)
}
    80006e8a:	853e                	mv	a0,a5
    80006e8c:	70e2                	ld	ra,56(sp)
    80006e8e:	7442                	ld	s0,48(sp)
    80006e90:	6121                	addi	sp,sp,64
    80006e92:	8082                	ret

0000000080006e94 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006e94:	715d                	addi	sp,sp,-80
    80006e96:	e486                	sd	ra,72(sp)
    80006e98:	e0a2                	sd	s0,64(sp)
    80006e9a:	0880                	addi	s0,sp,80
    80006e9c:	fca43423          	sd	a0,-56(s0)
    80006ea0:	fcb43023          	sd	a1,-64(s0)
    80006ea4:	87b2                	mv	a5,a2
    80006ea6:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006eaa:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006eae:	fc843783          	ld	a5,-56(s0)
    80006eb2:	0097c783          	lbu	a5,9(a5)
    80006eb6:	e399                	bnez	a5,80006ebc <filewrite+0x28>
    return -1;
    80006eb8:	57fd                	li	a5,-1
    80006eba:	aae1                	j	80007092 <filewrite+0x1fe>

  if(f->type == FD_PIPE){
    80006ebc:	fc843783          	ld	a5,-56(s0)
    80006ec0:	439c                	lw	a5,0(a5)
    80006ec2:	873e                	mv	a4,a5
    80006ec4:	4785                	li	a5,1
    80006ec6:	02f71363          	bne	a4,a5,80006eec <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006eca:	fc843783          	ld	a5,-56(s0)
    80006ece:	6b9c                	ld	a5,16(a5)
    80006ed0:	fbc42703          	lw	a4,-68(s0)
    80006ed4:	863a                	mv	a2,a4
    80006ed6:	fc043583          	ld	a1,-64(s0)
    80006eda:	853e                	mv	a0,a5
    80006edc:	00000097          	auipc	ra,0x0
    80006ee0:	3bc080e7          	jalr	956(ra) # 80007298 <pipewrite>
    80006ee4:	87aa                	mv	a5,a0
    80006ee6:	fef42623          	sw	a5,-20(s0)
    80006eea:	a255                	j	8000708e <filewrite+0x1fa>
  } else if(f->type == FD_DEVICE){
    80006eec:	fc843783          	ld	a5,-56(s0)
    80006ef0:	439c                	lw	a5,0(a5)
    80006ef2:	873e                	mv	a4,a5
    80006ef4:	478d                	li	a5,3
    80006ef6:	06f71463          	bne	a4,a5,80006f5e <filewrite+0xca>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006efa:	fc843783          	ld	a5,-56(s0)
    80006efe:	02479783          	lh	a5,36(a5)
    80006f02:	0207c663          	bltz	a5,80006f2e <filewrite+0x9a>
    80006f06:	fc843783          	ld	a5,-56(s0)
    80006f0a:	02479783          	lh	a5,36(a5)
    80006f0e:	873e                	mv	a4,a5
    80006f10:	47a5                	li	a5,9
    80006f12:	00e7ce63          	blt	a5,a4,80006f2e <filewrite+0x9a>
    80006f16:	fc843783          	ld	a5,-56(s0)
    80006f1a:	02479783          	lh	a5,36(a5)
    80006f1e:	0001f717          	auipc	a4,0x1f
    80006f22:	3c270713          	addi	a4,a4,962 # 800262e0 <devsw>
    80006f26:	0792                	slli	a5,a5,0x4
    80006f28:	97ba                	add	a5,a5,a4
    80006f2a:	679c                	ld	a5,8(a5)
    80006f2c:	e399                	bnez	a5,80006f32 <filewrite+0x9e>
      return -1;
    80006f2e:	57fd                	li	a5,-1
    80006f30:	a28d                	j	80007092 <filewrite+0x1fe>
    ret = devsw[f->major].write(1, addr, n);
    80006f32:	fc843783          	ld	a5,-56(s0)
    80006f36:	02479783          	lh	a5,36(a5)
    80006f3a:	0001f717          	auipc	a4,0x1f
    80006f3e:	3a670713          	addi	a4,a4,934 # 800262e0 <devsw>
    80006f42:	0792                	slli	a5,a5,0x4
    80006f44:	97ba                	add	a5,a5,a4
    80006f46:	679c                	ld	a5,8(a5)
    80006f48:	fbc42703          	lw	a4,-68(s0)
    80006f4c:	863a                	mv	a2,a4
    80006f4e:	fc043583          	ld	a1,-64(s0)
    80006f52:	4505                	li	a0,1
    80006f54:	9782                	jalr	a5
    80006f56:	87aa                	mv	a5,a0
    80006f58:	fef42623          	sw	a5,-20(s0)
    80006f5c:	aa0d                	j	8000708e <filewrite+0x1fa>
  } else if(f->type == FD_INODE){
    80006f5e:	fc843783          	ld	a5,-56(s0)
    80006f62:	439c                	lw	a5,0(a5)
    80006f64:	873e                	mv	a4,a5
    80006f66:	4789                	li	a5,2
    80006f68:	10f71b63          	bne	a4,a5,8000707e <filewrite+0x1ea>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006f6c:	6785                	lui	a5,0x1
    80006f6e:	c0078793          	addi	a5,a5,-1024 # c00 <_entry-0x7ffff400>
    80006f72:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006f76:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006f7a:	a0f9                	j	80007048 <filewrite+0x1b4>
      int n1 = n - i;
    80006f7c:	fbc42783          	lw	a5,-68(s0)
    80006f80:	873e                	mv	a4,a5
    80006f82:	fe842783          	lw	a5,-24(s0)
    80006f86:	40f707bb          	subw	a5,a4,a5
    80006f8a:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006f8e:	fe442783          	lw	a5,-28(s0)
    80006f92:	873e                	mv	a4,a5
    80006f94:	fe042783          	lw	a5,-32(s0)
    80006f98:	2701                	sext.w	a4,a4
    80006f9a:	2781                	sext.w	a5,a5
    80006f9c:	00e7d663          	bge	a5,a4,80006fa8 <filewrite+0x114>
        n1 = max;
    80006fa0:	fe042783          	lw	a5,-32(s0)
    80006fa4:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006fa8:	fffff097          	auipc	ra,0xfffff
    80006fac:	548080e7          	jalr	1352(ra) # 800064f0 <begin_op>
      ilock(f->ip);
    80006fb0:	fc843783          	ld	a5,-56(s0)
    80006fb4:	6f9c                	ld	a5,24(a5)
    80006fb6:	853e                	mv	a0,a5
    80006fb8:	ffffe097          	auipc	ra,0xffffe
    80006fbc:	4a4080e7          	jalr	1188(ra) # 8000545c <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006fc0:	fc843783          	ld	a5,-56(s0)
    80006fc4:	6f88                	ld	a0,24(a5)
    80006fc6:	fe842703          	lw	a4,-24(s0)
    80006fca:	fc043783          	ld	a5,-64(s0)
    80006fce:	00f70633          	add	a2,a4,a5
    80006fd2:	fc843783          	ld	a5,-56(s0)
    80006fd6:	539c                	lw	a5,32(a5)
    80006fd8:	fe442703          	lw	a4,-28(s0)
    80006fdc:	86be                	mv	a3,a5
    80006fde:	4585                	li	a1,1
    80006fe0:	fffff097          	auipc	ra,0xfffff
    80006fe4:	bd0080e7          	jalr	-1072(ra) # 80005bb0 <writei>
    80006fe8:	87aa                	mv	a5,a0
    80006fea:	fcf42e23          	sw	a5,-36(s0)
    80006fee:	fdc42783          	lw	a5,-36(s0)
    80006ff2:	2781                	sext.w	a5,a5
    80006ff4:	00f05d63          	blez	a5,8000700e <filewrite+0x17a>
        f->off += r;
    80006ff8:	fc843783          	ld	a5,-56(s0)
    80006ffc:	5398                	lw	a4,32(a5)
    80006ffe:	fdc42783          	lw	a5,-36(s0)
    80007002:	9fb9                	addw	a5,a5,a4
    80007004:	0007871b          	sext.w	a4,a5
    80007008:	fc843783          	ld	a5,-56(s0)
    8000700c:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    8000700e:	fc843783          	ld	a5,-56(s0)
    80007012:	6f9c                	ld	a5,24(a5)
    80007014:	853e                	mv	a0,a5
    80007016:	ffffe097          	auipc	ra,0xffffe
    8000701a:	57a080e7          	jalr	1402(ra) # 80005590 <iunlock>
      end_op();
    8000701e:	fffff097          	auipc	ra,0xfffff
    80007022:	594080e7          	jalr	1428(ra) # 800065b2 <end_op>

      if(r != n1){
    80007026:	fdc42783          	lw	a5,-36(s0)
    8000702a:	873e                	mv	a4,a5
    8000702c:	fe442783          	lw	a5,-28(s0)
    80007030:	2701                	sext.w	a4,a4
    80007032:	2781                	sext.w	a5,a5
    80007034:	02f71463          	bne	a4,a5,8000705c <filewrite+0x1c8>
        // error from writei
        break;
      }
      i += r;
    80007038:	fe842783          	lw	a5,-24(s0)
    8000703c:	873e                	mv	a4,a5
    8000703e:	fdc42783          	lw	a5,-36(s0)
    80007042:	9fb9                	addw	a5,a5,a4
    80007044:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80007048:	fe842783          	lw	a5,-24(s0)
    8000704c:	873e                	mv	a4,a5
    8000704e:	fbc42783          	lw	a5,-68(s0)
    80007052:	2701                	sext.w	a4,a4
    80007054:	2781                	sext.w	a5,a5
    80007056:	f2f743e3          	blt	a4,a5,80006f7c <filewrite+0xe8>
    8000705a:	a011                	j	8000705e <filewrite+0x1ca>
        break;
    8000705c:	0001                	nop
    }
    ret = (i == n ? n : -1);
    8000705e:	fe842783          	lw	a5,-24(s0)
    80007062:	873e                	mv	a4,a5
    80007064:	fbc42783          	lw	a5,-68(s0)
    80007068:	2701                	sext.w	a4,a4
    8000706a:	2781                	sext.w	a5,a5
    8000706c:	00f71563          	bne	a4,a5,80007076 <filewrite+0x1e2>
    80007070:	fbc42783          	lw	a5,-68(s0)
    80007074:	a011                	j	80007078 <filewrite+0x1e4>
    80007076:	57fd                	li	a5,-1
    80007078:	fef42623          	sw	a5,-20(s0)
    8000707c:	a809                	j	8000708e <filewrite+0x1fa>
  } else {
    panic("filewrite");
    8000707e:	00004517          	auipc	a0,0x4
    80007082:	56a50513          	addi	a0,a0,1386 # 8000b5e8 <etext+0x5e8>
    80007086:	ffffa097          	auipc	ra,0xffffa
    8000708a:	c02080e7          	jalr	-1022(ra) # 80000c88 <panic>
  }

  return ret;
    8000708e:	fec42783          	lw	a5,-20(s0)
}
    80007092:	853e                	mv	a0,a5
    80007094:	60a6                	ld	ra,72(sp)
    80007096:	6406                	ld	s0,64(sp)
    80007098:	6161                	addi	sp,sp,80
    8000709a:	8082                	ret

000000008000709c <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    8000709c:	7179                	addi	sp,sp,-48
    8000709e:	f406                	sd	ra,40(sp)
    800070a0:	f022                	sd	s0,32(sp)
    800070a2:	1800                	addi	s0,sp,48
    800070a4:	fca43c23          	sd	a0,-40(s0)
    800070a8:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    800070ac:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    800070b0:	fd043783          	ld	a5,-48(s0)
    800070b4:	0007b023          	sd	zero,0(a5)
    800070b8:	fd043783          	ld	a5,-48(s0)
    800070bc:	6398                	ld	a4,0(a5)
    800070be:	fd843783          	ld	a5,-40(s0)
    800070c2:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    800070c4:	00000097          	auipc	ra,0x0
    800070c8:	9dc080e7          	jalr	-1572(ra) # 80006aa0 <filealloc>
    800070cc:	872a                	mv	a4,a0
    800070ce:	fd843783          	ld	a5,-40(s0)
    800070d2:	e398                	sd	a4,0(a5)
    800070d4:	fd843783          	ld	a5,-40(s0)
    800070d8:	639c                	ld	a5,0(a5)
    800070da:	c3e9                	beqz	a5,8000719c <pipealloc+0x100>
    800070dc:	00000097          	auipc	ra,0x0
    800070e0:	9c4080e7          	jalr	-1596(ra) # 80006aa0 <filealloc>
    800070e4:	872a                	mv	a4,a0
    800070e6:	fd043783          	ld	a5,-48(s0)
    800070ea:	e398                	sd	a4,0(a5)
    800070ec:	fd043783          	ld	a5,-48(s0)
    800070f0:	639c                	ld	a5,0(a5)
    800070f2:	c7cd                	beqz	a5,8000719c <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    800070f4:	ffffa097          	auipc	ra,0xffffa
    800070f8:	0e8080e7          	jalr	232(ra) # 800011dc <kalloc>
    800070fc:	fea43423          	sd	a0,-24(s0)
    80007100:	fe843783          	ld	a5,-24(s0)
    80007104:	cfd1                	beqz	a5,800071a0 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80007106:	fe843783          	ld	a5,-24(s0)
    8000710a:	4705                	li	a4,1
    8000710c:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80007110:	fe843783          	ld	a5,-24(s0)
    80007114:	4705                	li	a4,1
    80007116:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    8000711a:	fe843783          	ld	a5,-24(s0)
    8000711e:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80007122:	fe843783          	ld	a5,-24(s0)
    80007126:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    8000712a:	fe843783          	ld	a5,-24(s0)
    8000712e:	00004597          	auipc	a1,0x4
    80007132:	4ca58593          	addi	a1,a1,1226 # 8000b5f8 <etext+0x5f8>
    80007136:	853e                	mv	a0,a5
    80007138:	ffffa097          	auipc	ra,0xffffa
    8000713c:	1c8080e7          	jalr	456(ra) # 80001300 <initlock>
  (*f0)->type = FD_PIPE;
    80007140:	fd843783          	ld	a5,-40(s0)
    80007144:	639c                	ld	a5,0(a5)
    80007146:	4705                	li	a4,1
    80007148:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    8000714a:	fd843783          	ld	a5,-40(s0)
    8000714e:	639c                	ld	a5,0(a5)
    80007150:	4705                	li	a4,1
    80007152:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80007156:	fd843783          	ld	a5,-40(s0)
    8000715a:	639c                	ld	a5,0(a5)
    8000715c:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80007160:	fd843783          	ld	a5,-40(s0)
    80007164:	639c                	ld	a5,0(a5)
    80007166:	fe843703          	ld	a4,-24(s0)
    8000716a:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    8000716c:	fd043783          	ld	a5,-48(s0)
    80007170:	639c                	ld	a5,0(a5)
    80007172:	4705                	li	a4,1
    80007174:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80007176:	fd043783          	ld	a5,-48(s0)
    8000717a:	639c                	ld	a5,0(a5)
    8000717c:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80007180:	fd043783          	ld	a5,-48(s0)
    80007184:	639c                	ld	a5,0(a5)
    80007186:	4705                	li	a4,1
    80007188:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    8000718c:	fd043783          	ld	a5,-48(s0)
    80007190:	639c                	ld	a5,0(a5)
    80007192:	fe843703          	ld	a4,-24(s0)
    80007196:	eb98                	sd	a4,16(a5)
  return 0;
    80007198:	4781                	li	a5,0
    8000719a:	a0b1                	j	800071e6 <pipealloc+0x14a>
    goto bad;
    8000719c:	0001                	nop
    8000719e:	a011                	j	800071a2 <pipealloc+0x106>
    goto bad;
    800071a0:	0001                	nop

 bad:
  if(pi)
    800071a2:	fe843783          	ld	a5,-24(s0)
    800071a6:	c799                	beqz	a5,800071b4 <pipealloc+0x118>
    kfree((char*)pi);
    800071a8:	fe843503          	ld	a0,-24(s0)
    800071ac:	ffffa097          	auipc	ra,0xffffa
    800071b0:	f8a080e7          	jalr	-118(ra) # 80001136 <kfree>
  if(*f0)
    800071b4:	fd843783          	ld	a5,-40(s0)
    800071b8:	639c                	ld	a5,0(a5)
    800071ba:	cb89                	beqz	a5,800071cc <pipealloc+0x130>
    fileclose(*f0);
    800071bc:	fd843783          	ld	a5,-40(s0)
    800071c0:	639c                	ld	a5,0(a5)
    800071c2:	853e                	mv	a0,a5
    800071c4:	00000097          	auipc	ra,0x0
    800071c8:	9c6080e7          	jalr	-1594(ra) # 80006b8a <fileclose>
  if(*f1)
    800071cc:	fd043783          	ld	a5,-48(s0)
    800071d0:	639c                	ld	a5,0(a5)
    800071d2:	cb89                	beqz	a5,800071e4 <pipealloc+0x148>
    fileclose(*f1);
    800071d4:	fd043783          	ld	a5,-48(s0)
    800071d8:	639c                	ld	a5,0(a5)
    800071da:	853e                	mv	a0,a5
    800071dc:	00000097          	auipc	ra,0x0
    800071e0:	9ae080e7          	jalr	-1618(ra) # 80006b8a <fileclose>
  return -1;
    800071e4:	57fd                	li	a5,-1
}
    800071e6:	853e                	mv	a0,a5
    800071e8:	70a2                	ld	ra,40(sp)
    800071ea:	7402                	ld	s0,32(sp)
    800071ec:	6145                	addi	sp,sp,48
    800071ee:	8082                	ret

00000000800071f0 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    800071f0:	1101                	addi	sp,sp,-32
    800071f2:	ec06                	sd	ra,24(sp)
    800071f4:	e822                	sd	s0,16(sp)
    800071f6:	1000                	addi	s0,sp,32
    800071f8:	fea43423          	sd	a0,-24(s0)
    800071fc:	87ae                	mv	a5,a1
    800071fe:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80007202:	fe843783          	ld	a5,-24(s0)
    80007206:	853e                	mv	a0,a5
    80007208:	ffffa097          	auipc	ra,0xffffa
    8000720c:	128080e7          	jalr	296(ra) # 80001330 <acquire>
  if(writable){
    80007210:	fe442783          	lw	a5,-28(s0)
    80007214:	2781                	sext.w	a5,a5
    80007216:	cf99                	beqz	a5,80007234 <pipeclose+0x44>
    pi->writeopen = 0;
    80007218:	fe843783          	ld	a5,-24(s0)
    8000721c:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    80007220:	fe843783          	ld	a5,-24(s0)
    80007224:	21878793          	addi	a5,a5,536
    80007228:	853e                	mv	a0,a5
    8000722a:	ffffc097          	auipc	ra,0xffffc
    8000722e:	512080e7          	jalr	1298(ra) # 8000373c <wakeup>
    80007232:	a831                	j	8000724e <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80007234:	fe843783          	ld	a5,-24(s0)
    80007238:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    8000723c:	fe843783          	ld	a5,-24(s0)
    80007240:	21c78793          	addi	a5,a5,540
    80007244:	853e                	mv	a0,a5
    80007246:	ffffc097          	auipc	ra,0xffffc
    8000724a:	4f6080e7          	jalr	1270(ra) # 8000373c <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    8000724e:	fe843783          	ld	a5,-24(s0)
    80007252:	2207a783          	lw	a5,544(a5)
    80007256:	e785                	bnez	a5,8000727e <pipeclose+0x8e>
    80007258:	fe843783          	ld	a5,-24(s0)
    8000725c:	2247a783          	lw	a5,548(a5)
    80007260:	ef99                	bnez	a5,8000727e <pipeclose+0x8e>
    release(&pi->lock);
    80007262:	fe843783          	ld	a5,-24(s0)
    80007266:	853e                	mv	a0,a5
    80007268:	ffffa097          	auipc	ra,0xffffa
    8000726c:	12c080e7          	jalr	300(ra) # 80001394 <release>
    kfree((char*)pi);
    80007270:	fe843503          	ld	a0,-24(s0)
    80007274:	ffffa097          	auipc	ra,0xffffa
    80007278:	ec2080e7          	jalr	-318(ra) # 80001136 <kfree>
    8000727c:	a809                	j	8000728e <pipeclose+0x9e>
  } else
    release(&pi->lock);
    8000727e:	fe843783          	ld	a5,-24(s0)
    80007282:	853e                	mv	a0,a5
    80007284:	ffffa097          	auipc	ra,0xffffa
    80007288:	110080e7          	jalr	272(ra) # 80001394 <release>
}
    8000728c:	0001                	nop
    8000728e:	0001                	nop
    80007290:	60e2                	ld	ra,24(sp)
    80007292:	6442                	ld	s0,16(sp)
    80007294:	6105                	addi	sp,sp,32
    80007296:	8082                	ret

0000000080007298 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80007298:	715d                	addi	sp,sp,-80
    8000729a:	e486                	sd	ra,72(sp)
    8000729c:	e0a2                	sd	s0,64(sp)
    8000729e:	0880                	addi	s0,sp,80
    800072a0:	fca43423          	sd	a0,-56(s0)
    800072a4:	fcb43023          	sd	a1,-64(s0)
    800072a8:	87b2                	mv	a5,a2
    800072aa:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    800072ae:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    800072b2:	ffffc097          	auipc	ra,0xffffc
    800072b6:	84c080e7          	jalr	-1972(ra) # 80002afe <myproc>
    800072ba:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    800072be:	fc843783          	ld	a5,-56(s0)
    800072c2:	853e                	mv	a0,a5
    800072c4:	ffffa097          	auipc	ra,0xffffa
    800072c8:	06c080e7          	jalr	108(ra) # 80001330 <acquire>
  while(i < n){
    800072cc:	a8f1                	j	800073a8 <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    800072ce:	fc843783          	ld	a5,-56(s0)
    800072d2:	2207a783          	lw	a5,544(a5)
    800072d6:	cb89                	beqz	a5,800072e8 <pipewrite+0x50>
    800072d8:	fe043503          	ld	a0,-32(s0)
    800072dc:	ffffc097          	auipc	ra,0xffffc
    800072e0:	5f2080e7          	jalr	1522(ra) # 800038ce <killed>
    800072e4:	87aa                	mv	a5,a0
    800072e6:	cb91                	beqz	a5,800072fa <pipewrite+0x62>
      release(&pi->lock);
    800072e8:	fc843783          	ld	a5,-56(s0)
    800072ec:	853e                	mv	a0,a5
    800072ee:	ffffa097          	auipc	ra,0xffffa
    800072f2:	0a6080e7          	jalr	166(ra) # 80001394 <release>
      return -1;
    800072f6:	57fd                	li	a5,-1
    800072f8:	a0ed                	j	800073e2 <pipewrite+0x14a>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    800072fa:	fc843783          	ld	a5,-56(s0)
    800072fe:	21c7a703          	lw	a4,540(a5)
    80007302:	fc843783          	ld	a5,-56(s0)
    80007306:	2187a783          	lw	a5,536(a5)
    8000730a:	2007879b          	addiw	a5,a5,512
    8000730e:	2781                	sext.w	a5,a5
    80007310:	02f71863          	bne	a4,a5,80007340 <pipewrite+0xa8>
      wakeup(&pi->nread);
    80007314:	fc843783          	ld	a5,-56(s0)
    80007318:	21878793          	addi	a5,a5,536
    8000731c:	853e                	mv	a0,a5
    8000731e:	ffffc097          	auipc	ra,0xffffc
    80007322:	41e080e7          	jalr	1054(ra) # 8000373c <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80007326:	fc843783          	ld	a5,-56(s0)
    8000732a:	21c78793          	addi	a5,a5,540
    8000732e:	fc843703          	ld	a4,-56(s0)
    80007332:	85ba                	mv	a1,a4
    80007334:	853e                	mv	a0,a5
    80007336:	ffffc097          	auipc	ra,0xffffc
    8000733a:	38a080e7          	jalr	906(ra) # 800036c0 <sleep>
    8000733e:	a0ad                	j	800073a8 <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80007340:	fe043783          	ld	a5,-32(s0)
    80007344:	6ba8                	ld	a0,80(a5)
    80007346:	fec42703          	lw	a4,-20(s0)
    8000734a:	fc043783          	ld	a5,-64(s0)
    8000734e:	973e                	add	a4,a4,a5
    80007350:	fdf40793          	addi	a5,s0,-33
    80007354:	4685                	li	a3,1
    80007356:	863a                	mv	a2,a4
    80007358:	85be                	mv	a1,a5
    8000735a:	ffffb097          	auipc	ra,0xffffb
    8000735e:	33c080e7          	jalr	828(ra) # 80002696 <copyin>
    80007362:	87aa                	mv	a5,a0
    80007364:	873e                	mv	a4,a5
    80007366:	57fd                	li	a5,-1
    80007368:	04f70a63          	beq	a4,a5,800073bc <pipewrite+0x124>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8000736c:	fc843783          	ld	a5,-56(s0)
    80007370:	21c7a783          	lw	a5,540(a5)
    80007374:	2781                	sext.w	a5,a5
    80007376:	0017871b          	addiw	a4,a5,1
    8000737a:	0007069b          	sext.w	a3,a4
    8000737e:	fc843703          	ld	a4,-56(s0)
    80007382:	20d72e23          	sw	a3,540(a4)
    80007386:	1ff7f793          	andi	a5,a5,511
    8000738a:	2781                	sext.w	a5,a5
    8000738c:	fdf44703          	lbu	a4,-33(s0)
    80007390:	fc843683          	ld	a3,-56(s0)
    80007394:	1782                	slli	a5,a5,0x20
    80007396:	9381                	srli	a5,a5,0x20
    80007398:	97b6                	add	a5,a5,a3
    8000739a:	00e78c23          	sb	a4,24(a5)
      i++;
    8000739e:	fec42783          	lw	a5,-20(s0)
    800073a2:	2785                	addiw	a5,a5,1
    800073a4:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    800073a8:	fec42783          	lw	a5,-20(s0)
    800073ac:	873e                	mv	a4,a5
    800073ae:	fbc42783          	lw	a5,-68(s0)
    800073b2:	2701                	sext.w	a4,a4
    800073b4:	2781                	sext.w	a5,a5
    800073b6:	f0f74ce3          	blt	a4,a5,800072ce <pipewrite+0x36>
    800073ba:	a011                	j	800073be <pipewrite+0x126>
        break;
    800073bc:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    800073be:	fc843783          	ld	a5,-56(s0)
    800073c2:	21878793          	addi	a5,a5,536
    800073c6:	853e                	mv	a0,a5
    800073c8:	ffffc097          	auipc	ra,0xffffc
    800073cc:	374080e7          	jalr	884(ra) # 8000373c <wakeup>
  release(&pi->lock);
    800073d0:	fc843783          	ld	a5,-56(s0)
    800073d4:	853e                	mv	a0,a5
    800073d6:	ffffa097          	auipc	ra,0xffffa
    800073da:	fbe080e7          	jalr	-66(ra) # 80001394 <release>

  return i;
    800073de:	fec42783          	lw	a5,-20(s0)
}
    800073e2:	853e                	mv	a0,a5
    800073e4:	60a6                	ld	ra,72(sp)
    800073e6:	6406                	ld	s0,64(sp)
    800073e8:	6161                	addi	sp,sp,80
    800073ea:	8082                	ret

00000000800073ec <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    800073ec:	715d                	addi	sp,sp,-80
    800073ee:	e486                	sd	ra,72(sp)
    800073f0:	e0a2                	sd	s0,64(sp)
    800073f2:	0880                	addi	s0,sp,80
    800073f4:	fca43423          	sd	a0,-56(s0)
    800073f8:	fcb43023          	sd	a1,-64(s0)
    800073fc:	87b2                	mv	a5,a2
    800073fe:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80007402:	ffffb097          	auipc	ra,0xffffb
    80007406:	6fc080e7          	jalr	1788(ra) # 80002afe <myproc>
    8000740a:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    8000740e:	fc843783          	ld	a5,-56(s0)
    80007412:	853e                	mv	a0,a5
    80007414:	ffffa097          	auipc	ra,0xffffa
    80007418:	f1c080e7          	jalr	-228(ra) # 80001330 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000741c:	a835                	j	80007458 <piperead+0x6c>
    if(killed(pr)){
    8000741e:	fe043503          	ld	a0,-32(s0)
    80007422:	ffffc097          	auipc	ra,0xffffc
    80007426:	4ac080e7          	jalr	1196(ra) # 800038ce <killed>
    8000742a:	87aa                	mv	a5,a0
    8000742c:	cb91                	beqz	a5,80007440 <piperead+0x54>
      release(&pi->lock);
    8000742e:	fc843783          	ld	a5,-56(s0)
    80007432:	853e                	mv	a0,a5
    80007434:	ffffa097          	auipc	ra,0xffffa
    80007438:	f60080e7          	jalr	-160(ra) # 80001394 <release>
      return -1;
    8000743c:	57fd                	li	a5,-1
    8000743e:	a8e5                	j	80007536 <piperead+0x14a>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80007440:	fc843783          	ld	a5,-56(s0)
    80007444:	21878793          	addi	a5,a5,536
    80007448:	fc843703          	ld	a4,-56(s0)
    8000744c:	85ba                	mv	a1,a4
    8000744e:	853e                	mv	a0,a5
    80007450:	ffffc097          	auipc	ra,0xffffc
    80007454:	270080e7          	jalr	624(ra) # 800036c0 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007458:	fc843783          	ld	a5,-56(s0)
    8000745c:	2187a703          	lw	a4,536(a5)
    80007460:	fc843783          	ld	a5,-56(s0)
    80007464:	21c7a783          	lw	a5,540(a5)
    80007468:	00f71763          	bne	a4,a5,80007476 <piperead+0x8a>
    8000746c:	fc843783          	ld	a5,-56(s0)
    80007470:	2247a783          	lw	a5,548(a5)
    80007474:	f7cd                	bnez	a5,8000741e <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007476:	fe042623          	sw	zero,-20(s0)
    8000747a:	a8bd                	j	800074f8 <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    8000747c:	fc843783          	ld	a5,-56(s0)
    80007480:	2187a703          	lw	a4,536(a5)
    80007484:	fc843783          	ld	a5,-56(s0)
    80007488:	21c7a783          	lw	a5,540(a5)
    8000748c:	08f70063          	beq	a4,a5,8000750c <piperead+0x120>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    80007490:	fc843783          	ld	a5,-56(s0)
    80007494:	2187a783          	lw	a5,536(a5)
    80007498:	2781                	sext.w	a5,a5
    8000749a:	0017871b          	addiw	a4,a5,1
    8000749e:	0007069b          	sext.w	a3,a4
    800074a2:	fc843703          	ld	a4,-56(s0)
    800074a6:	20d72c23          	sw	a3,536(a4)
    800074aa:	1ff7f793          	andi	a5,a5,511
    800074ae:	2781                	sext.w	a5,a5
    800074b0:	fc843703          	ld	a4,-56(s0)
    800074b4:	1782                	slli	a5,a5,0x20
    800074b6:	9381                	srli	a5,a5,0x20
    800074b8:	97ba                	add	a5,a5,a4
    800074ba:	0187c783          	lbu	a5,24(a5)
    800074be:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    800074c2:	fe043783          	ld	a5,-32(s0)
    800074c6:	6ba8                	ld	a0,80(a5)
    800074c8:	fec42703          	lw	a4,-20(s0)
    800074cc:	fc043783          	ld	a5,-64(s0)
    800074d0:	97ba                	add	a5,a5,a4
    800074d2:	fdf40713          	addi	a4,s0,-33
    800074d6:	4685                	li	a3,1
    800074d8:	863a                	mv	a2,a4
    800074da:	85be                	mv	a1,a5
    800074dc:	ffffb097          	auipc	ra,0xffffb
    800074e0:	0ec080e7          	jalr	236(ra) # 800025c8 <copyout>
    800074e4:	87aa                	mv	a5,a0
    800074e6:	873e                	mv	a4,a5
    800074e8:	57fd                	li	a5,-1
    800074ea:	02f70363          	beq	a4,a5,80007510 <piperead+0x124>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800074ee:	fec42783          	lw	a5,-20(s0)
    800074f2:	2785                	addiw	a5,a5,1
    800074f4:	fef42623          	sw	a5,-20(s0)
    800074f8:	fec42783          	lw	a5,-20(s0)
    800074fc:	873e                	mv	a4,a5
    800074fe:	fbc42783          	lw	a5,-68(s0)
    80007502:	2701                	sext.w	a4,a4
    80007504:	2781                	sext.w	a5,a5
    80007506:	f6f74be3          	blt	a4,a5,8000747c <piperead+0x90>
    8000750a:	a021                	j	80007512 <piperead+0x126>
      break;
    8000750c:	0001                	nop
    8000750e:	a011                	j	80007512 <piperead+0x126>
      break;
    80007510:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80007512:	fc843783          	ld	a5,-56(s0)
    80007516:	21c78793          	addi	a5,a5,540
    8000751a:	853e                	mv	a0,a5
    8000751c:	ffffc097          	auipc	ra,0xffffc
    80007520:	220080e7          	jalr	544(ra) # 8000373c <wakeup>
  release(&pi->lock);
    80007524:	fc843783          	ld	a5,-56(s0)
    80007528:	853e                	mv	a0,a5
    8000752a:	ffffa097          	auipc	ra,0xffffa
    8000752e:	e6a080e7          	jalr	-406(ra) # 80001394 <release>
  return i;
    80007532:	fec42783          	lw	a5,-20(s0)
}
    80007536:	853e                	mv	a0,a5
    80007538:	60a6                	ld	ra,72(sp)
    8000753a:	6406                	ld	s0,64(sp)
    8000753c:	6161                	addi	sp,sp,80
    8000753e:	8082                	ret

0000000080007540 <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    80007540:	7179                	addi	sp,sp,-48
    80007542:	f422                	sd	s0,40(sp)
    80007544:	1800                	addi	s0,sp,48
    80007546:	87aa                	mv	a5,a0
    80007548:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    8000754c:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    80007550:	fdc42783          	lw	a5,-36(s0)
    80007554:	8b85                	andi	a5,a5,1
    80007556:	2781                	sext.w	a5,a5
    80007558:	c781                	beqz	a5,80007560 <flags2perm+0x20>
      perm = PTE_X;
    8000755a:	47a1                	li	a5,8
    8000755c:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    80007560:	fdc42783          	lw	a5,-36(s0)
    80007564:	8b89                	andi	a5,a5,2
    80007566:	2781                	sext.w	a5,a5
    80007568:	c799                	beqz	a5,80007576 <flags2perm+0x36>
      perm |= PTE_W;
    8000756a:	fec42783          	lw	a5,-20(s0)
    8000756e:	0047e793          	ori	a5,a5,4
    80007572:	fef42623          	sw	a5,-20(s0)
    return perm;
    80007576:	fec42783          	lw	a5,-20(s0)
}
    8000757a:	853e                	mv	a0,a5
    8000757c:	7422                	ld	s0,40(sp)
    8000757e:	6145                	addi	sp,sp,48
    80007580:	8082                	ret

0000000080007582 <exec>:

int
exec(char *path, char **argv)
{
    80007582:	de010113          	addi	sp,sp,-544
    80007586:	20113c23          	sd	ra,536(sp)
    8000758a:	20813823          	sd	s0,528(sp)
    8000758e:	20913423          	sd	s1,520(sp)
    80007592:	1400                	addi	s0,sp,544
    80007594:	dea43423          	sd	a0,-536(s0)
    80007598:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    8000759c:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    800075a0:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    800075a4:	ffffb097          	auipc	ra,0xffffb
    800075a8:	55a080e7          	jalr	1370(ra) # 80002afe <myproc>
    800075ac:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    800075b0:	fffff097          	auipc	ra,0xfffff
    800075b4:	f40080e7          	jalr	-192(ra) # 800064f0 <begin_op>

  if((ip = namei(path)) == 0){
    800075b8:	de843503          	ld	a0,-536(s0)
    800075bc:	fffff097          	auipc	ra,0xfffff
    800075c0:	bd0080e7          	jalr	-1072(ra) # 8000618c <namei>
    800075c4:	faa43423          	sd	a0,-88(s0)
    800075c8:	fa843783          	ld	a5,-88(s0)
    800075cc:	e799                	bnez	a5,800075da <exec+0x58>
    end_op();
    800075ce:	fffff097          	auipc	ra,0xfffff
    800075d2:	fe4080e7          	jalr	-28(ra) # 800065b2 <end_op>
    return -1;
    800075d6:	57fd                	li	a5,-1
    800075d8:	a199                	j	80007a1e <exec+0x49c>
  }
  ilock(ip);
    800075da:	fa843503          	ld	a0,-88(s0)
    800075de:	ffffe097          	auipc	ra,0xffffe
    800075e2:	e7e080e7          	jalr	-386(ra) # 8000545c <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800075e6:	e3040793          	addi	a5,s0,-464
    800075ea:	04000713          	li	a4,64
    800075ee:	4681                	li	a3,0
    800075f0:	863e                	mv	a2,a5
    800075f2:	4581                	li	a1,0
    800075f4:	fa843503          	ld	a0,-88(s0)
    800075f8:	ffffe097          	auipc	ra,0xffffe
    800075fc:	41a080e7          	jalr	1050(ra) # 80005a12 <readi>
    80007600:	87aa                	mv	a5,a0
    80007602:	873e                	mv	a4,a5
    80007604:	04000793          	li	a5,64
    80007608:	3af71563          	bne	a4,a5,800079b2 <exec+0x430>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    8000760c:	e3042783          	lw	a5,-464(s0)
    80007610:	873e                	mv	a4,a5
    80007612:	464c47b7          	lui	a5,0x464c4
    80007616:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    8000761a:	38f71e63          	bne	a4,a5,800079b6 <exec+0x434>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    8000761e:	f9843503          	ld	a0,-104(s0)
    80007622:	ffffb097          	auipc	ra,0xffffb
    80007626:	73e080e7          	jalr	1854(ra) # 80002d60 <proc_pagetable>
    8000762a:	faa43023          	sd	a0,-96(s0)
    8000762e:	fa043783          	ld	a5,-96(s0)
    80007632:	38078463          	beqz	a5,800079ba <exec+0x438>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007636:	fc042623          	sw	zero,-52(s0)
    8000763a:	e5043783          	ld	a5,-432(s0)
    8000763e:	fcf42423          	sw	a5,-56(s0)
    80007642:	a0fd                	j	80007730 <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80007644:	df840793          	addi	a5,s0,-520
    80007648:	fc842683          	lw	a3,-56(s0)
    8000764c:	03800713          	li	a4,56
    80007650:	863e                	mv	a2,a5
    80007652:	4581                	li	a1,0
    80007654:	fa843503          	ld	a0,-88(s0)
    80007658:	ffffe097          	auipc	ra,0xffffe
    8000765c:	3ba080e7          	jalr	954(ra) # 80005a12 <readi>
    80007660:	87aa                	mv	a5,a0
    80007662:	873e                	mv	a4,a5
    80007664:	03800793          	li	a5,56
    80007668:	34f71b63          	bne	a4,a5,800079be <exec+0x43c>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    8000766c:	df842783          	lw	a5,-520(s0)
    80007670:	873e                	mv	a4,a5
    80007672:	4785                	li	a5,1
    80007674:	0af71163          	bne	a4,a5,80007716 <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    80007678:	e2043703          	ld	a4,-480(s0)
    8000767c:	e1843783          	ld	a5,-488(s0)
    80007680:	34f76163          	bltu	a4,a5,800079c2 <exec+0x440>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80007684:	e0843703          	ld	a4,-504(s0)
    80007688:	e2043783          	ld	a5,-480(s0)
    8000768c:	973e                	add	a4,a4,a5
    8000768e:	e0843783          	ld	a5,-504(s0)
    80007692:	32f76a63          	bltu	a4,a5,800079c6 <exec+0x444>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    80007696:	e0843703          	ld	a4,-504(s0)
    8000769a:	6785                	lui	a5,0x1
    8000769c:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000769e:	8ff9                	and	a5,a5,a4
    800076a0:	32079563          	bnez	a5,800079ca <exec+0x448>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    800076a4:	e0843703          	ld	a4,-504(s0)
    800076a8:	e2043783          	ld	a5,-480(s0)
    800076ac:	00f704b3          	add	s1,a4,a5
    800076b0:	dfc42783          	lw	a5,-516(s0)
    800076b4:	2781                	sext.w	a5,a5
    800076b6:	853e                	mv	a0,a5
    800076b8:	00000097          	auipc	ra,0x0
    800076bc:	e88080e7          	jalr	-376(ra) # 80007540 <flags2perm>
    800076c0:	87aa                	mv	a5,a0
    800076c2:	86be                	mv	a3,a5
    800076c4:	8626                	mv	a2,s1
    800076c6:	fb843583          	ld	a1,-72(s0)
    800076ca:	fa043503          	ld	a0,-96(s0)
    800076ce:	ffffb097          	auipc	ra,0xffffb
    800076d2:	b0e080e7          	jalr	-1266(ra) # 800021dc <uvmalloc>
    800076d6:	f6a43823          	sd	a0,-144(s0)
    800076da:	f7043783          	ld	a5,-144(s0)
    800076de:	2e078863          	beqz	a5,800079ce <exec+0x44c>
      goto bad;
    sz = sz1;
    800076e2:	f7043783          	ld	a5,-144(s0)
    800076e6:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800076ea:	e0843783          	ld	a5,-504(s0)
    800076ee:	e0043703          	ld	a4,-512(s0)
    800076f2:	0007069b          	sext.w	a3,a4
    800076f6:	e1843703          	ld	a4,-488(s0)
    800076fa:	2701                	sext.w	a4,a4
    800076fc:	fa843603          	ld	a2,-88(s0)
    80007700:	85be                	mv	a1,a5
    80007702:	fa043503          	ld	a0,-96(s0)
    80007706:	00000097          	auipc	ra,0x0
    8000770a:	32c080e7          	jalr	812(ra) # 80007a32 <loadseg>
    8000770e:	87aa                	mv	a5,a0
    80007710:	2c07c163          	bltz	a5,800079d2 <exec+0x450>
    80007714:	a011                	j	80007718 <exec+0x196>
      continue;
    80007716:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007718:	fcc42783          	lw	a5,-52(s0)
    8000771c:	2785                	addiw	a5,a5,1
    8000771e:	fcf42623          	sw	a5,-52(s0)
    80007722:	fc842783          	lw	a5,-56(s0)
    80007726:	0387879b          	addiw	a5,a5,56
    8000772a:	2781                	sext.w	a5,a5
    8000772c:	fcf42423          	sw	a5,-56(s0)
    80007730:	e6845783          	lhu	a5,-408(s0)
    80007734:	0007871b          	sext.w	a4,a5
    80007738:	fcc42783          	lw	a5,-52(s0)
    8000773c:	2781                	sext.w	a5,a5
    8000773e:	f0e7c3e3          	blt	a5,a4,80007644 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    80007742:	fa843503          	ld	a0,-88(s0)
    80007746:	ffffe097          	auipc	ra,0xffffe
    8000774a:	f74080e7          	jalr	-140(ra) # 800056ba <iunlockput>
  end_op();
    8000774e:	fffff097          	auipc	ra,0xfffff
    80007752:	e64080e7          	jalr	-412(ra) # 800065b2 <end_op>
  ip = 0;
    80007756:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    8000775a:	ffffb097          	auipc	ra,0xffffb
    8000775e:	3a4080e7          	jalr	932(ra) # 80002afe <myproc>
    80007762:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007766:	f9843783          	ld	a5,-104(s0)
    8000776a:	67bc                	ld	a5,72(a5)
    8000776c:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80007770:	fb843703          	ld	a4,-72(s0)
    80007774:	6785                	lui	a5,0x1
    80007776:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80007778:	973e                	add	a4,a4,a5
    8000777a:	77fd                	lui	a5,0xfffff
    8000777c:	8ff9                	and	a5,a5,a4
    8000777e:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    80007782:	fb843703          	ld	a4,-72(s0)
    80007786:	6789                	lui	a5,0x2
    80007788:	97ba                	add	a5,a5,a4
    8000778a:	4691                	li	a3,4
    8000778c:	863e                	mv	a2,a5
    8000778e:	fb843583          	ld	a1,-72(s0)
    80007792:	fa043503          	ld	a0,-96(s0)
    80007796:	ffffb097          	auipc	ra,0xffffb
    8000779a:	a46080e7          	jalr	-1466(ra) # 800021dc <uvmalloc>
    8000779e:	f8a43423          	sd	a0,-120(s0)
    800077a2:	f8843783          	ld	a5,-120(s0)
    800077a6:	22078863          	beqz	a5,800079d6 <exec+0x454>
    goto bad;
  sz = sz1;
    800077aa:	f8843783          	ld	a5,-120(s0)
    800077ae:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    800077b2:	fb843703          	ld	a4,-72(s0)
    800077b6:	77f9                	lui	a5,0xffffe
    800077b8:	97ba                	add	a5,a5,a4
    800077ba:	85be                	mv	a1,a5
    800077bc:	fa043503          	ld	a0,-96(s0)
    800077c0:	ffffb097          	auipc	ra,0xffffb
    800077c4:	db2080e7          	jalr	-590(ra) # 80002572 <uvmclear>
  sp = sz;
    800077c8:	fb843783          	ld	a5,-72(s0)
    800077cc:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    800077d0:	fb043703          	ld	a4,-80(s0)
    800077d4:	77fd                	lui	a5,0xfffff
    800077d6:	97ba                	add	a5,a5,a4
    800077d8:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    800077dc:	fc043023          	sd	zero,-64(s0)
    800077e0:	a07d                	j	8000788e <exec+0x30c>
    if(argc >= MAXARG)
    800077e2:	fc043703          	ld	a4,-64(s0)
    800077e6:	47fd                	li	a5,31
    800077e8:	1ee7e963          	bltu	a5,a4,800079da <exec+0x458>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800077ec:	fc043783          	ld	a5,-64(s0)
    800077f0:	078e                	slli	a5,a5,0x3
    800077f2:	de043703          	ld	a4,-544(s0)
    800077f6:	97ba                	add	a5,a5,a4
    800077f8:	639c                	ld	a5,0(a5)
    800077fa:	853e                	mv	a0,a5
    800077fc:	ffffa097          	auipc	ra,0xffffa
    80007800:	1b6080e7          	jalr	438(ra) # 800019b2 <strlen>
    80007804:	87aa                	mv	a5,a0
    80007806:	2785                	addiw	a5,a5,1 # fffffffffffff001 <end+0xffffffff7ffd75c1>
    80007808:	2781                	sext.w	a5,a5
    8000780a:	873e                	mv	a4,a5
    8000780c:	fb043783          	ld	a5,-80(s0)
    80007810:	8f99                	sub	a5,a5,a4
    80007812:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80007816:	fb043783          	ld	a5,-80(s0)
    8000781a:	9bc1                	andi	a5,a5,-16
    8000781c:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007820:	fb043703          	ld	a4,-80(s0)
    80007824:	f8043783          	ld	a5,-128(s0)
    80007828:	1af76b63          	bltu	a4,a5,800079de <exec+0x45c>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8000782c:	fc043783          	ld	a5,-64(s0)
    80007830:	078e                	slli	a5,a5,0x3
    80007832:	de043703          	ld	a4,-544(s0)
    80007836:	97ba                	add	a5,a5,a4
    80007838:	6384                	ld	s1,0(a5)
    8000783a:	fc043783          	ld	a5,-64(s0)
    8000783e:	078e                	slli	a5,a5,0x3
    80007840:	de043703          	ld	a4,-544(s0)
    80007844:	97ba                	add	a5,a5,a4
    80007846:	639c                	ld	a5,0(a5)
    80007848:	853e                	mv	a0,a5
    8000784a:	ffffa097          	auipc	ra,0xffffa
    8000784e:	168080e7          	jalr	360(ra) # 800019b2 <strlen>
    80007852:	87aa                	mv	a5,a0
    80007854:	2785                	addiw	a5,a5,1
    80007856:	2781                	sext.w	a5,a5
    80007858:	86be                	mv	a3,a5
    8000785a:	8626                	mv	a2,s1
    8000785c:	fb043583          	ld	a1,-80(s0)
    80007860:	fa043503          	ld	a0,-96(s0)
    80007864:	ffffb097          	auipc	ra,0xffffb
    80007868:	d64080e7          	jalr	-668(ra) # 800025c8 <copyout>
    8000786c:	87aa                	mv	a5,a0
    8000786e:	1607ca63          	bltz	a5,800079e2 <exec+0x460>
      goto bad;
    ustack[argc] = sp;
    80007872:	fc043783          	ld	a5,-64(s0)
    80007876:	078e                	slli	a5,a5,0x3
    80007878:	1781                	addi	a5,a5,-32
    8000787a:	97a2                	add	a5,a5,s0
    8000787c:	fb043703          	ld	a4,-80(s0)
    80007880:	e8e7b823          	sd	a4,-368(a5)
  for(argc = 0; argv[argc]; argc++) {
    80007884:	fc043783          	ld	a5,-64(s0)
    80007888:	0785                	addi	a5,a5,1
    8000788a:	fcf43023          	sd	a5,-64(s0)
    8000788e:	fc043783          	ld	a5,-64(s0)
    80007892:	078e                	slli	a5,a5,0x3
    80007894:	de043703          	ld	a4,-544(s0)
    80007898:	97ba                	add	a5,a5,a4
    8000789a:	639c                	ld	a5,0(a5)
    8000789c:	f3b9                	bnez	a5,800077e2 <exec+0x260>
  }
  ustack[argc] = 0;
    8000789e:	fc043783          	ld	a5,-64(s0)
    800078a2:	078e                	slli	a5,a5,0x3
    800078a4:	1781                	addi	a5,a5,-32
    800078a6:	97a2                	add	a5,a5,s0
    800078a8:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    800078ac:	fc043783          	ld	a5,-64(s0)
    800078b0:	0785                	addi	a5,a5,1
    800078b2:	078e                	slli	a5,a5,0x3
    800078b4:	fb043703          	ld	a4,-80(s0)
    800078b8:	40f707b3          	sub	a5,a4,a5
    800078bc:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    800078c0:	fb043783          	ld	a5,-80(s0)
    800078c4:	9bc1                	andi	a5,a5,-16
    800078c6:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    800078ca:	fb043703          	ld	a4,-80(s0)
    800078ce:	f8043783          	ld	a5,-128(s0)
    800078d2:	10f76a63          	bltu	a4,a5,800079e6 <exec+0x464>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    800078d6:	fc043783          	ld	a5,-64(s0)
    800078da:	0785                	addi	a5,a5,1
    800078dc:	00379713          	slli	a4,a5,0x3
    800078e0:	e7040793          	addi	a5,s0,-400
    800078e4:	86ba                	mv	a3,a4
    800078e6:	863e                	mv	a2,a5
    800078e8:	fb043583          	ld	a1,-80(s0)
    800078ec:	fa043503          	ld	a0,-96(s0)
    800078f0:	ffffb097          	auipc	ra,0xffffb
    800078f4:	cd8080e7          	jalr	-808(ra) # 800025c8 <copyout>
    800078f8:	87aa                	mv	a5,a0
    800078fa:	0e07c863          	bltz	a5,800079ea <exec+0x468>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    800078fe:	f9843783          	ld	a5,-104(s0)
    80007902:	6fbc                	ld	a5,88(a5)
    80007904:	fb043703          	ld	a4,-80(s0)
    80007908:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    8000790a:	de843783          	ld	a5,-536(s0)
    8000790e:	fcf43c23          	sd	a5,-40(s0)
    80007912:	fd843783          	ld	a5,-40(s0)
    80007916:	fcf43823          	sd	a5,-48(s0)
    8000791a:	a025                	j	80007942 <exec+0x3c0>
    if(*s == '/')
    8000791c:	fd843783          	ld	a5,-40(s0)
    80007920:	0007c783          	lbu	a5,0(a5)
    80007924:	873e                	mv	a4,a5
    80007926:	02f00793          	li	a5,47
    8000792a:	00f71763          	bne	a4,a5,80007938 <exec+0x3b6>
      last = s+1;
    8000792e:	fd843783          	ld	a5,-40(s0)
    80007932:	0785                	addi	a5,a5,1
    80007934:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    80007938:	fd843783          	ld	a5,-40(s0)
    8000793c:	0785                	addi	a5,a5,1
    8000793e:	fcf43c23          	sd	a5,-40(s0)
    80007942:	fd843783          	ld	a5,-40(s0)
    80007946:	0007c783          	lbu	a5,0(a5)
    8000794a:	fbe9                	bnez	a5,8000791c <exec+0x39a>
  safestrcpy(p->name, last, sizeof(p->name));
    8000794c:	f9843783          	ld	a5,-104(s0)
    80007950:	15878793          	addi	a5,a5,344
    80007954:	4641                	li	a2,16
    80007956:	fd043583          	ld	a1,-48(s0)
    8000795a:	853e                	mv	a0,a5
    8000795c:	ffffa097          	auipc	ra,0xffffa
    80007960:	eac080e7          	jalr	-340(ra) # 80001808 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007964:	f9843783          	ld	a5,-104(s0)
    80007968:	6bbc                	ld	a5,80(a5)
    8000796a:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    8000796e:	f9843783          	ld	a5,-104(s0)
    80007972:	fa043703          	ld	a4,-96(s0)
    80007976:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80007978:	f9843783          	ld	a5,-104(s0)
    8000797c:	fb843703          	ld	a4,-72(s0)
    80007980:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007982:	f9843783          	ld	a5,-104(s0)
    80007986:	6fbc                	ld	a5,88(a5)
    80007988:	e4843703          	ld	a4,-440(s0)
    8000798c:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8000798e:	f9843783          	ld	a5,-104(s0)
    80007992:	6fbc                	ld	a5,88(a5)
    80007994:	fb043703          	ld	a4,-80(s0)
    80007998:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    8000799a:	f9043583          	ld	a1,-112(s0)
    8000799e:	f7843503          	ld	a0,-136(s0)
    800079a2:	ffffb097          	auipc	ra,0xffffb
    800079a6:	47e080e7          	jalr	1150(ra) # 80002e20 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    800079aa:	fc043783          	ld	a5,-64(s0)
    800079ae:	2781                	sext.w	a5,a5
    800079b0:	a0bd                	j	80007a1e <exec+0x49c>
    goto bad;
    800079b2:	0001                	nop
    800079b4:	a825                	j	800079ec <exec+0x46a>
    goto bad;
    800079b6:	0001                	nop
    800079b8:	a815                	j	800079ec <exec+0x46a>
    goto bad;
    800079ba:	0001                	nop
    800079bc:	a805                	j	800079ec <exec+0x46a>
      goto bad;
    800079be:	0001                	nop
    800079c0:	a035                	j	800079ec <exec+0x46a>
      goto bad;
    800079c2:	0001                	nop
    800079c4:	a025                	j	800079ec <exec+0x46a>
      goto bad;
    800079c6:	0001                	nop
    800079c8:	a015                	j	800079ec <exec+0x46a>
      goto bad;
    800079ca:	0001                	nop
    800079cc:	a005                	j	800079ec <exec+0x46a>
      goto bad;
    800079ce:	0001                	nop
    800079d0:	a831                	j	800079ec <exec+0x46a>
      goto bad;
    800079d2:	0001                	nop
    800079d4:	a821                	j	800079ec <exec+0x46a>
    goto bad;
    800079d6:	0001                	nop
    800079d8:	a811                	j	800079ec <exec+0x46a>
      goto bad;
    800079da:	0001                	nop
    800079dc:	a801                	j	800079ec <exec+0x46a>
      goto bad;
    800079de:	0001                	nop
    800079e0:	a031                	j	800079ec <exec+0x46a>
      goto bad;
    800079e2:	0001                	nop
    800079e4:	a021                	j	800079ec <exec+0x46a>
    goto bad;
    800079e6:	0001                	nop
    800079e8:	a011                	j	800079ec <exec+0x46a>
    goto bad;
    800079ea:	0001                	nop

 bad:
  if(pagetable)
    800079ec:	fa043783          	ld	a5,-96(s0)
    800079f0:	cb89                	beqz	a5,80007a02 <exec+0x480>
    proc_freepagetable(pagetable, sz);
    800079f2:	fb843583          	ld	a1,-72(s0)
    800079f6:	fa043503          	ld	a0,-96(s0)
    800079fa:	ffffb097          	auipc	ra,0xffffb
    800079fe:	426080e7          	jalr	1062(ra) # 80002e20 <proc_freepagetable>
  if(ip){
    80007a02:	fa843783          	ld	a5,-88(s0)
    80007a06:	cb99                	beqz	a5,80007a1c <exec+0x49a>
    iunlockput(ip);
    80007a08:	fa843503          	ld	a0,-88(s0)
    80007a0c:	ffffe097          	auipc	ra,0xffffe
    80007a10:	cae080e7          	jalr	-850(ra) # 800056ba <iunlockput>
    end_op();
    80007a14:	fffff097          	auipc	ra,0xfffff
    80007a18:	b9e080e7          	jalr	-1122(ra) # 800065b2 <end_op>
  }
  return -1;
    80007a1c:	57fd                	li	a5,-1
}
    80007a1e:	853e                	mv	a0,a5
    80007a20:	21813083          	ld	ra,536(sp)
    80007a24:	21013403          	ld	s0,528(sp)
    80007a28:	20813483          	ld	s1,520(sp)
    80007a2c:	22010113          	addi	sp,sp,544
    80007a30:	8082                	ret

0000000080007a32 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80007a32:	7139                	addi	sp,sp,-64
    80007a34:	fc06                	sd	ra,56(sp)
    80007a36:	f822                	sd	s0,48(sp)
    80007a38:	0080                	addi	s0,sp,64
    80007a3a:	fca43c23          	sd	a0,-40(s0)
    80007a3e:	fcb43823          	sd	a1,-48(s0)
    80007a42:	fcc43423          	sd	a2,-56(s0)
    80007a46:	87b6                	mv	a5,a3
    80007a48:	fcf42223          	sw	a5,-60(s0)
    80007a4c:	87ba                	mv	a5,a4
    80007a4e:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    80007a52:	fe042623          	sw	zero,-20(s0)
    80007a56:	a07d                	j	80007b04 <loadseg+0xd2>
    pa = walkaddr(pagetable, va + i);
    80007a58:	fec46703          	lwu	a4,-20(s0)
    80007a5c:	fd043783          	ld	a5,-48(s0)
    80007a60:	97ba                	add	a5,a5,a4
    80007a62:	85be                	mv	a1,a5
    80007a64:	fd843503          	ld	a0,-40(s0)
    80007a68:	ffffa097          	auipc	ra,0xffffa
    80007a6c:	400080e7          	jalr	1024(ra) # 80001e68 <walkaddr>
    80007a70:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007a74:	fe043783          	ld	a5,-32(s0)
    80007a78:	eb89                	bnez	a5,80007a8a <loadseg+0x58>
      panic("loadseg: address should exist");
    80007a7a:	00004517          	auipc	a0,0x4
    80007a7e:	b8650513          	addi	a0,a0,-1146 # 8000b600 <etext+0x600>
    80007a82:	ffff9097          	auipc	ra,0xffff9
    80007a86:	206080e7          	jalr	518(ra) # 80000c88 <panic>
    if(sz - i < PGSIZE)
    80007a8a:	fc042783          	lw	a5,-64(s0)
    80007a8e:	873e                	mv	a4,a5
    80007a90:	fec42783          	lw	a5,-20(s0)
    80007a94:	40f707bb          	subw	a5,a4,a5
    80007a98:	2781                	sext.w	a5,a5
    80007a9a:	873e                	mv	a4,a5
    80007a9c:	6785                	lui	a5,0x1
    80007a9e:	00f77c63          	bgeu	a4,a5,80007ab6 <loadseg+0x84>
      n = sz - i;
    80007aa2:	fc042783          	lw	a5,-64(s0)
    80007aa6:	873e                	mv	a4,a5
    80007aa8:	fec42783          	lw	a5,-20(s0)
    80007aac:	40f707bb          	subw	a5,a4,a5
    80007ab0:	fef42423          	sw	a5,-24(s0)
    80007ab4:	a021                	j	80007abc <loadseg+0x8a>
    else
      n = PGSIZE;
    80007ab6:	6785                	lui	a5,0x1
    80007ab8:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007abc:	fc442783          	lw	a5,-60(s0)
    80007ac0:	873e                	mv	a4,a5
    80007ac2:	fec42783          	lw	a5,-20(s0)
    80007ac6:	9fb9                	addw	a5,a5,a4
    80007ac8:	2781                	sext.w	a5,a5
    80007aca:	fe842703          	lw	a4,-24(s0)
    80007ace:	86be                	mv	a3,a5
    80007ad0:	fe043603          	ld	a2,-32(s0)
    80007ad4:	4581                	li	a1,0
    80007ad6:	fc843503          	ld	a0,-56(s0)
    80007ada:	ffffe097          	auipc	ra,0xffffe
    80007ade:	f38080e7          	jalr	-200(ra) # 80005a12 <readi>
    80007ae2:	87aa                	mv	a5,a0
    80007ae4:	0007871b          	sext.w	a4,a5
    80007ae8:	fe842783          	lw	a5,-24(s0)
    80007aec:	2781                	sext.w	a5,a5
    80007aee:	00e78463          	beq	a5,a4,80007af6 <loadseg+0xc4>
      return -1;
    80007af2:	57fd                	li	a5,-1
    80007af4:	a015                	j	80007b18 <loadseg+0xe6>
  for(i = 0; i < sz; i += PGSIZE){
    80007af6:	fec42783          	lw	a5,-20(s0)
    80007afa:	873e                	mv	a4,a5
    80007afc:	6785                	lui	a5,0x1
    80007afe:	9fb9                	addw	a5,a5,a4
    80007b00:	fef42623          	sw	a5,-20(s0)
    80007b04:	fec42783          	lw	a5,-20(s0)
    80007b08:	873e                	mv	a4,a5
    80007b0a:	fc042783          	lw	a5,-64(s0)
    80007b0e:	2701                	sext.w	a4,a4
    80007b10:	2781                	sext.w	a5,a5
    80007b12:	f4f763e3          	bltu	a4,a5,80007a58 <loadseg+0x26>
  }
  
  return 0;
    80007b16:	4781                	li	a5,0
}
    80007b18:	853e                	mv	a0,a5
    80007b1a:	70e2                	ld	ra,56(sp)
    80007b1c:	7442                	ld	s0,48(sp)
    80007b1e:	6121                	addi	sp,sp,64
    80007b20:	8082                	ret

0000000080007b22 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80007b22:	7139                	addi	sp,sp,-64
    80007b24:	fc06                	sd	ra,56(sp)
    80007b26:	f822                	sd	s0,48(sp)
    80007b28:	0080                	addi	s0,sp,64
    80007b2a:	87aa                	mv	a5,a0
    80007b2c:	fcb43823          	sd	a1,-48(s0)
    80007b30:	fcc43423          	sd	a2,-56(s0)
    80007b34:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    80007b38:	fe440713          	addi	a4,s0,-28
    80007b3c:	fdc42783          	lw	a5,-36(s0)
    80007b40:	85ba                	mv	a1,a4
    80007b42:	853e                	mv	a0,a5
    80007b44:	ffffd097          	auipc	ra,0xffffd
    80007b48:	86e080e7          	jalr	-1938(ra) # 800043b2 <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007b4c:	fe442783          	lw	a5,-28(s0)
    80007b50:	0207c863          	bltz	a5,80007b80 <argfd+0x5e>
    80007b54:	fe442783          	lw	a5,-28(s0)
    80007b58:	873e                	mv	a4,a5
    80007b5a:	47bd                	li	a5,15
    80007b5c:	02e7c263          	blt	a5,a4,80007b80 <argfd+0x5e>
    80007b60:	ffffb097          	auipc	ra,0xffffb
    80007b64:	f9e080e7          	jalr	-98(ra) # 80002afe <myproc>
    80007b68:	872a                	mv	a4,a0
    80007b6a:	fe442783          	lw	a5,-28(s0)
    80007b6e:	07e9                	addi	a5,a5,26 # 101a <_entry-0x7fffefe6>
    80007b70:	078e                	slli	a5,a5,0x3
    80007b72:	97ba                	add	a5,a5,a4
    80007b74:	639c                	ld	a5,0(a5)
    80007b76:	fef43423          	sd	a5,-24(s0)
    80007b7a:	fe843783          	ld	a5,-24(s0)
    80007b7e:	e399                	bnez	a5,80007b84 <argfd+0x62>
    return -1;
    80007b80:	57fd                	li	a5,-1
    80007b82:	a015                	j	80007ba6 <argfd+0x84>
  if(pfd)
    80007b84:	fd043783          	ld	a5,-48(s0)
    80007b88:	c791                	beqz	a5,80007b94 <argfd+0x72>
    *pfd = fd;
    80007b8a:	fe442703          	lw	a4,-28(s0)
    80007b8e:	fd043783          	ld	a5,-48(s0)
    80007b92:	c398                	sw	a4,0(a5)
  if(pf)
    80007b94:	fc843783          	ld	a5,-56(s0)
    80007b98:	c791                	beqz	a5,80007ba4 <argfd+0x82>
    *pf = f;
    80007b9a:	fc843783          	ld	a5,-56(s0)
    80007b9e:	fe843703          	ld	a4,-24(s0)
    80007ba2:	e398                	sd	a4,0(a5)
  return 0;
    80007ba4:	4781                	li	a5,0
}
    80007ba6:	853e                	mv	a0,a5
    80007ba8:	70e2                	ld	ra,56(sp)
    80007baa:	7442                	ld	s0,48(sp)
    80007bac:	6121                	addi	sp,sp,64
    80007bae:	8082                	ret

0000000080007bb0 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007bb0:	7179                	addi	sp,sp,-48
    80007bb2:	f406                	sd	ra,40(sp)
    80007bb4:	f022                	sd	s0,32(sp)
    80007bb6:	1800                	addi	s0,sp,48
    80007bb8:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007bbc:	ffffb097          	auipc	ra,0xffffb
    80007bc0:	f42080e7          	jalr	-190(ra) # 80002afe <myproc>
    80007bc4:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007bc8:	fe042623          	sw	zero,-20(s0)
    80007bcc:	a825                	j	80007c04 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007bce:	fe043703          	ld	a4,-32(s0)
    80007bd2:	fec42783          	lw	a5,-20(s0)
    80007bd6:	07e9                	addi	a5,a5,26
    80007bd8:	078e                	slli	a5,a5,0x3
    80007bda:	97ba                	add	a5,a5,a4
    80007bdc:	639c                	ld	a5,0(a5)
    80007bde:	ef91                	bnez	a5,80007bfa <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007be0:	fe043703          	ld	a4,-32(s0)
    80007be4:	fec42783          	lw	a5,-20(s0)
    80007be8:	07e9                	addi	a5,a5,26
    80007bea:	078e                	slli	a5,a5,0x3
    80007bec:	97ba                	add	a5,a5,a4
    80007bee:	fd843703          	ld	a4,-40(s0)
    80007bf2:	e398                	sd	a4,0(a5)
      return fd;
    80007bf4:	fec42783          	lw	a5,-20(s0)
    80007bf8:	a831                	j	80007c14 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007bfa:	fec42783          	lw	a5,-20(s0)
    80007bfe:	2785                	addiw	a5,a5,1
    80007c00:	fef42623          	sw	a5,-20(s0)
    80007c04:	fec42783          	lw	a5,-20(s0)
    80007c08:	0007871b          	sext.w	a4,a5
    80007c0c:	47bd                	li	a5,15
    80007c0e:	fce7d0e3          	bge	a5,a4,80007bce <fdalloc+0x1e>
    }
  }
  return -1;
    80007c12:	57fd                	li	a5,-1
}
    80007c14:	853e                	mv	a0,a5
    80007c16:	70a2                	ld	ra,40(sp)
    80007c18:	7402                	ld	s0,32(sp)
    80007c1a:	6145                	addi	sp,sp,48
    80007c1c:	8082                	ret

0000000080007c1e <sys_dup>:

uint64
sys_dup(void)
{
    80007c1e:	1101                	addi	sp,sp,-32
    80007c20:	ec06                	sd	ra,24(sp)
    80007c22:	e822                	sd	s0,16(sp)
    80007c24:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007c26:	fe040793          	addi	a5,s0,-32
    80007c2a:	863e                	mv	a2,a5
    80007c2c:	4581                	li	a1,0
    80007c2e:	4501                	li	a0,0
    80007c30:	00000097          	auipc	ra,0x0
    80007c34:	ef2080e7          	jalr	-270(ra) # 80007b22 <argfd>
    80007c38:	87aa                	mv	a5,a0
    80007c3a:	0007d463          	bgez	a5,80007c42 <sys_dup+0x24>
    return -1;
    80007c3e:	57fd                	li	a5,-1
    80007c40:	a81d                	j	80007c76 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007c42:	fe043783          	ld	a5,-32(s0)
    80007c46:	853e                	mv	a0,a5
    80007c48:	00000097          	auipc	ra,0x0
    80007c4c:	f68080e7          	jalr	-152(ra) # 80007bb0 <fdalloc>
    80007c50:	87aa                	mv	a5,a0
    80007c52:	fef42623          	sw	a5,-20(s0)
    80007c56:	fec42783          	lw	a5,-20(s0)
    80007c5a:	2781                	sext.w	a5,a5
    80007c5c:	0007d463          	bgez	a5,80007c64 <sys_dup+0x46>
    return -1;
    80007c60:	57fd                	li	a5,-1
    80007c62:	a811                	j	80007c76 <sys_dup+0x58>
  filedup(f);
    80007c64:	fe043783          	ld	a5,-32(s0)
    80007c68:	853e                	mv	a0,a5
    80007c6a:	fffff097          	auipc	ra,0xfffff
    80007c6e:	eba080e7          	jalr	-326(ra) # 80006b24 <filedup>
  return fd;
    80007c72:	fec42783          	lw	a5,-20(s0)
}
    80007c76:	853e                	mv	a0,a5
    80007c78:	60e2                	ld	ra,24(sp)
    80007c7a:	6442                	ld	s0,16(sp)
    80007c7c:	6105                	addi	sp,sp,32
    80007c7e:	8082                	ret

0000000080007c80 <sys_read>:

uint64
sys_read(void)
{
    80007c80:	7179                	addi	sp,sp,-48
    80007c82:	f406                	sd	ra,40(sp)
    80007c84:	f022                	sd	s0,32(sp)
    80007c86:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007c88:	fd840793          	addi	a5,s0,-40
    80007c8c:	85be                	mv	a1,a5
    80007c8e:	4505                	li	a0,1
    80007c90:	ffffc097          	auipc	ra,0xffffc
    80007c94:	758080e7          	jalr	1880(ra) # 800043e8 <argaddr>
  argint(2, &n);
    80007c98:	fe440793          	addi	a5,s0,-28
    80007c9c:	85be                	mv	a1,a5
    80007c9e:	4509                	li	a0,2
    80007ca0:	ffffc097          	auipc	ra,0xffffc
    80007ca4:	712080e7          	jalr	1810(ra) # 800043b2 <argint>
  if(argfd(0, 0, &f) < 0)
    80007ca8:	fe840793          	addi	a5,s0,-24
    80007cac:	863e                	mv	a2,a5
    80007cae:	4581                	li	a1,0
    80007cb0:	4501                	li	a0,0
    80007cb2:	00000097          	auipc	ra,0x0
    80007cb6:	e70080e7          	jalr	-400(ra) # 80007b22 <argfd>
    80007cba:	87aa                	mv	a5,a0
    80007cbc:	0007d463          	bgez	a5,80007cc4 <sys_read+0x44>
    return -1;
    80007cc0:	57fd                	li	a5,-1
    80007cc2:	a839                	j	80007ce0 <sys_read+0x60>
  return fileread(f, p, n);
    80007cc4:	fe843783          	ld	a5,-24(s0)
    80007cc8:	fd843703          	ld	a4,-40(s0)
    80007ccc:	fe442683          	lw	a3,-28(s0)
    80007cd0:	8636                	mv	a2,a3
    80007cd2:	85ba                	mv	a1,a4
    80007cd4:	853e                	mv	a0,a5
    80007cd6:	fffff097          	auipc	ra,0xfffff
    80007cda:	060080e7          	jalr	96(ra) # 80006d36 <fileread>
    80007cde:	87aa                	mv	a5,a0
}
    80007ce0:	853e                	mv	a0,a5
    80007ce2:	70a2                	ld	ra,40(sp)
    80007ce4:	7402                	ld	s0,32(sp)
    80007ce6:	6145                	addi	sp,sp,48
    80007ce8:	8082                	ret

0000000080007cea <sys_write>:

uint64
sys_write(void)
{
    80007cea:	7179                	addi	sp,sp,-48
    80007cec:	f406                	sd	ra,40(sp)
    80007cee:	f022                	sd	s0,32(sp)
    80007cf0:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    80007cf2:	fd840793          	addi	a5,s0,-40
    80007cf6:	85be                	mv	a1,a5
    80007cf8:	4505                	li	a0,1
    80007cfa:	ffffc097          	auipc	ra,0xffffc
    80007cfe:	6ee080e7          	jalr	1774(ra) # 800043e8 <argaddr>
  argint(2, &n);
    80007d02:	fe440793          	addi	a5,s0,-28
    80007d06:	85be                	mv	a1,a5
    80007d08:	4509                	li	a0,2
    80007d0a:	ffffc097          	auipc	ra,0xffffc
    80007d0e:	6a8080e7          	jalr	1704(ra) # 800043b2 <argint>
  if(argfd(0, 0, &f) < 0)
    80007d12:	fe840793          	addi	a5,s0,-24
    80007d16:	863e                	mv	a2,a5
    80007d18:	4581                	li	a1,0
    80007d1a:	4501                	li	a0,0
    80007d1c:	00000097          	auipc	ra,0x0
    80007d20:	e06080e7          	jalr	-506(ra) # 80007b22 <argfd>
    80007d24:	87aa                	mv	a5,a0
    80007d26:	0007d463          	bgez	a5,80007d2e <sys_write+0x44>
    return -1;
    80007d2a:	57fd                	li	a5,-1
    80007d2c:	a839                	j	80007d4a <sys_write+0x60>

  return filewrite(f, p, n);
    80007d2e:	fe843783          	ld	a5,-24(s0)
    80007d32:	fd843703          	ld	a4,-40(s0)
    80007d36:	fe442683          	lw	a3,-28(s0)
    80007d3a:	8636                	mv	a2,a3
    80007d3c:	85ba                	mv	a1,a4
    80007d3e:	853e                	mv	a0,a5
    80007d40:	fffff097          	auipc	ra,0xfffff
    80007d44:	154080e7          	jalr	340(ra) # 80006e94 <filewrite>
    80007d48:	87aa                	mv	a5,a0
}
    80007d4a:	853e                	mv	a0,a5
    80007d4c:	70a2                	ld	ra,40(sp)
    80007d4e:	7402                	ld	s0,32(sp)
    80007d50:	6145                	addi	sp,sp,48
    80007d52:	8082                	ret

0000000080007d54 <sys_close>:

uint64
sys_close(void)
{
    80007d54:	1101                	addi	sp,sp,-32
    80007d56:	ec06                	sd	ra,24(sp)
    80007d58:	e822                	sd	s0,16(sp)
    80007d5a:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007d5c:	fe040713          	addi	a4,s0,-32
    80007d60:	fec40793          	addi	a5,s0,-20
    80007d64:	863a                	mv	a2,a4
    80007d66:	85be                	mv	a1,a5
    80007d68:	4501                	li	a0,0
    80007d6a:	00000097          	auipc	ra,0x0
    80007d6e:	db8080e7          	jalr	-584(ra) # 80007b22 <argfd>
    80007d72:	87aa                	mv	a5,a0
    80007d74:	0007d463          	bgez	a5,80007d7c <sys_close+0x28>
    return -1;
    80007d78:	57fd                	li	a5,-1
    80007d7a:	a02d                	j	80007da4 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007d7c:	ffffb097          	auipc	ra,0xffffb
    80007d80:	d82080e7          	jalr	-638(ra) # 80002afe <myproc>
    80007d84:	872a                	mv	a4,a0
    80007d86:	fec42783          	lw	a5,-20(s0)
    80007d8a:	07e9                	addi	a5,a5,26
    80007d8c:	078e                	slli	a5,a5,0x3
    80007d8e:	97ba                	add	a5,a5,a4
    80007d90:	0007b023          	sd	zero,0(a5)
  fileclose(f);
    80007d94:	fe043783          	ld	a5,-32(s0)
    80007d98:	853e                	mv	a0,a5
    80007d9a:	fffff097          	auipc	ra,0xfffff
    80007d9e:	df0080e7          	jalr	-528(ra) # 80006b8a <fileclose>
  return 0;
    80007da2:	4781                	li	a5,0
}
    80007da4:	853e                	mv	a0,a5
    80007da6:	60e2                	ld	ra,24(sp)
    80007da8:	6442                	ld	s0,16(sp)
    80007daa:	6105                	addi	sp,sp,32
    80007dac:	8082                	ret

0000000080007dae <sys_fstat>:

uint64
sys_fstat(void)
{
    80007dae:	1101                	addi	sp,sp,-32
    80007db0:	ec06                	sd	ra,24(sp)
    80007db2:	e822                	sd	s0,16(sp)
    80007db4:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007db6:	fe040793          	addi	a5,s0,-32
    80007dba:	85be                	mv	a1,a5
    80007dbc:	4505                	li	a0,1
    80007dbe:	ffffc097          	auipc	ra,0xffffc
    80007dc2:	62a080e7          	jalr	1578(ra) # 800043e8 <argaddr>
  if(argfd(0, 0, &f) < 0)
    80007dc6:	fe840793          	addi	a5,s0,-24
    80007dca:	863e                	mv	a2,a5
    80007dcc:	4581                	li	a1,0
    80007dce:	4501                	li	a0,0
    80007dd0:	00000097          	auipc	ra,0x0
    80007dd4:	d52080e7          	jalr	-686(ra) # 80007b22 <argfd>
    80007dd8:	87aa                	mv	a5,a0
    80007dda:	0007d463          	bgez	a5,80007de2 <sys_fstat+0x34>
    return -1;
    80007dde:	57fd                	li	a5,-1
    80007de0:	a821                	j	80007df8 <sys_fstat+0x4a>
  return filestat(f, st);
    80007de2:	fe843783          	ld	a5,-24(s0)
    80007de6:	fe043703          	ld	a4,-32(s0)
    80007dea:	85ba                	mv	a1,a4
    80007dec:	853e                	mv	a0,a5
    80007dee:	fffff097          	auipc	ra,0xfffff
    80007df2:	ea4080e7          	jalr	-348(ra) # 80006c92 <filestat>
    80007df6:	87aa                	mv	a5,a0
}
    80007df8:	853e                	mv	a0,a5
    80007dfa:	60e2                	ld	ra,24(sp)
    80007dfc:	6442                	ld	s0,16(sp)
    80007dfe:	6105                	addi	sp,sp,32
    80007e00:	8082                	ret

0000000080007e02 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007e02:	7169                	addi	sp,sp,-304
    80007e04:	f606                	sd	ra,296(sp)
    80007e06:	f222                	sd	s0,288(sp)
    80007e08:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007e0a:	ed040793          	addi	a5,s0,-304
    80007e0e:	08000613          	li	a2,128
    80007e12:	85be                	mv	a1,a5
    80007e14:	4501                	li	a0,0
    80007e16:	ffffc097          	auipc	ra,0xffffc
    80007e1a:	604080e7          	jalr	1540(ra) # 8000441a <argstr>
    80007e1e:	87aa                	mv	a5,a0
    80007e20:	0007cf63          	bltz	a5,80007e3e <sys_link+0x3c>
    80007e24:	f5040793          	addi	a5,s0,-176
    80007e28:	08000613          	li	a2,128
    80007e2c:	85be                	mv	a1,a5
    80007e2e:	4505                	li	a0,1
    80007e30:	ffffc097          	auipc	ra,0xffffc
    80007e34:	5ea080e7          	jalr	1514(ra) # 8000441a <argstr>
    80007e38:	87aa                	mv	a5,a0
    80007e3a:	0007d463          	bgez	a5,80007e42 <sys_link+0x40>
    return -1;
    80007e3e:	57fd                	li	a5,-1
    80007e40:	aaad                	j	80007fba <sys_link+0x1b8>

  begin_op();
    80007e42:	ffffe097          	auipc	ra,0xffffe
    80007e46:	6ae080e7          	jalr	1710(ra) # 800064f0 <begin_op>
  if((ip = namei(old)) == 0){
    80007e4a:	ed040793          	addi	a5,s0,-304
    80007e4e:	853e                	mv	a0,a5
    80007e50:	ffffe097          	auipc	ra,0xffffe
    80007e54:	33c080e7          	jalr	828(ra) # 8000618c <namei>
    80007e58:	fea43423          	sd	a0,-24(s0)
    80007e5c:	fe843783          	ld	a5,-24(s0)
    80007e60:	e799                	bnez	a5,80007e6e <sys_link+0x6c>
    end_op();
    80007e62:	ffffe097          	auipc	ra,0xffffe
    80007e66:	750080e7          	jalr	1872(ra) # 800065b2 <end_op>
    return -1;
    80007e6a:	57fd                	li	a5,-1
    80007e6c:	a2b9                	j	80007fba <sys_link+0x1b8>
  }

  ilock(ip);
    80007e6e:	fe843503          	ld	a0,-24(s0)
    80007e72:	ffffd097          	auipc	ra,0xffffd
    80007e76:	5ea080e7          	jalr	1514(ra) # 8000545c <ilock>
  if(ip->type == T_DIR){
    80007e7a:	fe843783          	ld	a5,-24(s0)
    80007e7e:	04479783          	lh	a5,68(a5)
    80007e82:	873e                	mv	a4,a5
    80007e84:	4785                	li	a5,1
    80007e86:	00f71e63          	bne	a4,a5,80007ea2 <sys_link+0xa0>
    iunlockput(ip);
    80007e8a:	fe843503          	ld	a0,-24(s0)
    80007e8e:	ffffe097          	auipc	ra,0xffffe
    80007e92:	82c080e7          	jalr	-2004(ra) # 800056ba <iunlockput>
    end_op();
    80007e96:	ffffe097          	auipc	ra,0xffffe
    80007e9a:	71c080e7          	jalr	1820(ra) # 800065b2 <end_op>
    return -1;
    80007e9e:	57fd                	li	a5,-1
    80007ea0:	aa29                	j	80007fba <sys_link+0x1b8>
  }

  ip->nlink++;
    80007ea2:	fe843783          	ld	a5,-24(s0)
    80007ea6:	04a79783          	lh	a5,74(a5)
    80007eaa:	17c2                	slli	a5,a5,0x30
    80007eac:	93c1                	srli	a5,a5,0x30
    80007eae:	2785                	addiw	a5,a5,1
    80007eb0:	17c2                	slli	a5,a5,0x30
    80007eb2:	93c1                	srli	a5,a5,0x30
    80007eb4:	0107971b          	slliw	a4,a5,0x10
    80007eb8:	4107571b          	sraiw	a4,a4,0x10
    80007ebc:	fe843783          	ld	a5,-24(s0)
    80007ec0:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007ec4:	fe843503          	ld	a0,-24(s0)
    80007ec8:	ffffd097          	auipc	ra,0xffffd
    80007ecc:	344080e7          	jalr	836(ra) # 8000520c <iupdate>
  iunlock(ip);
    80007ed0:	fe843503          	ld	a0,-24(s0)
    80007ed4:	ffffd097          	auipc	ra,0xffffd
    80007ed8:	6bc080e7          	jalr	1724(ra) # 80005590 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007edc:	fd040713          	addi	a4,s0,-48
    80007ee0:	f5040793          	addi	a5,s0,-176
    80007ee4:	85ba                	mv	a1,a4
    80007ee6:	853e                	mv	a0,a5
    80007ee8:	ffffe097          	auipc	ra,0xffffe
    80007eec:	2d0080e7          	jalr	720(ra) # 800061b8 <nameiparent>
    80007ef0:	fea43023          	sd	a0,-32(s0)
    80007ef4:	fe043783          	ld	a5,-32(s0)
    80007ef8:	cba5                	beqz	a5,80007f68 <sys_link+0x166>
    goto bad;
  ilock(dp);
    80007efa:	fe043503          	ld	a0,-32(s0)
    80007efe:	ffffd097          	auipc	ra,0xffffd
    80007f02:	55e080e7          	jalr	1374(ra) # 8000545c <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007f06:	fe043783          	ld	a5,-32(s0)
    80007f0a:	4398                	lw	a4,0(a5)
    80007f0c:	fe843783          	ld	a5,-24(s0)
    80007f10:	439c                	lw	a5,0(a5)
    80007f12:	02f71263          	bne	a4,a5,80007f36 <sys_link+0x134>
    80007f16:	fe843783          	ld	a5,-24(s0)
    80007f1a:	43d8                	lw	a4,4(a5)
    80007f1c:	fd040793          	addi	a5,s0,-48
    80007f20:	863a                	mv	a2,a4
    80007f22:	85be                	mv	a1,a5
    80007f24:	fe043503          	ld	a0,-32(s0)
    80007f28:	ffffe097          	auipc	ra,0xffffe
    80007f2c:	f58080e7          	jalr	-168(ra) # 80005e80 <dirlink>
    80007f30:	87aa                	mv	a5,a0
    80007f32:	0007d963          	bgez	a5,80007f44 <sys_link+0x142>
    iunlockput(dp);
    80007f36:	fe043503          	ld	a0,-32(s0)
    80007f3a:	ffffd097          	auipc	ra,0xffffd
    80007f3e:	780080e7          	jalr	1920(ra) # 800056ba <iunlockput>
    goto bad;
    80007f42:	a025                	j	80007f6a <sys_link+0x168>
  }
  iunlockput(dp);
    80007f44:	fe043503          	ld	a0,-32(s0)
    80007f48:	ffffd097          	auipc	ra,0xffffd
    80007f4c:	772080e7          	jalr	1906(ra) # 800056ba <iunlockput>
  iput(ip);
    80007f50:	fe843503          	ld	a0,-24(s0)
    80007f54:	ffffd097          	auipc	ra,0xffffd
    80007f58:	696080e7          	jalr	1686(ra) # 800055ea <iput>

  end_op();
    80007f5c:	ffffe097          	auipc	ra,0xffffe
    80007f60:	656080e7          	jalr	1622(ra) # 800065b2 <end_op>

  return 0;
    80007f64:	4781                	li	a5,0
    80007f66:	a891                	j	80007fba <sys_link+0x1b8>
    goto bad;
    80007f68:	0001                	nop

bad:
  ilock(ip);
    80007f6a:	fe843503          	ld	a0,-24(s0)
    80007f6e:	ffffd097          	auipc	ra,0xffffd
    80007f72:	4ee080e7          	jalr	1262(ra) # 8000545c <ilock>
  ip->nlink--;
    80007f76:	fe843783          	ld	a5,-24(s0)
    80007f7a:	04a79783          	lh	a5,74(a5)
    80007f7e:	17c2                	slli	a5,a5,0x30
    80007f80:	93c1                	srli	a5,a5,0x30
    80007f82:	37fd                	addiw	a5,a5,-1
    80007f84:	17c2                	slli	a5,a5,0x30
    80007f86:	93c1                	srli	a5,a5,0x30
    80007f88:	0107971b          	slliw	a4,a5,0x10
    80007f8c:	4107571b          	sraiw	a4,a4,0x10
    80007f90:	fe843783          	ld	a5,-24(s0)
    80007f94:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007f98:	fe843503          	ld	a0,-24(s0)
    80007f9c:	ffffd097          	auipc	ra,0xffffd
    80007fa0:	270080e7          	jalr	624(ra) # 8000520c <iupdate>
  iunlockput(ip);
    80007fa4:	fe843503          	ld	a0,-24(s0)
    80007fa8:	ffffd097          	auipc	ra,0xffffd
    80007fac:	712080e7          	jalr	1810(ra) # 800056ba <iunlockput>
  end_op();
    80007fb0:	ffffe097          	auipc	ra,0xffffe
    80007fb4:	602080e7          	jalr	1538(ra) # 800065b2 <end_op>
  return -1;
    80007fb8:	57fd                	li	a5,-1
}
    80007fba:	853e                	mv	a0,a5
    80007fbc:	70b2                	ld	ra,296(sp)
    80007fbe:	7412                	ld	s0,288(sp)
    80007fc0:	6155                	addi	sp,sp,304
    80007fc2:	8082                	ret

0000000080007fc4 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007fc4:	7139                	addi	sp,sp,-64
    80007fc6:	fc06                	sd	ra,56(sp)
    80007fc8:	f822                	sd	s0,48(sp)
    80007fca:	0080                	addi	s0,sp,64
    80007fcc:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007fd0:	02000793          	li	a5,32
    80007fd4:	fef42623          	sw	a5,-20(s0)
    80007fd8:	a0b1                	j	80008024 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007fda:	fd840793          	addi	a5,s0,-40
    80007fde:	fec42683          	lw	a3,-20(s0)
    80007fe2:	4741                	li	a4,16
    80007fe4:	863e                	mv	a2,a5
    80007fe6:	4581                	li	a1,0
    80007fe8:	fc843503          	ld	a0,-56(s0)
    80007fec:	ffffe097          	auipc	ra,0xffffe
    80007ff0:	a26080e7          	jalr	-1498(ra) # 80005a12 <readi>
    80007ff4:	87aa                	mv	a5,a0
    80007ff6:	873e                	mv	a4,a5
    80007ff8:	47c1                	li	a5,16
    80007ffa:	00f70a63          	beq	a4,a5,8000800e <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007ffe:	00003517          	auipc	a0,0x3
    80008002:	62250513          	addi	a0,a0,1570 # 8000b620 <etext+0x620>
    80008006:	ffff9097          	auipc	ra,0xffff9
    8000800a:	c82080e7          	jalr	-894(ra) # 80000c88 <panic>
    if(de.inum != 0)
    8000800e:	fd845783          	lhu	a5,-40(s0)
    80008012:	c399                	beqz	a5,80008018 <isdirempty+0x54>
      return 0;
    80008014:	4781                	li	a5,0
    80008016:	a839                	j	80008034 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80008018:	fec42783          	lw	a5,-20(s0)
    8000801c:	27c1                	addiw	a5,a5,16
    8000801e:	2781                	sext.w	a5,a5
    80008020:	fef42623          	sw	a5,-20(s0)
    80008024:	fc843783          	ld	a5,-56(s0)
    80008028:	47f8                	lw	a4,76(a5)
    8000802a:	fec42783          	lw	a5,-20(s0)
    8000802e:	fae7e6e3          	bltu	a5,a4,80007fda <isdirempty+0x16>
  }
  return 1;
    80008032:	4785                	li	a5,1
}
    80008034:	853e                	mv	a0,a5
    80008036:	70e2                	ld	ra,56(sp)
    80008038:	7442                	ld	s0,48(sp)
    8000803a:	6121                	addi	sp,sp,64
    8000803c:	8082                	ret

000000008000803e <sys_unlink>:

uint64
sys_unlink(void)
{
    8000803e:	7155                	addi	sp,sp,-208
    80008040:	e586                	sd	ra,200(sp)
    80008042:	e1a2                	sd	s0,192(sp)
    80008044:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80008046:	f4040793          	addi	a5,s0,-192
    8000804a:	08000613          	li	a2,128
    8000804e:	85be                	mv	a1,a5
    80008050:	4501                	li	a0,0
    80008052:	ffffc097          	auipc	ra,0xffffc
    80008056:	3c8080e7          	jalr	968(ra) # 8000441a <argstr>
    8000805a:	87aa                	mv	a5,a0
    8000805c:	0007d463          	bgez	a5,80008064 <sys_unlink+0x26>
    return -1;
    80008060:	57fd                	li	a5,-1
    80008062:	a2d5                	j	80008246 <sys_unlink+0x208>

  begin_op();
    80008064:	ffffe097          	auipc	ra,0xffffe
    80008068:	48c080e7          	jalr	1164(ra) # 800064f0 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    8000806c:	fc040713          	addi	a4,s0,-64
    80008070:	f4040793          	addi	a5,s0,-192
    80008074:	85ba                	mv	a1,a4
    80008076:	853e                	mv	a0,a5
    80008078:	ffffe097          	auipc	ra,0xffffe
    8000807c:	140080e7          	jalr	320(ra) # 800061b8 <nameiparent>
    80008080:	fea43423          	sd	a0,-24(s0)
    80008084:	fe843783          	ld	a5,-24(s0)
    80008088:	e799                	bnez	a5,80008096 <sys_unlink+0x58>
    end_op();
    8000808a:	ffffe097          	auipc	ra,0xffffe
    8000808e:	528080e7          	jalr	1320(ra) # 800065b2 <end_op>
    return -1;
    80008092:	57fd                	li	a5,-1
    80008094:	aa4d                	j	80008246 <sys_unlink+0x208>
  }

  ilock(dp);
    80008096:	fe843503          	ld	a0,-24(s0)
    8000809a:	ffffd097          	auipc	ra,0xffffd
    8000809e:	3c2080e7          	jalr	962(ra) # 8000545c <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    800080a2:	fc040793          	addi	a5,s0,-64
    800080a6:	00003597          	auipc	a1,0x3
    800080aa:	59258593          	addi	a1,a1,1426 # 8000b638 <etext+0x638>
    800080ae:	853e                	mv	a0,a5
    800080b0:	ffffe097          	auipc	ra,0xffffe
    800080b4:	cbc080e7          	jalr	-836(ra) # 80005d6c <namecmp>
    800080b8:	87aa                	mv	a5,a0
    800080ba:	16078863          	beqz	a5,8000822a <sys_unlink+0x1ec>
    800080be:	fc040793          	addi	a5,s0,-64
    800080c2:	00003597          	auipc	a1,0x3
    800080c6:	57e58593          	addi	a1,a1,1406 # 8000b640 <etext+0x640>
    800080ca:	853e                	mv	a0,a5
    800080cc:	ffffe097          	auipc	ra,0xffffe
    800080d0:	ca0080e7          	jalr	-864(ra) # 80005d6c <namecmp>
    800080d4:	87aa                	mv	a5,a0
    800080d6:	14078a63          	beqz	a5,8000822a <sys_unlink+0x1ec>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    800080da:	f3c40713          	addi	a4,s0,-196
    800080de:	fc040793          	addi	a5,s0,-64
    800080e2:	863a                	mv	a2,a4
    800080e4:	85be                	mv	a1,a5
    800080e6:	fe843503          	ld	a0,-24(s0)
    800080ea:	ffffe097          	auipc	ra,0xffffe
    800080ee:	cb0080e7          	jalr	-848(ra) # 80005d9a <dirlookup>
    800080f2:	fea43023          	sd	a0,-32(s0)
    800080f6:	fe043783          	ld	a5,-32(s0)
    800080fa:	12078a63          	beqz	a5,8000822e <sys_unlink+0x1f0>
    goto bad;
  ilock(ip);
    800080fe:	fe043503          	ld	a0,-32(s0)
    80008102:	ffffd097          	auipc	ra,0xffffd
    80008106:	35a080e7          	jalr	858(ra) # 8000545c <ilock>

  if(ip->nlink < 1)
    8000810a:	fe043783          	ld	a5,-32(s0)
    8000810e:	04a79783          	lh	a5,74(a5)
    80008112:	00f04a63          	bgtz	a5,80008126 <sys_unlink+0xe8>
    panic("unlink: nlink < 1");
    80008116:	00003517          	auipc	a0,0x3
    8000811a:	53250513          	addi	a0,a0,1330 # 8000b648 <etext+0x648>
    8000811e:	ffff9097          	auipc	ra,0xffff9
    80008122:	b6a080e7          	jalr	-1174(ra) # 80000c88 <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80008126:	fe043783          	ld	a5,-32(s0)
    8000812a:	04479783          	lh	a5,68(a5)
    8000812e:	873e                	mv	a4,a5
    80008130:	4785                	li	a5,1
    80008132:	02f71163          	bne	a4,a5,80008154 <sys_unlink+0x116>
    80008136:	fe043503          	ld	a0,-32(s0)
    8000813a:	00000097          	auipc	ra,0x0
    8000813e:	e8a080e7          	jalr	-374(ra) # 80007fc4 <isdirempty>
    80008142:	87aa                	mv	a5,a0
    80008144:	eb81                	bnez	a5,80008154 <sys_unlink+0x116>
    iunlockput(ip);
    80008146:	fe043503          	ld	a0,-32(s0)
    8000814a:	ffffd097          	auipc	ra,0xffffd
    8000814e:	570080e7          	jalr	1392(ra) # 800056ba <iunlockput>
    goto bad;
    80008152:	a8f9                	j	80008230 <sys_unlink+0x1f2>
  }

  memset(&de, 0, sizeof(de));
    80008154:	fd040793          	addi	a5,s0,-48
    80008158:	4641                	li	a2,16
    8000815a:	4581                	li	a1,0
    8000815c:	853e                	mv	a0,a5
    8000815e:	ffff9097          	auipc	ra,0xffff9
    80008162:	3a6080e7          	jalr	934(ra) # 80001504 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80008166:	fd040793          	addi	a5,s0,-48
    8000816a:	f3c42683          	lw	a3,-196(s0)
    8000816e:	4741                	li	a4,16
    80008170:	863e                	mv	a2,a5
    80008172:	4581                	li	a1,0
    80008174:	fe843503          	ld	a0,-24(s0)
    80008178:	ffffe097          	auipc	ra,0xffffe
    8000817c:	a38080e7          	jalr	-1480(ra) # 80005bb0 <writei>
    80008180:	87aa                	mv	a5,a0
    80008182:	873e                	mv	a4,a5
    80008184:	47c1                	li	a5,16
    80008186:	00f70a63          	beq	a4,a5,8000819a <sys_unlink+0x15c>
    panic("unlink: writei");
    8000818a:	00003517          	auipc	a0,0x3
    8000818e:	4d650513          	addi	a0,a0,1238 # 8000b660 <etext+0x660>
    80008192:	ffff9097          	auipc	ra,0xffff9
    80008196:	af6080e7          	jalr	-1290(ra) # 80000c88 <panic>
  if(ip->type == T_DIR){
    8000819a:	fe043783          	ld	a5,-32(s0)
    8000819e:	04479783          	lh	a5,68(a5)
    800081a2:	873e                	mv	a4,a5
    800081a4:	4785                	li	a5,1
    800081a6:	02f71963          	bne	a4,a5,800081d8 <sys_unlink+0x19a>
    dp->nlink--;
    800081aa:	fe843783          	ld	a5,-24(s0)
    800081ae:	04a79783          	lh	a5,74(a5)
    800081b2:	17c2                	slli	a5,a5,0x30
    800081b4:	93c1                	srli	a5,a5,0x30
    800081b6:	37fd                	addiw	a5,a5,-1
    800081b8:	17c2                	slli	a5,a5,0x30
    800081ba:	93c1                	srli	a5,a5,0x30
    800081bc:	0107971b          	slliw	a4,a5,0x10
    800081c0:	4107571b          	sraiw	a4,a4,0x10
    800081c4:	fe843783          	ld	a5,-24(s0)
    800081c8:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800081cc:	fe843503          	ld	a0,-24(s0)
    800081d0:	ffffd097          	auipc	ra,0xffffd
    800081d4:	03c080e7          	jalr	60(ra) # 8000520c <iupdate>
  }
  iunlockput(dp);
    800081d8:	fe843503          	ld	a0,-24(s0)
    800081dc:	ffffd097          	auipc	ra,0xffffd
    800081e0:	4de080e7          	jalr	1246(ra) # 800056ba <iunlockput>

  ip->nlink--;
    800081e4:	fe043783          	ld	a5,-32(s0)
    800081e8:	04a79783          	lh	a5,74(a5)
    800081ec:	17c2                	slli	a5,a5,0x30
    800081ee:	93c1                	srli	a5,a5,0x30
    800081f0:	37fd                	addiw	a5,a5,-1
    800081f2:	17c2                	slli	a5,a5,0x30
    800081f4:	93c1                	srli	a5,a5,0x30
    800081f6:	0107971b          	slliw	a4,a5,0x10
    800081fa:	4107571b          	sraiw	a4,a4,0x10
    800081fe:	fe043783          	ld	a5,-32(s0)
    80008202:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008206:	fe043503          	ld	a0,-32(s0)
    8000820a:	ffffd097          	auipc	ra,0xffffd
    8000820e:	002080e7          	jalr	2(ra) # 8000520c <iupdate>
  iunlockput(ip);
    80008212:	fe043503          	ld	a0,-32(s0)
    80008216:	ffffd097          	auipc	ra,0xffffd
    8000821a:	4a4080e7          	jalr	1188(ra) # 800056ba <iunlockput>

  end_op();
    8000821e:	ffffe097          	auipc	ra,0xffffe
    80008222:	394080e7          	jalr	916(ra) # 800065b2 <end_op>

  return 0;
    80008226:	4781                	li	a5,0
    80008228:	a839                	j	80008246 <sys_unlink+0x208>
    goto bad;
    8000822a:	0001                	nop
    8000822c:	a011                	j	80008230 <sys_unlink+0x1f2>
    goto bad;
    8000822e:	0001                	nop

bad:
  iunlockput(dp);
    80008230:	fe843503          	ld	a0,-24(s0)
    80008234:	ffffd097          	auipc	ra,0xffffd
    80008238:	486080e7          	jalr	1158(ra) # 800056ba <iunlockput>
  end_op();
    8000823c:	ffffe097          	auipc	ra,0xffffe
    80008240:	376080e7          	jalr	886(ra) # 800065b2 <end_op>
  return -1;
    80008244:	57fd                	li	a5,-1
}
    80008246:	853e                	mv	a0,a5
    80008248:	60ae                	ld	ra,200(sp)
    8000824a:	640e                	ld	s0,192(sp)
    8000824c:	6169                	addi	sp,sp,208
    8000824e:	8082                	ret

0000000080008250 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80008250:	7139                	addi	sp,sp,-64
    80008252:	fc06                	sd	ra,56(sp)
    80008254:	f822                	sd	s0,48(sp)
    80008256:	0080                	addi	s0,sp,64
    80008258:	fca43423          	sd	a0,-56(s0)
    8000825c:	87ae                	mv	a5,a1
    8000825e:	8736                	mv	a4,a3
    80008260:	fcf41323          	sh	a5,-58(s0)
    80008264:	87b2                	mv	a5,a2
    80008266:	fcf41223          	sh	a5,-60(s0)
    8000826a:	87ba                	mv	a5,a4
    8000826c:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80008270:	fd040793          	addi	a5,s0,-48
    80008274:	85be                	mv	a1,a5
    80008276:	fc843503          	ld	a0,-56(s0)
    8000827a:	ffffe097          	auipc	ra,0xffffe
    8000827e:	f3e080e7          	jalr	-194(ra) # 800061b8 <nameiparent>
    80008282:	fea43423          	sd	a0,-24(s0)
    80008286:	fe843783          	ld	a5,-24(s0)
    8000828a:	e399                	bnez	a5,80008290 <create+0x40>
    return 0;
    8000828c:	4781                	li	a5,0
    8000828e:	a2dd                	j	80008474 <create+0x224>

  ilock(dp);
    80008290:	fe843503          	ld	a0,-24(s0)
    80008294:	ffffd097          	auipc	ra,0xffffd
    80008298:	1c8080e7          	jalr	456(ra) # 8000545c <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    8000829c:	fd040793          	addi	a5,s0,-48
    800082a0:	4601                	li	a2,0
    800082a2:	85be                	mv	a1,a5
    800082a4:	fe843503          	ld	a0,-24(s0)
    800082a8:	ffffe097          	auipc	ra,0xffffe
    800082ac:	af2080e7          	jalr	-1294(ra) # 80005d9a <dirlookup>
    800082b0:	fea43023          	sd	a0,-32(s0)
    800082b4:	fe043783          	ld	a5,-32(s0)
    800082b8:	cfb9                	beqz	a5,80008316 <create+0xc6>
    iunlockput(dp);
    800082ba:	fe843503          	ld	a0,-24(s0)
    800082be:	ffffd097          	auipc	ra,0xffffd
    800082c2:	3fc080e7          	jalr	1020(ra) # 800056ba <iunlockput>
    ilock(ip);
    800082c6:	fe043503          	ld	a0,-32(s0)
    800082ca:	ffffd097          	auipc	ra,0xffffd
    800082ce:	192080e7          	jalr	402(ra) # 8000545c <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    800082d2:	fc641783          	lh	a5,-58(s0)
    800082d6:	0007871b          	sext.w	a4,a5
    800082da:	4789                	li	a5,2
    800082dc:	02f71563          	bne	a4,a5,80008306 <create+0xb6>
    800082e0:	fe043783          	ld	a5,-32(s0)
    800082e4:	04479783          	lh	a5,68(a5)
    800082e8:	873e                	mv	a4,a5
    800082ea:	4789                	li	a5,2
    800082ec:	00f70a63          	beq	a4,a5,80008300 <create+0xb0>
    800082f0:	fe043783          	ld	a5,-32(s0)
    800082f4:	04479783          	lh	a5,68(a5)
    800082f8:	873e                	mv	a4,a5
    800082fa:	478d                	li	a5,3
    800082fc:	00f71563          	bne	a4,a5,80008306 <create+0xb6>
      return ip;
    80008300:	fe043783          	ld	a5,-32(s0)
    80008304:	aa85                	j	80008474 <create+0x224>
    iunlockput(ip);
    80008306:	fe043503          	ld	a0,-32(s0)
    8000830a:	ffffd097          	auipc	ra,0xffffd
    8000830e:	3b0080e7          	jalr	944(ra) # 800056ba <iunlockput>
    return 0;
    80008312:	4781                	li	a5,0
    80008314:	a285                	j	80008474 <create+0x224>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    80008316:	fe843783          	ld	a5,-24(s0)
    8000831a:	439c                	lw	a5,0(a5)
    8000831c:	fc641703          	lh	a4,-58(s0)
    80008320:	85ba                	mv	a1,a4
    80008322:	853e                	mv	a0,a5
    80008324:	ffffd097          	auipc	ra,0xffffd
    80008328:	dea080e7          	jalr	-534(ra) # 8000510e <ialloc>
    8000832c:	fea43023          	sd	a0,-32(s0)
    80008330:	fe043783          	ld	a5,-32(s0)
    80008334:	eb89                	bnez	a5,80008346 <create+0xf6>
    iunlockput(dp);
    80008336:	fe843503          	ld	a0,-24(s0)
    8000833a:	ffffd097          	auipc	ra,0xffffd
    8000833e:	380080e7          	jalr	896(ra) # 800056ba <iunlockput>
    return 0;
    80008342:	4781                	li	a5,0
    80008344:	aa05                	j	80008474 <create+0x224>
  }

  ilock(ip);
    80008346:	fe043503          	ld	a0,-32(s0)
    8000834a:	ffffd097          	auipc	ra,0xffffd
    8000834e:	112080e7          	jalr	274(ra) # 8000545c <ilock>
  ip->major = major;
    80008352:	fe043783          	ld	a5,-32(s0)
    80008356:	fc445703          	lhu	a4,-60(s0)
    8000835a:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    8000835e:	fe043783          	ld	a5,-32(s0)
    80008362:	fc245703          	lhu	a4,-62(s0)
    80008366:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    8000836a:	fe043783          	ld	a5,-32(s0)
    8000836e:	4705                	li	a4,1
    80008370:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008374:	fe043503          	ld	a0,-32(s0)
    80008378:	ffffd097          	auipc	ra,0xffffd
    8000837c:	e94080e7          	jalr	-364(ra) # 8000520c <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80008380:	fc641783          	lh	a5,-58(s0)
    80008384:	0007871b          	sext.w	a4,a5
    80008388:	4785                	li	a5,1
    8000838a:	04f71463          	bne	a4,a5,800083d2 <create+0x182>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    8000838e:	fe043783          	ld	a5,-32(s0)
    80008392:	43dc                	lw	a5,4(a5)
    80008394:	863e                	mv	a2,a5
    80008396:	00003597          	auipc	a1,0x3
    8000839a:	2a258593          	addi	a1,a1,674 # 8000b638 <etext+0x638>
    8000839e:	fe043503          	ld	a0,-32(s0)
    800083a2:	ffffe097          	auipc	ra,0xffffe
    800083a6:	ade080e7          	jalr	-1314(ra) # 80005e80 <dirlink>
    800083aa:	87aa                	mv	a5,a0
    800083ac:	0807ca63          	bltz	a5,80008440 <create+0x1f0>
    800083b0:	fe843783          	ld	a5,-24(s0)
    800083b4:	43dc                	lw	a5,4(a5)
    800083b6:	863e                	mv	a2,a5
    800083b8:	00003597          	auipc	a1,0x3
    800083bc:	28858593          	addi	a1,a1,648 # 8000b640 <etext+0x640>
    800083c0:	fe043503          	ld	a0,-32(s0)
    800083c4:	ffffe097          	auipc	ra,0xffffe
    800083c8:	abc080e7          	jalr	-1348(ra) # 80005e80 <dirlink>
    800083cc:	87aa                	mv	a5,a0
    800083ce:	0607c963          	bltz	a5,80008440 <create+0x1f0>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    800083d2:	fe043783          	ld	a5,-32(s0)
    800083d6:	43d8                	lw	a4,4(a5)
    800083d8:	fd040793          	addi	a5,s0,-48
    800083dc:	863a                	mv	a2,a4
    800083de:	85be                	mv	a1,a5
    800083e0:	fe843503          	ld	a0,-24(s0)
    800083e4:	ffffe097          	auipc	ra,0xffffe
    800083e8:	a9c080e7          	jalr	-1380(ra) # 80005e80 <dirlink>
    800083ec:	87aa                	mv	a5,a0
    800083ee:	0407cb63          	bltz	a5,80008444 <create+0x1f4>
    goto fail;

  if(type == T_DIR){
    800083f2:	fc641783          	lh	a5,-58(s0)
    800083f6:	0007871b          	sext.w	a4,a5
    800083fa:	4785                	li	a5,1
    800083fc:	02f71963          	bne	a4,a5,8000842e <create+0x1de>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    80008400:	fe843783          	ld	a5,-24(s0)
    80008404:	04a79783          	lh	a5,74(a5)
    80008408:	17c2                	slli	a5,a5,0x30
    8000840a:	93c1                	srli	a5,a5,0x30
    8000840c:	2785                	addiw	a5,a5,1
    8000840e:	17c2                	slli	a5,a5,0x30
    80008410:	93c1                	srli	a5,a5,0x30
    80008412:	0107971b          	slliw	a4,a5,0x10
    80008416:	4107571b          	sraiw	a4,a4,0x10
    8000841a:	fe843783          	ld	a5,-24(s0)
    8000841e:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80008422:	fe843503          	ld	a0,-24(s0)
    80008426:	ffffd097          	auipc	ra,0xffffd
    8000842a:	de6080e7          	jalr	-538(ra) # 8000520c <iupdate>
  }

  iunlockput(dp);
    8000842e:	fe843503          	ld	a0,-24(s0)
    80008432:	ffffd097          	auipc	ra,0xffffd
    80008436:	288080e7          	jalr	648(ra) # 800056ba <iunlockput>

  return ip;
    8000843a:	fe043783          	ld	a5,-32(s0)
    8000843e:	a81d                	j	80008474 <create+0x224>
      goto fail;
    80008440:	0001                	nop
    80008442:	a011                	j	80008446 <create+0x1f6>
    goto fail;
    80008444:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    80008446:	fe043783          	ld	a5,-32(s0)
    8000844a:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    8000844e:	fe043503          	ld	a0,-32(s0)
    80008452:	ffffd097          	auipc	ra,0xffffd
    80008456:	dba080e7          	jalr	-582(ra) # 8000520c <iupdate>
  iunlockput(ip);
    8000845a:	fe043503          	ld	a0,-32(s0)
    8000845e:	ffffd097          	auipc	ra,0xffffd
    80008462:	25c080e7          	jalr	604(ra) # 800056ba <iunlockput>
  iunlockput(dp);
    80008466:	fe843503          	ld	a0,-24(s0)
    8000846a:	ffffd097          	auipc	ra,0xffffd
    8000846e:	250080e7          	jalr	592(ra) # 800056ba <iunlockput>
  return 0;
    80008472:	4781                	li	a5,0
}
    80008474:	853e                	mv	a0,a5
    80008476:	70e2                	ld	ra,56(sp)
    80008478:	7442                	ld	s0,48(sp)
    8000847a:	6121                	addi	sp,sp,64
    8000847c:	8082                	ret

000000008000847e <sys_open>:

uint64
sys_open(void)
{
    8000847e:	7131                	addi	sp,sp,-192
    80008480:	fd06                	sd	ra,184(sp)
    80008482:	f922                	sd	s0,176(sp)
    80008484:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    80008486:	f4c40793          	addi	a5,s0,-180
    8000848a:	85be                	mv	a1,a5
    8000848c:	4505                	li	a0,1
    8000848e:	ffffc097          	auipc	ra,0xffffc
    80008492:	f24080e7          	jalr	-220(ra) # 800043b2 <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    80008496:	f5040793          	addi	a5,s0,-176
    8000849a:	08000613          	li	a2,128
    8000849e:	85be                	mv	a1,a5
    800084a0:	4501                	li	a0,0
    800084a2:	ffffc097          	auipc	ra,0xffffc
    800084a6:	f78080e7          	jalr	-136(ra) # 8000441a <argstr>
    800084aa:	87aa                	mv	a5,a0
    800084ac:	fef42223          	sw	a5,-28(s0)
    800084b0:	fe442783          	lw	a5,-28(s0)
    800084b4:	2781                	sext.w	a5,a5
    800084b6:	0007d463          	bgez	a5,800084be <sys_open+0x40>
    return -1;
    800084ba:	57fd                	li	a5,-1
    800084bc:	aafd                	j	800086ba <sys_open+0x23c>

  begin_op();
    800084be:	ffffe097          	auipc	ra,0xffffe
    800084c2:	032080e7          	jalr	50(ra) # 800064f0 <begin_op>

  if(omode & O_CREATE){
    800084c6:	f4c42783          	lw	a5,-180(s0)
    800084ca:	2007f793          	andi	a5,a5,512
    800084ce:	2781                	sext.w	a5,a5
    800084d0:	c795                	beqz	a5,800084fc <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    800084d2:	f5040793          	addi	a5,s0,-176
    800084d6:	4681                	li	a3,0
    800084d8:	4601                	li	a2,0
    800084da:	4589                	li	a1,2
    800084dc:	853e                	mv	a0,a5
    800084de:	00000097          	auipc	ra,0x0
    800084e2:	d72080e7          	jalr	-654(ra) # 80008250 <create>
    800084e6:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800084ea:	fe843783          	ld	a5,-24(s0)
    800084ee:	e7b5                	bnez	a5,8000855a <sys_open+0xdc>
      end_op();
    800084f0:	ffffe097          	auipc	ra,0xffffe
    800084f4:	0c2080e7          	jalr	194(ra) # 800065b2 <end_op>
      return -1;
    800084f8:	57fd                	li	a5,-1
    800084fa:	a2c1                	j	800086ba <sys_open+0x23c>
    }
  } else {
    if((ip = namei(path)) == 0){
    800084fc:	f5040793          	addi	a5,s0,-176
    80008500:	853e                	mv	a0,a5
    80008502:	ffffe097          	auipc	ra,0xffffe
    80008506:	c8a080e7          	jalr	-886(ra) # 8000618c <namei>
    8000850a:	fea43423          	sd	a0,-24(s0)
    8000850e:	fe843783          	ld	a5,-24(s0)
    80008512:	e799                	bnez	a5,80008520 <sys_open+0xa2>
      end_op();
    80008514:	ffffe097          	auipc	ra,0xffffe
    80008518:	09e080e7          	jalr	158(ra) # 800065b2 <end_op>
      return -1;
    8000851c:	57fd                	li	a5,-1
    8000851e:	aa71                	j	800086ba <sys_open+0x23c>
    }
    ilock(ip);
    80008520:	fe843503          	ld	a0,-24(s0)
    80008524:	ffffd097          	auipc	ra,0xffffd
    80008528:	f38080e7          	jalr	-200(ra) # 8000545c <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    8000852c:	fe843783          	ld	a5,-24(s0)
    80008530:	04479783          	lh	a5,68(a5)
    80008534:	873e                	mv	a4,a5
    80008536:	4785                	li	a5,1
    80008538:	02f71163          	bne	a4,a5,8000855a <sys_open+0xdc>
    8000853c:	f4c42783          	lw	a5,-180(s0)
    80008540:	cf89                	beqz	a5,8000855a <sys_open+0xdc>
      iunlockput(ip);
    80008542:	fe843503          	ld	a0,-24(s0)
    80008546:	ffffd097          	auipc	ra,0xffffd
    8000854a:	174080e7          	jalr	372(ra) # 800056ba <iunlockput>
      end_op();
    8000854e:	ffffe097          	auipc	ra,0xffffe
    80008552:	064080e7          	jalr	100(ra) # 800065b2 <end_op>
      return -1;
    80008556:	57fd                	li	a5,-1
    80008558:	a28d                	j	800086ba <sys_open+0x23c>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    8000855a:	fe843783          	ld	a5,-24(s0)
    8000855e:	04479783          	lh	a5,68(a5)
    80008562:	873e                	mv	a4,a5
    80008564:	478d                	li	a5,3
    80008566:	02f71c63          	bne	a4,a5,8000859e <sys_open+0x120>
    8000856a:	fe843783          	ld	a5,-24(s0)
    8000856e:	04679783          	lh	a5,70(a5)
    80008572:	0007ca63          	bltz	a5,80008586 <sys_open+0x108>
    80008576:	fe843783          	ld	a5,-24(s0)
    8000857a:	04679783          	lh	a5,70(a5)
    8000857e:	873e                	mv	a4,a5
    80008580:	47a5                	li	a5,9
    80008582:	00e7de63          	bge	a5,a4,8000859e <sys_open+0x120>
    iunlockput(ip);
    80008586:	fe843503          	ld	a0,-24(s0)
    8000858a:	ffffd097          	auipc	ra,0xffffd
    8000858e:	130080e7          	jalr	304(ra) # 800056ba <iunlockput>
    end_op();
    80008592:	ffffe097          	auipc	ra,0xffffe
    80008596:	020080e7          	jalr	32(ra) # 800065b2 <end_op>
    return -1;
    8000859a:	57fd                	li	a5,-1
    8000859c:	aa39                	j	800086ba <sys_open+0x23c>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    8000859e:	ffffe097          	auipc	ra,0xffffe
    800085a2:	502080e7          	jalr	1282(ra) # 80006aa0 <filealloc>
    800085a6:	fca43c23          	sd	a0,-40(s0)
    800085aa:	fd843783          	ld	a5,-40(s0)
    800085ae:	cf99                	beqz	a5,800085cc <sys_open+0x14e>
    800085b0:	fd843503          	ld	a0,-40(s0)
    800085b4:	fffff097          	auipc	ra,0xfffff
    800085b8:	5fc080e7          	jalr	1532(ra) # 80007bb0 <fdalloc>
    800085bc:	87aa                	mv	a5,a0
    800085be:	fcf42a23          	sw	a5,-44(s0)
    800085c2:	fd442783          	lw	a5,-44(s0)
    800085c6:	2781                	sext.w	a5,a5
    800085c8:	0207d763          	bgez	a5,800085f6 <sys_open+0x178>
    if(f)
    800085cc:	fd843783          	ld	a5,-40(s0)
    800085d0:	c799                	beqz	a5,800085de <sys_open+0x160>
      fileclose(f);
    800085d2:	fd843503          	ld	a0,-40(s0)
    800085d6:	ffffe097          	auipc	ra,0xffffe
    800085da:	5b4080e7          	jalr	1460(ra) # 80006b8a <fileclose>
    iunlockput(ip);
    800085de:	fe843503          	ld	a0,-24(s0)
    800085e2:	ffffd097          	auipc	ra,0xffffd
    800085e6:	0d8080e7          	jalr	216(ra) # 800056ba <iunlockput>
    end_op();
    800085ea:	ffffe097          	auipc	ra,0xffffe
    800085ee:	fc8080e7          	jalr	-56(ra) # 800065b2 <end_op>
    return -1;
    800085f2:	57fd                	li	a5,-1
    800085f4:	a0d9                	j	800086ba <sys_open+0x23c>
  }

  if(ip->type == T_DEVICE){
    800085f6:	fe843783          	ld	a5,-24(s0)
    800085fa:	04479783          	lh	a5,68(a5)
    800085fe:	873e                	mv	a4,a5
    80008600:	478d                	li	a5,3
    80008602:	00f71f63          	bne	a4,a5,80008620 <sys_open+0x1a2>
    f->type = FD_DEVICE;
    80008606:	fd843783          	ld	a5,-40(s0)
    8000860a:	470d                	li	a4,3
    8000860c:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    8000860e:	fe843783          	ld	a5,-24(s0)
    80008612:	04679703          	lh	a4,70(a5)
    80008616:	fd843783          	ld	a5,-40(s0)
    8000861a:	02e79223          	sh	a4,36(a5)
    8000861e:	a809                	j	80008630 <sys_open+0x1b2>
  } else {
    f->type = FD_INODE;
    80008620:	fd843783          	ld	a5,-40(s0)
    80008624:	4709                	li	a4,2
    80008626:	c398                	sw	a4,0(a5)
    f->off = 0;
    80008628:	fd843783          	ld	a5,-40(s0)
    8000862c:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    80008630:	fd843783          	ld	a5,-40(s0)
    80008634:	fe843703          	ld	a4,-24(s0)
    80008638:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    8000863a:	f4c42783          	lw	a5,-180(s0)
    8000863e:	8b85                	andi	a5,a5,1
    80008640:	2781                	sext.w	a5,a5
    80008642:	0017b793          	seqz	a5,a5
    80008646:	0ff7f793          	zext.b	a5,a5
    8000864a:	873e                	mv	a4,a5
    8000864c:	fd843783          	ld	a5,-40(s0)
    80008650:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80008654:	f4c42783          	lw	a5,-180(s0)
    80008658:	8b85                	andi	a5,a5,1
    8000865a:	2781                	sext.w	a5,a5
    8000865c:	e791                	bnez	a5,80008668 <sys_open+0x1ea>
    8000865e:	f4c42783          	lw	a5,-180(s0)
    80008662:	8b89                	andi	a5,a5,2
    80008664:	2781                	sext.w	a5,a5
    80008666:	c399                	beqz	a5,8000866c <sys_open+0x1ee>
    80008668:	4785                	li	a5,1
    8000866a:	a011                	j	8000866e <sys_open+0x1f0>
    8000866c:	4781                	li	a5,0
    8000866e:	0ff7f713          	zext.b	a4,a5
    80008672:	fd843783          	ld	a5,-40(s0)
    80008676:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    8000867a:	f4c42783          	lw	a5,-180(s0)
    8000867e:	4007f793          	andi	a5,a5,1024
    80008682:	2781                	sext.w	a5,a5
    80008684:	cf99                	beqz	a5,800086a2 <sys_open+0x224>
    80008686:	fe843783          	ld	a5,-24(s0)
    8000868a:	04479783          	lh	a5,68(a5)
    8000868e:	873e                	mv	a4,a5
    80008690:	4789                	li	a5,2
    80008692:	00f71863          	bne	a4,a5,800086a2 <sys_open+0x224>
    itrunc(ip);
    80008696:	fe843503          	ld	a0,-24(s0)
    8000869a:	ffffd097          	auipc	ra,0xffffd
    8000869e:	1ca080e7          	jalr	458(ra) # 80005864 <itrunc>
  }

  iunlock(ip);
    800086a2:	fe843503          	ld	a0,-24(s0)
    800086a6:	ffffd097          	auipc	ra,0xffffd
    800086aa:	eea080e7          	jalr	-278(ra) # 80005590 <iunlock>
  end_op();
    800086ae:	ffffe097          	auipc	ra,0xffffe
    800086b2:	f04080e7          	jalr	-252(ra) # 800065b2 <end_op>

  return fd;
    800086b6:	fd442783          	lw	a5,-44(s0)
}
    800086ba:	853e                	mv	a0,a5
    800086bc:	70ea                	ld	ra,184(sp)
    800086be:	744a                	ld	s0,176(sp)
    800086c0:	6129                	addi	sp,sp,192
    800086c2:	8082                	ret

00000000800086c4 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    800086c4:	7135                	addi	sp,sp,-160
    800086c6:	ed06                	sd	ra,152(sp)
    800086c8:	e922                	sd	s0,144(sp)
    800086ca:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800086cc:	ffffe097          	auipc	ra,0xffffe
    800086d0:	e24080e7          	jalr	-476(ra) # 800064f0 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800086d4:	f6840793          	addi	a5,s0,-152
    800086d8:	08000613          	li	a2,128
    800086dc:	85be                	mv	a1,a5
    800086de:	4501                	li	a0,0
    800086e0:	ffffc097          	auipc	ra,0xffffc
    800086e4:	d3a080e7          	jalr	-710(ra) # 8000441a <argstr>
    800086e8:	87aa                	mv	a5,a0
    800086ea:	0207c163          	bltz	a5,8000870c <sys_mkdir+0x48>
    800086ee:	f6840793          	addi	a5,s0,-152
    800086f2:	4681                	li	a3,0
    800086f4:	4601                	li	a2,0
    800086f6:	4585                	li	a1,1
    800086f8:	853e                	mv	a0,a5
    800086fa:	00000097          	auipc	ra,0x0
    800086fe:	b56080e7          	jalr	-1194(ra) # 80008250 <create>
    80008702:	fea43423          	sd	a0,-24(s0)
    80008706:	fe843783          	ld	a5,-24(s0)
    8000870a:	e799                	bnez	a5,80008718 <sys_mkdir+0x54>
    end_op();
    8000870c:	ffffe097          	auipc	ra,0xffffe
    80008710:	ea6080e7          	jalr	-346(ra) # 800065b2 <end_op>
    return -1;
    80008714:	57fd                	li	a5,-1
    80008716:	a821                	j	8000872e <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    80008718:	fe843503          	ld	a0,-24(s0)
    8000871c:	ffffd097          	auipc	ra,0xffffd
    80008720:	f9e080e7          	jalr	-98(ra) # 800056ba <iunlockput>
  end_op();
    80008724:	ffffe097          	auipc	ra,0xffffe
    80008728:	e8e080e7          	jalr	-370(ra) # 800065b2 <end_op>
  return 0;
    8000872c:	4781                	li	a5,0
}
    8000872e:	853e                	mv	a0,a5
    80008730:	60ea                	ld	ra,152(sp)
    80008732:	644a                	ld	s0,144(sp)
    80008734:	610d                	addi	sp,sp,160
    80008736:	8082                	ret

0000000080008738 <sys_mknod>:

uint64
sys_mknod(void)
{
    80008738:	7135                	addi	sp,sp,-160
    8000873a:	ed06                	sd	ra,152(sp)
    8000873c:	e922                	sd	s0,144(sp)
    8000873e:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    80008740:	ffffe097          	auipc	ra,0xffffe
    80008744:	db0080e7          	jalr	-592(ra) # 800064f0 <begin_op>
  argint(1, &major);
    80008748:	f6440793          	addi	a5,s0,-156
    8000874c:	85be                	mv	a1,a5
    8000874e:	4505                	li	a0,1
    80008750:	ffffc097          	auipc	ra,0xffffc
    80008754:	c62080e7          	jalr	-926(ra) # 800043b2 <argint>
  argint(2, &minor);
    80008758:	f6040793          	addi	a5,s0,-160
    8000875c:	85be                	mv	a1,a5
    8000875e:	4509                	li	a0,2
    80008760:	ffffc097          	auipc	ra,0xffffc
    80008764:	c52080e7          	jalr	-942(ra) # 800043b2 <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008768:	f6840793          	addi	a5,s0,-152
    8000876c:	08000613          	li	a2,128
    80008770:	85be                	mv	a1,a5
    80008772:	4501                	li	a0,0
    80008774:	ffffc097          	auipc	ra,0xffffc
    80008778:	ca6080e7          	jalr	-858(ra) # 8000441a <argstr>
    8000877c:	87aa                	mv	a5,a0
    8000877e:	0207cc63          	bltz	a5,800087b6 <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008782:	f6442783          	lw	a5,-156(s0)
    80008786:	0107971b          	slliw	a4,a5,0x10
    8000878a:	4107571b          	sraiw	a4,a4,0x10
    8000878e:	f6042783          	lw	a5,-160(s0)
    80008792:	0107969b          	slliw	a3,a5,0x10
    80008796:	4106d69b          	sraiw	a3,a3,0x10
    8000879a:	f6840793          	addi	a5,s0,-152
    8000879e:	863a                	mv	a2,a4
    800087a0:	458d                	li	a1,3
    800087a2:	853e                	mv	a0,a5
    800087a4:	00000097          	auipc	ra,0x0
    800087a8:	aac080e7          	jalr	-1364(ra) # 80008250 <create>
    800087ac:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    800087b0:	fe843783          	ld	a5,-24(s0)
    800087b4:	e799                	bnez	a5,800087c2 <sys_mknod+0x8a>
    end_op();
    800087b6:	ffffe097          	auipc	ra,0xffffe
    800087ba:	dfc080e7          	jalr	-516(ra) # 800065b2 <end_op>
    return -1;
    800087be:	57fd                	li	a5,-1
    800087c0:	a821                	j	800087d8 <sys_mknod+0xa0>
  }
  iunlockput(ip);
    800087c2:	fe843503          	ld	a0,-24(s0)
    800087c6:	ffffd097          	auipc	ra,0xffffd
    800087ca:	ef4080e7          	jalr	-268(ra) # 800056ba <iunlockput>
  end_op();
    800087ce:	ffffe097          	auipc	ra,0xffffe
    800087d2:	de4080e7          	jalr	-540(ra) # 800065b2 <end_op>
  return 0;
    800087d6:	4781                	li	a5,0
}
    800087d8:	853e                	mv	a0,a5
    800087da:	60ea                	ld	ra,152(sp)
    800087dc:	644a                	ld	s0,144(sp)
    800087de:	610d                	addi	sp,sp,160
    800087e0:	8082                	ret

00000000800087e2 <sys_chdir>:

uint64
sys_chdir(void)
{
    800087e2:	7135                	addi	sp,sp,-160
    800087e4:	ed06                	sd	ra,152(sp)
    800087e6:	e922                	sd	s0,144(sp)
    800087e8:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800087ea:	ffffa097          	auipc	ra,0xffffa
    800087ee:	314080e7          	jalr	788(ra) # 80002afe <myproc>
    800087f2:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800087f6:	ffffe097          	auipc	ra,0xffffe
    800087fa:	cfa080e7          	jalr	-774(ra) # 800064f0 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800087fe:	f6040793          	addi	a5,s0,-160
    80008802:	08000613          	li	a2,128
    80008806:	85be                	mv	a1,a5
    80008808:	4501                	li	a0,0
    8000880a:	ffffc097          	auipc	ra,0xffffc
    8000880e:	c10080e7          	jalr	-1008(ra) # 8000441a <argstr>
    80008812:	87aa                	mv	a5,a0
    80008814:	0007ce63          	bltz	a5,80008830 <sys_chdir+0x4e>
    80008818:	f6040793          	addi	a5,s0,-160
    8000881c:	853e                	mv	a0,a5
    8000881e:	ffffe097          	auipc	ra,0xffffe
    80008822:	96e080e7          	jalr	-1682(ra) # 8000618c <namei>
    80008826:	fea43023          	sd	a0,-32(s0)
    8000882a:	fe043783          	ld	a5,-32(s0)
    8000882e:	e799                	bnez	a5,8000883c <sys_chdir+0x5a>
    end_op();
    80008830:	ffffe097          	auipc	ra,0xffffe
    80008834:	d82080e7          	jalr	-638(ra) # 800065b2 <end_op>
    return -1;
    80008838:	57fd                	li	a5,-1
    8000883a:	a0ad                	j	800088a4 <sys_chdir+0xc2>
  }
  ilock(ip);
    8000883c:	fe043503          	ld	a0,-32(s0)
    80008840:	ffffd097          	auipc	ra,0xffffd
    80008844:	c1c080e7          	jalr	-996(ra) # 8000545c <ilock>
  if(ip->type != T_DIR){
    80008848:	fe043783          	ld	a5,-32(s0)
    8000884c:	04479783          	lh	a5,68(a5)
    80008850:	873e                	mv	a4,a5
    80008852:	4785                	li	a5,1
    80008854:	00f70e63          	beq	a4,a5,80008870 <sys_chdir+0x8e>
    iunlockput(ip);
    80008858:	fe043503          	ld	a0,-32(s0)
    8000885c:	ffffd097          	auipc	ra,0xffffd
    80008860:	e5e080e7          	jalr	-418(ra) # 800056ba <iunlockput>
    end_op();
    80008864:	ffffe097          	auipc	ra,0xffffe
    80008868:	d4e080e7          	jalr	-690(ra) # 800065b2 <end_op>
    return -1;
    8000886c:	57fd                	li	a5,-1
    8000886e:	a81d                	j	800088a4 <sys_chdir+0xc2>
  }
  iunlock(ip);
    80008870:	fe043503          	ld	a0,-32(s0)
    80008874:	ffffd097          	auipc	ra,0xffffd
    80008878:	d1c080e7          	jalr	-740(ra) # 80005590 <iunlock>
  iput(p->cwd);
    8000887c:	fe843783          	ld	a5,-24(s0)
    80008880:	1507b783          	ld	a5,336(a5)
    80008884:	853e                	mv	a0,a5
    80008886:	ffffd097          	auipc	ra,0xffffd
    8000888a:	d64080e7          	jalr	-668(ra) # 800055ea <iput>
  end_op();
    8000888e:	ffffe097          	auipc	ra,0xffffe
    80008892:	d24080e7          	jalr	-732(ra) # 800065b2 <end_op>
  p->cwd = ip;
    80008896:	fe843783          	ld	a5,-24(s0)
    8000889a:	fe043703          	ld	a4,-32(s0)
    8000889e:	14e7b823          	sd	a4,336(a5)
  return 0;
    800088a2:	4781                	li	a5,0
}
    800088a4:	853e                	mv	a0,a5
    800088a6:	60ea                	ld	ra,152(sp)
    800088a8:	644a                	ld	s0,144(sp)
    800088aa:	610d                	addi	sp,sp,160
    800088ac:	8082                	ret

00000000800088ae <sys_exec>:

uint64
sys_exec(void)
{
    800088ae:	7161                	addi	sp,sp,-432
    800088b0:	f706                	sd	ra,424(sp)
    800088b2:	f322                	sd	s0,416(sp)
    800088b4:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    800088b6:	e6040793          	addi	a5,s0,-416
    800088ba:	85be                	mv	a1,a5
    800088bc:	4505                	li	a0,1
    800088be:	ffffc097          	auipc	ra,0xffffc
    800088c2:	b2a080e7          	jalr	-1238(ra) # 800043e8 <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    800088c6:	f6840793          	addi	a5,s0,-152
    800088ca:	08000613          	li	a2,128
    800088ce:	85be                	mv	a1,a5
    800088d0:	4501                	li	a0,0
    800088d2:	ffffc097          	auipc	ra,0xffffc
    800088d6:	b48080e7          	jalr	-1208(ra) # 8000441a <argstr>
    800088da:	87aa                	mv	a5,a0
    800088dc:	0007d463          	bgez	a5,800088e4 <sys_exec+0x36>
    return -1;
    800088e0:	57fd                	li	a5,-1
    800088e2:	aa8d                	j	80008a54 <sys_exec+0x1a6>
  }
  memset(argv, 0, sizeof(argv));
    800088e4:	e6840793          	addi	a5,s0,-408
    800088e8:	10000613          	li	a2,256
    800088ec:	4581                	li	a1,0
    800088ee:	853e                	mv	a0,a5
    800088f0:	ffff9097          	auipc	ra,0xffff9
    800088f4:	c14080e7          	jalr	-1004(ra) # 80001504 <memset>
  for(i=0;; i++){
    800088f8:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    800088fc:	fec42783          	lw	a5,-20(s0)
    80008900:	873e                	mv	a4,a5
    80008902:	47fd                	li	a5,31
    80008904:	0ee7ee63          	bltu	a5,a4,80008a00 <sys_exec+0x152>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80008908:	fec42783          	lw	a5,-20(s0)
    8000890c:	00379713          	slli	a4,a5,0x3
    80008910:	e6043783          	ld	a5,-416(s0)
    80008914:	97ba                	add	a5,a5,a4
    80008916:	e5840713          	addi	a4,s0,-424
    8000891a:	85ba                	mv	a1,a4
    8000891c:	853e                	mv	a0,a5
    8000891e:	ffffc097          	auipc	ra,0xffffc
    80008922:	922080e7          	jalr	-1758(ra) # 80004240 <fetchaddr>
    80008926:	87aa                	mv	a5,a0
    80008928:	0c07ce63          	bltz	a5,80008a04 <sys_exec+0x156>
      goto bad;
    }
    if(uarg == 0){
    8000892c:	e5843783          	ld	a5,-424(s0)
    80008930:	eb8d                	bnez	a5,80008962 <sys_exec+0xb4>
      argv[i] = 0;
    80008932:	fec42783          	lw	a5,-20(s0)
    80008936:	078e                	slli	a5,a5,0x3
    80008938:	17c1                	addi	a5,a5,-16
    8000893a:	97a2                	add	a5,a5,s0
    8000893c:	e607bc23          	sd	zero,-392(a5)
      break;
    80008940:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80008942:	e6840713          	addi	a4,s0,-408
    80008946:	f6840793          	addi	a5,s0,-152
    8000894a:	85ba                	mv	a1,a4
    8000894c:	853e                	mv	a0,a5
    8000894e:	fffff097          	auipc	ra,0xfffff
    80008952:	c34080e7          	jalr	-972(ra) # 80007582 <exec>
    80008956:	87aa                	mv	a5,a0
    80008958:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000895c:	fe042623          	sw	zero,-20(s0)
    80008960:	a8bd                	j	800089de <sys_exec+0x130>
    argv[i] = kalloc();
    80008962:	ffff9097          	auipc	ra,0xffff9
    80008966:	87a080e7          	jalr	-1926(ra) # 800011dc <kalloc>
    8000896a:	872a                	mv	a4,a0
    8000896c:	fec42783          	lw	a5,-20(s0)
    80008970:	078e                	slli	a5,a5,0x3
    80008972:	17c1                	addi	a5,a5,-16
    80008974:	97a2                	add	a5,a5,s0
    80008976:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    8000897a:	fec42783          	lw	a5,-20(s0)
    8000897e:	078e                	slli	a5,a5,0x3
    80008980:	17c1                	addi	a5,a5,-16
    80008982:	97a2                	add	a5,a5,s0
    80008984:	e787b783          	ld	a5,-392(a5)
    80008988:	c3c1                	beqz	a5,80008a08 <sys_exec+0x15a>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8000898a:	e5843703          	ld	a4,-424(s0)
    8000898e:	fec42783          	lw	a5,-20(s0)
    80008992:	078e                	slli	a5,a5,0x3
    80008994:	17c1                	addi	a5,a5,-16
    80008996:	97a2                	add	a5,a5,s0
    80008998:	e787b783          	ld	a5,-392(a5)
    8000899c:	6605                	lui	a2,0x1
    8000899e:	85be                	mv	a1,a5
    800089a0:	853a                	mv	a0,a4
    800089a2:	ffffc097          	auipc	ra,0xffffc
    800089a6:	90c080e7          	jalr	-1780(ra) # 800042ae <fetchstr>
    800089aa:	87aa                	mv	a5,a0
    800089ac:	0607c063          	bltz	a5,80008a0c <sys_exec+0x15e>
  for(i=0;; i++){
    800089b0:	fec42783          	lw	a5,-20(s0)
    800089b4:	2785                	addiw	a5,a5,1
    800089b6:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    800089ba:	b789                	j	800088fc <sys_exec+0x4e>
    kfree(argv[i]);
    800089bc:	fec42783          	lw	a5,-20(s0)
    800089c0:	078e                	slli	a5,a5,0x3
    800089c2:	17c1                	addi	a5,a5,-16
    800089c4:	97a2                	add	a5,a5,s0
    800089c6:	e787b783          	ld	a5,-392(a5)
    800089ca:	853e                	mv	a0,a5
    800089cc:	ffff8097          	auipc	ra,0xffff8
    800089d0:	76a080e7          	jalr	1898(ra) # 80001136 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800089d4:	fec42783          	lw	a5,-20(s0)
    800089d8:	2785                	addiw	a5,a5,1
    800089da:	fef42623          	sw	a5,-20(s0)
    800089de:	fec42783          	lw	a5,-20(s0)
    800089e2:	873e                	mv	a4,a5
    800089e4:	47fd                	li	a5,31
    800089e6:	00e7ea63          	bltu	a5,a4,800089fa <sys_exec+0x14c>
    800089ea:	fec42783          	lw	a5,-20(s0)
    800089ee:	078e                	slli	a5,a5,0x3
    800089f0:	17c1                	addi	a5,a5,-16
    800089f2:	97a2                	add	a5,a5,s0
    800089f4:	e787b783          	ld	a5,-392(a5)
    800089f8:	f3f1                	bnez	a5,800089bc <sys_exec+0x10e>

  return ret;
    800089fa:	fe842783          	lw	a5,-24(s0)
    800089fe:	a899                	j	80008a54 <sys_exec+0x1a6>
      goto bad;
    80008a00:	0001                	nop
    80008a02:	a031                	j	80008a0e <sys_exec+0x160>
      goto bad;
    80008a04:	0001                	nop
    80008a06:	a021                	j	80008a0e <sys_exec+0x160>
      goto bad;
    80008a08:	0001                	nop
    80008a0a:	a011                	j	80008a0e <sys_exec+0x160>
      goto bad;
    80008a0c:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008a0e:	fe042623          	sw	zero,-20(s0)
    80008a12:	a015                	j	80008a36 <sys_exec+0x188>
    kfree(argv[i]);
    80008a14:	fec42783          	lw	a5,-20(s0)
    80008a18:	078e                	slli	a5,a5,0x3
    80008a1a:	17c1                	addi	a5,a5,-16
    80008a1c:	97a2                	add	a5,a5,s0
    80008a1e:	e787b783          	ld	a5,-392(a5)
    80008a22:	853e                	mv	a0,a5
    80008a24:	ffff8097          	auipc	ra,0xffff8
    80008a28:	712080e7          	jalr	1810(ra) # 80001136 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008a2c:	fec42783          	lw	a5,-20(s0)
    80008a30:	2785                	addiw	a5,a5,1
    80008a32:	fef42623          	sw	a5,-20(s0)
    80008a36:	fec42783          	lw	a5,-20(s0)
    80008a3a:	873e                	mv	a4,a5
    80008a3c:	47fd                	li	a5,31
    80008a3e:	00e7ea63          	bltu	a5,a4,80008a52 <sys_exec+0x1a4>
    80008a42:	fec42783          	lw	a5,-20(s0)
    80008a46:	078e                	slli	a5,a5,0x3
    80008a48:	17c1                	addi	a5,a5,-16
    80008a4a:	97a2                	add	a5,a5,s0
    80008a4c:	e787b783          	ld	a5,-392(a5)
    80008a50:	f3f1                	bnez	a5,80008a14 <sys_exec+0x166>
  return -1;
    80008a52:	57fd                	li	a5,-1
}
    80008a54:	853e                	mv	a0,a5
    80008a56:	70ba                	ld	ra,424(sp)
    80008a58:	741a                	ld	s0,416(sp)
    80008a5a:	615d                	addi	sp,sp,432
    80008a5c:	8082                	ret

0000000080008a5e <sys_pipe>:

uint64
sys_pipe(void)
{
    80008a5e:	7139                	addi	sp,sp,-64
    80008a60:	fc06                	sd	ra,56(sp)
    80008a62:	f822                	sd	s0,48(sp)
    80008a64:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008a66:	ffffa097          	auipc	ra,0xffffa
    80008a6a:	098080e7          	jalr	152(ra) # 80002afe <myproc>
    80008a6e:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    80008a72:	fe040793          	addi	a5,s0,-32
    80008a76:	85be                	mv	a1,a5
    80008a78:	4501                	li	a0,0
    80008a7a:	ffffc097          	auipc	ra,0xffffc
    80008a7e:	96e080e7          	jalr	-1682(ra) # 800043e8 <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    80008a82:	fd040713          	addi	a4,s0,-48
    80008a86:	fd840793          	addi	a5,s0,-40
    80008a8a:	85ba                	mv	a1,a4
    80008a8c:	853e                	mv	a0,a5
    80008a8e:	ffffe097          	auipc	ra,0xffffe
    80008a92:	60e080e7          	jalr	1550(ra) # 8000709c <pipealloc>
    80008a96:	87aa                	mv	a5,a0
    80008a98:	0007d463          	bgez	a5,80008aa0 <sys_pipe+0x42>
    return -1;
    80008a9c:	57fd                	li	a5,-1
    80008a9e:	a219                	j	80008ba4 <sys_pipe+0x146>
  fd0 = -1;
    80008aa0:	57fd                	li	a5,-1
    80008aa2:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008aa6:	fd843783          	ld	a5,-40(s0)
    80008aaa:	853e                	mv	a0,a5
    80008aac:	fffff097          	auipc	ra,0xfffff
    80008ab0:	104080e7          	jalr	260(ra) # 80007bb0 <fdalloc>
    80008ab4:	87aa                	mv	a5,a0
    80008ab6:	fcf42623          	sw	a5,-52(s0)
    80008aba:	fcc42783          	lw	a5,-52(s0)
    80008abe:	0207c063          	bltz	a5,80008ade <sys_pipe+0x80>
    80008ac2:	fd043783          	ld	a5,-48(s0)
    80008ac6:	853e                	mv	a0,a5
    80008ac8:	fffff097          	auipc	ra,0xfffff
    80008acc:	0e8080e7          	jalr	232(ra) # 80007bb0 <fdalloc>
    80008ad0:	87aa                	mv	a5,a0
    80008ad2:	fcf42423          	sw	a5,-56(s0)
    80008ad6:	fc842783          	lw	a5,-56(s0)
    80008ada:	0207df63          	bgez	a5,80008b18 <sys_pipe+0xba>
    if(fd0 >= 0)
    80008ade:	fcc42783          	lw	a5,-52(s0)
    80008ae2:	0007cb63          	bltz	a5,80008af8 <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    80008ae6:	fcc42783          	lw	a5,-52(s0)
    80008aea:	fe843703          	ld	a4,-24(s0)
    80008aee:	07e9                	addi	a5,a5,26
    80008af0:	078e                	slli	a5,a5,0x3
    80008af2:	97ba                	add	a5,a5,a4
    80008af4:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008af8:	fd843783          	ld	a5,-40(s0)
    80008afc:	853e                	mv	a0,a5
    80008afe:	ffffe097          	auipc	ra,0xffffe
    80008b02:	08c080e7          	jalr	140(ra) # 80006b8a <fileclose>
    fileclose(wf);
    80008b06:	fd043783          	ld	a5,-48(s0)
    80008b0a:	853e                	mv	a0,a5
    80008b0c:	ffffe097          	auipc	ra,0xffffe
    80008b10:	07e080e7          	jalr	126(ra) # 80006b8a <fileclose>
    return -1;
    80008b14:	57fd                	li	a5,-1
    80008b16:	a079                	j	80008ba4 <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008b18:	fe843783          	ld	a5,-24(s0)
    80008b1c:	6bbc                	ld	a5,80(a5)
    80008b1e:	fe043703          	ld	a4,-32(s0)
    80008b22:	fcc40613          	addi	a2,s0,-52
    80008b26:	4691                	li	a3,4
    80008b28:	85ba                	mv	a1,a4
    80008b2a:	853e                	mv	a0,a5
    80008b2c:	ffffa097          	auipc	ra,0xffffa
    80008b30:	a9c080e7          	jalr	-1380(ra) # 800025c8 <copyout>
    80008b34:	87aa                	mv	a5,a0
    80008b36:	0207c463          	bltz	a5,80008b5e <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008b3a:	fe843783          	ld	a5,-24(s0)
    80008b3e:	6bb8                	ld	a4,80(a5)
    80008b40:	fe043783          	ld	a5,-32(s0)
    80008b44:	0791                	addi	a5,a5,4
    80008b46:	fc840613          	addi	a2,s0,-56
    80008b4a:	4691                	li	a3,4
    80008b4c:	85be                	mv	a1,a5
    80008b4e:	853a                	mv	a0,a4
    80008b50:	ffffa097          	auipc	ra,0xffffa
    80008b54:	a78080e7          	jalr	-1416(ra) # 800025c8 <copyout>
    80008b58:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008b5a:	0407d463          	bgez	a5,80008ba2 <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    80008b5e:	fcc42783          	lw	a5,-52(s0)
    80008b62:	fe843703          	ld	a4,-24(s0)
    80008b66:	07e9                	addi	a5,a5,26
    80008b68:	078e                	slli	a5,a5,0x3
    80008b6a:	97ba                	add	a5,a5,a4
    80008b6c:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008b70:	fc842783          	lw	a5,-56(s0)
    80008b74:	fe843703          	ld	a4,-24(s0)
    80008b78:	07e9                	addi	a5,a5,26
    80008b7a:	078e                	slli	a5,a5,0x3
    80008b7c:	97ba                	add	a5,a5,a4
    80008b7e:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008b82:	fd843783          	ld	a5,-40(s0)
    80008b86:	853e                	mv	a0,a5
    80008b88:	ffffe097          	auipc	ra,0xffffe
    80008b8c:	002080e7          	jalr	2(ra) # 80006b8a <fileclose>
    fileclose(wf);
    80008b90:	fd043783          	ld	a5,-48(s0)
    80008b94:	853e                	mv	a0,a5
    80008b96:	ffffe097          	auipc	ra,0xffffe
    80008b9a:	ff4080e7          	jalr	-12(ra) # 80006b8a <fileclose>
    return -1;
    80008b9e:	57fd                	li	a5,-1
    80008ba0:	a011                	j	80008ba4 <sys_pipe+0x146>
  }
  return 0;
    80008ba2:	4781                	li	a5,0
}
    80008ba4:	853e                	mv	a0,a5
    80008ba6:	70e2                	ld	ra,56(sp)
    80008ba8:	7442                	ld	s0,48(sp)
    80008baa:	6121                	addi	sp,sp,64
    80008bac:	8082                	ret
	...

0000000080008bb0 <kernelvec>:
    80008bb0:	7111                	addi	sp,sp,-256
    80008bb2:	e006                	sd	ra,0(sp)
    80008bb4:	e40a                	sd	sp,8(sp)
    80008bb6:	e80e                	sd	gp,16(sp)
    80008bb8:	ec12                	sd	tp,24(sp)
    80008bba:	f016                	sd	t0,32(sp)
    80008bbc:	f41a                	sd	t1,40(sp)
    80008bbe:	f81e                	sd	t2,48(sp)
    80008bc0:	fc22                	sd	s0,56(sp)
    80008bc2:	e0a6                	sd	s1,64(sp)
    80008bc4:	e4aa                	sd	a0,72(sp)
    80008bc6:	e8ae                	sd	a1,80(sp)
    80008bc8:	ecb2                	sd	a2,88(sp)
    80008bca:	f0b6                	sd	a3,96(sp)
    80008bcc:	f4ba                	sd	a4,104(sp)
    80008bce:	f8be                	sd	a5,112(sp)
    80008bd0:	fcc2                	sd	a6,120(sp)
    80008bd2:	e146                	sd	a7,128(sp)
    80008bd4:	e54a                	sd	s2,136(sp)
    80008bd6:	e94e                	sd	s3,144(sp)
    80008bd8:	ed52                	sd	s4,152(sp)
    80008bda:	f156                	sd	s5,160(sp)
    80008bdc:	f55a                	sd	s6,168(sp)
    80008bde:	f95e                	sd	s7,176(sp)
    80008be0:	fd62                	sd	s8,184(sp)
    80008be2:	e1e6                	sd	s9,192(sp)
    80008be4:	e5ea                	sd	s10,200(sp)
    80008be6:	e9ee                	sd	s11,208(sp)
    80008be8:	edf2                	sd	t3,216(sp)
    80008bea:	f1f6                	sd	t4,224(sp)
    80008bec:	f5fa                	sd	t5,232(sp)
    80008bee:	f9fe                	sd	t6,240(sp)
    80008bf0:	bb6fb0ef          	jal	80003fa6 <kerneltrap>
    80008bf4:	6082                	ld	ra,0(sp)
    80008bf6:	6122                	ld	sp,8(sp)
    80008bf8:	61c2                	ld	gp,16(sp)
    80008bfa:	7282                	ld	t0,32(sp)
    80008bfc:	7322                	ld	t1,40(sp)
    80008bfe:	73c2                	ld	t2,48(sp)
    80008c00:	7462                	ld	s0,56(sp)
    80008c02:	6486                	ld	s1,64(sp)
    80008c04:	6526                	ld	a0,72(sp)
    80008c06:	65c6                	ld	a1,80(sp)
    80008c08:	6666                	ld	a2,88(sp)
    80008c0a:	7686                	ld	a3,96(sp)
    80008c0c:	7726                	ld	a4,104(sp)
    80008c0e:	77c6                	ld	a5,112(sp)
    80008c10:	7866                	ld	a6,120(sp)
    80008c12:	688a                	ld	a7,128(sp)
    80008c14:	692a                	ld	s2,136(sp)
    80008c16:	69ca                	ld	s3,144(sp)
    80008c18:	6a6a                	ld	s4,152(sp)
    80008c1a:	7a8a                	ld	s5,160(sp)
    80008c1c:	7b2a                	ld	s6,168(sp)
    80008c1e:	7bca                	ld	s7,176(sp)
    80008c20:	7c6a                	ld	s8,184(sp)
    80008c22:	6c8e                	ld	s9,192(sp)
    80008c24:	6d2e                	ld	s10,200(sp)
    80008c26:	6dce                	ld	s11,208(sp)
    80008c28:	6e6e                	ld	t3,216(sp)
    80008c2a:	7e8e                	ld	t4,224(sp)
    80008c2c:	7f2e                	ld	t5,232(sp)
    80008c2e:	7fce                	ld	t6,240(sp)
    80008c30:	6111                	addi	sp,sp,256
    80008c32:	10200073          	sret
    80008c36:	00000013          	nop
    80008c3a:	00000013          	nop
    80008c3e:	0001                	nop

0000000080008c40 <timervec>:
    80008c40:	34051573          	csrrw	a0,mscratch,a0
    80008c44:	e10c                	sd	a1,0(a0)
    80008c46:	e510                	sd	a2,8(a0)
    80008c48:	e914                	sd	a3,16(a0)
    80008c4a:	6d0c                	ld	a1,24(a0)
    80008c4c:	7110                	ld	a2,32(a0)
    80008c4e:	6194                	ld	a3,0(a1)
    80008c50:	96b2                	add	a3,a3,a2
    80008c52:	e194                	sd	a3,0(a1)
    80008c54:	4589                	li	a1,2
    80008c56:	14459073          	csrw	sip,a1
    80008c5a:	6914                	ld	a3,16(a0)
    80008c5c:	6510                	ld	a2,8(a0)
    80008c5e:	610c                	ld	a1,0(a0)
    80008c60:	34051573          	csrrw	a0,mscratch,a0
    80008c64:	30200073          	mret
	...

0000000080008c6a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008c6a:	1101                	addi	sp,sp,-32
    80008c6c:	ec22                	sd	s0,24(sp)
    80008c6e:	1000                	addi	s0,sp,32
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008c70:	0c0007b7          	lui	a5,0xc000
    80008c74:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008c78:	4705                	li	a4,1
    80008c7a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008c7c:	0c0007b7          	lui	a5,0xc000
    80008c80:	0791                	addi	a5,a5,4 # c000004 <_entry-0x73fffffc>
    80008c82:	4705                	li	a4,1
    80008c84:	c398                	sw	a4,0(a5)

  for (int i = VIRTIO_RAID_DISK_START; i <= VIRTIO_RAID_DISK_END; i++) {
    80008c86:	4785                	li	a5,1
    80008c88:	fef42623          	sw	a5,-20(s0)
    80008c8c:	a025                	j	80008cb4 <plicinit+0x4a>
    *(uint32*)(PLIC + VIRTIOX_IRQ(i)*4) = 1;
    80008c8e:	fec42783          	lw	a5,-20(s0)
    80008c92:	2785                	addiw	a5,a5,1
    80008c94:	2781                	sext.w	a5,a5
    80008c96:	0027979b          	slliw	a5,a5,0x2
    80008c9a:	2781                	sext.w	a5,a5
    80008c9c:	873e                	mv	a4,a5
    80008c9e:	0c0007b7          	lui	a5,0xc000
    80008ca2:	97ba                	add	a5,a5,a4
    80008ca4:	873e                	mv	a4,a5
    80008ca6:	4785                	li	a5,1
    80008ca8:	c31c                	sw	a5,0(a4)
  for (int i = VIRTIO_RAID_DISK_START; i <= VIRTIO_RAID_DISK_END; i++) {
    80008caa:	fec42783          	lw	a5,-20(s0)
    80008cae:	2785                	addiw	a5,a5,1 # c000001 <_entry-0x73ffffff>
    80008cb0:	fef42623          	sw	a5,-20(s0)
    80008cb4:	fec42783          	lw	a5,-20(s0)
    80008cb8:	0007871b          	sext.w	a4,a5
    80008cbc:	4789                	li	a5,2
    80008cbe:	fce7d8e3          	bge	a5,a4,80008c8e <plicinit+0x24>
  }
}
    80008cc2:	0001                	nop
    80008cc4:	0001                	nop
    80008cc6:	6462                	ld	s0,24(sp)
    80008cc8:	6105                	addi	sp,sp,32
    80008cca:	8082                	ret

0000000080008ccc <plicinithart>:

void
plicinithart(void)
{
    80008ccc:	1101                	addi	sp,sp,-32
    80008cce:	ec06                	sd	ra,24(sp)
    80008cd0:	e822                	sd	s0,16(sp)
    80008cd2:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008cd4:	ffffa097          	auipc	ra,0xffffa
    80008cd8:	dcc080e7          	jalr	-564(ra) # 80002aa0 <cpuid>
    80008cdc:	87aa                	mv	a5,a0
    80008cde:	fef42223          	sw	a5,-28(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  uint32 enable_bits = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80008ce2:	40200793          	li	a5,1026
    80008ce6:	fef42623          	sw	a5,-20(s0)
  for (int i = VIRTIO_RAID_DISK_START; i <= VIRTIO_RAID_DISK_END; i++) {
    80008cea:	4785                	li	a5,1
    80008cec:	fef42423          	sw	a5,-24(s0)
    80008cf0:	a025                	j	80008d18 <plicinithart+0x4c>
    enable_bits |= (1 << VIRTIOX_IRQ(i));
    80008cf2:	fe842783          	lw	a5,-24(s0)
    80008cf6:	2785                	addiw	a5,a5,1
    80008cf8:	2781                	sext.w	a5,a5
    80008cfa:	4705                	li	a4,1
    80008cfc:	00f717bb          	sllw	a5,a4,a5
    80008d00:	2781                	sext.w	a5,a5
    80008d02:	2781                	sext.w	a5,a5
    80008d04:	fec42703          	lw	a4,-20(s0)
    80008d08:	8fd9                	or	a5,a5,a4
    80008d0a:	fef42623          	sw	a5,-20(s0)
  for (int i = VIRTIO_RAID_DISK_START; i <= VIRTIO_RAID_DISK_END; i++) {
    80008d0e:	fe842783          	lw	a5,-24(s0)
    80008d12:	2785                	addiw	a5,a5,1
    80008d14:	fef42423          	sw	a5,-24(s0)
    80008d18:	fe842783          	lw	a5,-24(s0)
    80008d1c:	0007871b          	sext.w	a4,a5
    80008d20:	4789                	li	a5,2
    80008d22:	fce7d8e3          	bge	a5,a4,80008cf2 <plicinithart+0x26>
  }

  *(uint32*)PLIC_SENABLE(hart) = enable_bits;
    80008d26:	fe442783          	lw	a5,-28(s0)
    80008d2a:	0087979b          	slliw	a5,a5,0x8
    80008d2e:	2781                	sext.w	a5,a5
    80008d30:	873e                	mv	a4,a5
    80008d32:	0c0027b7          	lui	a5,0xc002
    80008d36:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008d3a:	97ba                	add	a5,a5,a4
    80008d3c:	873e                	mv	a4,a5
    80008d3e:	fec42783          	lw	a5,-20(s0)
    80008d42:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008d44:	fe442783          	lw	a5,-28(s0)
    80008d48:	00d7979b          	slliw	a5,a5,0xd
    80008d4c:	2781                	sext.w	a5,a5
    80008d4e:	873e                	mv	a4,a5
    80008d50:	0c2017b7          	lui	a5,0xc201
    80008d54:	97ba                	add	a5,a5,a4
    80008d56:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008d5a:	0001                	nop
    80008d5c:	60e2                	ld	ra,24(sp)
    80008d5e:	6442                	ld	s0,16(sp)
    80008d60:	6105                	addi	sp,sp,32
    80008d62:	8082                	ret

0000000080008d64 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008d64:	1101                	addi	sp,sp,-32
    80008d66:	ec06                	sd	ra,24(sp)
    80008d68:	e822                	sd	s0,16(sp)
    80008d6a:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008d6c:	ffffa097          	auipc	ra,0xffffa
    80008d70:	d34080e7          	jalr	-716(ra) # 80002aa0 <cpuid>
    80008d74:	87aa                	mv	a5,a0
    80008d76:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008d7a:	fec42783          	lw	a5,-20(s0)
    80008d7e:	00d7979b          	slliw	a5,a5,0xd
    80008d82:	2781                	sext.w	a5,a5
    80008d84:	873e                	mv	a4,a5
    80008d86:	0c2017b7          	lui	a5,0xc201
    80008d8a:	0791                	addi	a5,a5,4 # c201004 <_entry-0x73dfeffc>
    80008d8c:	97ba                	add	a5,a5,a4
    80008d8e:	439c                	lw	a5,0(a5)
    80008d90:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008d94:	fe842783          	lw	a5,-24(s0)
}
    80008d98:	853e                	mv	a0,a5
    80008d9a:	60e2                	ld	ra,24(sp)
    80008d9c:	6442                	ld	s0,16(sp)
    80008d9e:	6105                	addi	sp,sp,32
    80008da0:	8082                	ret

0000000080008da2 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008da2:	7179                	addi	sp,sp,-48
    80008da4:	f406                	sd	ra,40(sp)
    80008da6:	f022                	sd	s0,32(sp)
    80008da8:	1800                	addi	s0,sp,48
    80008daa:	87aa                	mv	a5,a0
    80008dac:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008db0:	ffffa097          	auipc	ra,0xffffa
    80008db4:	cf0080e7          	jalr	-784(ra) # 80002aa0 <cpuid>
    80008db8:	87aa                	mv	a5,a0
    80008dba:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008dbe:	fec42783          	lw	a5,-20(s0)
    80008dc2:	00d7979b          	slliw	a5,a5,0xd
    80008dc6:	2781                	sext.w	a5,a5
    80008dc8:	873e                	mv	a4,a5
    80008dca:	0c2017b7          	lui	a5,0xc201
    80008dce:	0791                	addi	a5,a5,4 # c201004 <_entry-0x73dfeffc>
    80008dd0:	97ba                	add	a5,a5,a4
    80008dd2:	873e                	mv	a4,a5
    80008dd4:	fdc42783          	lw	a5,-36(s0)
    80008dd8:	c31c                	sw	a5,0(a4)
}
    80008dda:	0001                	nop
    80008ddc:	70a2                	ld	ra,40(sp)
    80008dde:	7402                	ld	s0,32(sp)
    80008de0:	6145                	addi	sp,sp,48
    80008de2:	8082                	ret

0000000080008de4 <virtio_disk_init>:

static struct buf* transfer_buffer[VIRTIO_RAID_DISK_END + 1];

void
virtio_disk_init(int id, char * name)
{
    80008de4:	7139                	addi	sp,sp,-64
    80008de6:	fc06                	sd	ra,56(sp)
    80008de8:	f822                	sd	s0,48(sp)
    80008dea:	0080                	addi	s0,sp,64
    80008dec:	87aa                	mv	a5,a0
    80008dee:	fcb43023          	sd	a1,-64(s0)
    80008df2:	fcf42623          	sw	a5,-52(s0)
//    printf("\n virtuo_disk_init \n");
  uint32 status = 0;
    80008df6:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    80008dfa:	fcc42703          	lw	a4,-52(s0)
    80008dfe:	25000793          	li	a5,592
    80008e02:	02f707b3          	mul	a5,a4,a5
    80008e06:	23078713          	addi	a4,a5,560
    80008e0a:	0001e797          	auipc	a5,0x1e
    80008e0e:	52e78793          	addi	a5,a5,1326 # 80027338 <disk>
    80008e12:	97ba                	add	a5,a5,a4
    80008e14:	07a1                	addi	a5,a5,8
    80008e16:	fc043583          	ld	a1,-64(s0)
    80008e1a:	853e                	mv	a0,a5
    80008e1c:	ffff8097          	auipc	ra,0xffff8
    80008e20:	4e4080e7          	jalr	1252(ra) # 80001300 <initlock>
  disk[id].name = name;
    80008e24:	0001e717          	auipc	a4,0x1e
    80008e28:	51470713          	addi	a4,a4,1300 # 80027338 <disk>
    80008e2c:	fcc42683          	lw	a3,-52(s0)
    80008e30:	25000793          	li	a5,592
    80008e34:	02f687b3          	mul	a5,a3,a5
    80008e38:	97ba                	add	a5,a5,a4
    80008e3a:	fc043703          	ld	a4,-64(s0)
    80008e3e:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008e40:	fcc42703          	lw	a4,-52(s0)
    80008e44:	67c1                	lui	a5,0x10
    80008e46:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008e48:	97ba                	add	a5,a5,a4
    80008e4a:	07b2                	slli	a5,a5,0xc
    80008e4c:	439c                	lw	a5,0(a5)
    80008e4e:	2781                	sext.w	a5,a5
    80008e50:	873e                	mv	a4,a5
    80008e52:	747277b7          	lui	a5,0x74727
    80008e56:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008e5a:	04f71c63          	bne	a4,a5,80008eb2 <virtio_disk_init+0xce>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008e5e:	fcc42703          	lw	a4,-52(s0)
    80008e62:	67c1                	lui	a5,0x10
    80008e64:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008e66:	97ba                	add	a5,a5,a4
    80008e68:	07b2                	slli	a5,a5,0xc
    80008e6a:	0791                	addi	a5,a5,4
    80008e6c:	439c                	lw	a5,0(a5)
    80008e6e:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008e70:	873e                	mv	a4,a5
    80008e72:	4789                	li	a5,2
    80008e74:	02f71f63          	bne	a4,a5,80008eb2 <virtio_disk_init+0xce>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008e78:	fcc42703          	lw	a4,-52(s0)
    80008e7c:	67c1                	lui	a5,0x10
    80008e7e:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008e80:	97ba                	add	a5,a5,a4
    80008e82:	07b2                	slli	a5,a5,0xc
    80008e84:	07a1                	addi	a5,a5,8
    80008e86:	439c                	lw	a5,0(a5)
    80008e88:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008e8a:	873e                	mv	a4,a5
    80008e8c:	4789                	li	a5,2
    80008e8e:	02f71263          	bne	a4,a5,80008eb2 <virtio_disk_init+0xce>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008e92:	fcc42703          	lw	a4,-52(s0)
    80008e96:	67c1                	lui	a5,0x10
    80008e98:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008e9a:	97ba                	add	a5,a5,a4
    80008e9c:	07b2                	slli	a5,a5,0xc
    80008e9e:	07b1                	addi	a5,a5,12
    80008ea0:	439c                	lw	a5,0(a5)
    80008ea2:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008ea4:	873e                	mv	a4,a5
    80008ea6:	554d47b7          	lui	a5,0x554d4
    80008eaa:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008eae:	00f70d63          	beq	a4,a5,80008ec8 <virtio_disk_init+0xe4>
    panic_concat(2, "could not find virtio disk: ", name);
    80008eb2:	fc043603          	ld	a2,-64(s0)
    80008eb6:	00002597          	auipc	a1,0x2
    80008eba:	7ba58593          	addi	a1,a1,1978 # 8000b670 <etext+0x670>
    80008ebe:	4509                	li	a0,2
    80008ec0:	ffff8097          	auipc	ra,0xffff8
    80008ec4:	e1c080e7          	jalr	-484(ra) # 80000cdc <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008ec8:	fcc42703          	lw	a4,-52(s0)
    80008ecc:	67c1                	lui	a5,0x10
    80008ece:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008ed0:	97ba                	add	a5,a5,a4
    80008ed2:	07b2                	slli	a5,a5,0xc
    80008ed4:	07078793          	addi	a5,a5,112
    80008ed8:	873e                	mv	a4,a5
    80008eda:	fe842783          	lw	a5,-24(s0)
    80008ede:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008ee0:	fe842783          	lw	a5,-24(s0)
    80008ee4:	0017e793          	ori	a5,a5,1
    80008ee8:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008eec:	fcc42703          	lw	a4,-52(s0)
    80008ef0:	67c1                	lui	a5,0x10
    80008ef2:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008ef4:	97ba                	add	a5,a5,a4
    80008ef6:	07b2                	slli	a5,a5,0xc
    80008ef8:	07078793          	addi	a5,a5,112
    80008efc:	873e                	mv	a4,a5
    80008efe:	fe842783          	lw	a5,-24(s0)
    80008f02:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008f04:	fe842783          	lw	a5,-24(s0)
    80008f08:	0027e793          	ori	a5,a5,2
    80008f0c:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008f10:	fcc42703          	lw	a4,-52(s0)
    80008f14:	67c1                	lui	a5,0x10
    80008f16:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008f18:	97ba                	add	a5,a5,a4
    80008f1a:	07b2                	slli	a5,a5,0xc
    80008f1c:	07078793          	addi	a5,a5,112
    80008f20:	873e                	mv	a4,a5
    80008f22:	fe842783          	lw	a5,-24(s0)
    80008f26:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    80008f28:	fcc42703          	lw	a4,-52(s0)
    80008f2c:	67c1                	lui	a5,0x10
    80008f2e:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008f30:	97ba                	add	a5,a5,a4
    80008f32:	07b2                	slli	a5,a5,0xc
    80008f34:	07c1                	addi	a5,a5,16
    80008f36:	439c                	lw	a5,0(a5)
    80008f38:	2781                	sext.w	a5,a5
    80008f3a:	1782                	slli	a5,a5,0x20
    80008f3c:	9381                	srli	a5,a5,0x20
    80008f3e:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008f42:	fe043783          	ld	a5,-32(s0)
    80008f46:	fdf7f793          	andi	a5,a5,-33
    80008f4a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008f4e:	fe043783          	ld	a5,-32(s0)
    80008f52:	f7f7f793          	andi	a5,a5,-129
    80008f56:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008f5a:	fe043703          	ld	a4,-32(s0)
    80008f5e:	77fd                	lui	a5,0xfffff
    80008f60:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffd7dbf>
    80008f64:	8ff9                	and	a5,a5,a4
    80008f66:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008f6a:	fe043703          	ld	a4,-32(s0)
    80008f6e:	77fd                	lui	a5,0xfffff
    80008f70:	17fd                	addi	a5,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd75bf>
    80008f72:	8ff9                	and	a5,a5,a4
    80008f74:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008f78:	fe043703          	ld	a4,-32(s0)
    80008f7c:	f80007b7          	lui	a5,0xf8000
    80008f80:	17fd                	addi	a5,a5,-1 # fffffffff7ffffff <end+0xffffffff77fd85bf>
    80008f82:	8ff9                	and	a5,a5,a4
    80008f84:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008f88:	fe043703          	ld	a4,-32(s0)
    80008f8c:	e00007b7          	lui	a5,0xe0000
    80008f90:	17fd                	addi	a5,a5,-1 # ffffffffdfffffff <end+0xffffffff5ffd85bf>
    80008f92:	8ff9                	and	a5,a5,a4
    80008f94:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008f98:	fe043703          	ld	a4,-32(s0)
    80008f9c:	f00007b7          	lui	a5,0xf0000
    80008fa0:	17fd                	addi	a5,a5,-1 # ffffffffefffffff <end+0xffffffff6ffd85bf>
    80008fa2:	8ff9                	and	a5,a5,a4
    80008fa4:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008fa8:	fcc42703          	lw	a4,-52(s0)
    80008fac:	67c1                	lui	a5,0x10
    80008fae:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008fb0:	97ba                	add	a5,a5,a4
    80008fb2:	07b2                	slli	a5,a5,0xc
    80008fb4:	02078793          	addi	a5,a5,32
    80008fb8:	873e                	mv	a4,a5
    80008fba:	fe043783          	ld	a5,-32(s0)
    80008fbe:	2781                	sext.w	a5,a5
    80008fc0:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008fc2:	fe842783          	lw	a5,-24(s0)
    80008fc6:	0087e793          	ori	a5,a5,8
    80008fca:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008fce:	fcc42703          	lw	a4,-52(s0)
    80008fd2:	67c1                	lui	a5,0x10
    80008fd4:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008fd6:	97ba                	add	a5,a5,a4
    80008fd8:	07b2                	slli	a5,a5,0xc
    80008fda:	07078793          	addi	a5,a5,112
    80008fde:	873e                	mv	a4,a5
    80008fe0:	fe842783          	lw	a5,-24(s0)
    80008fe4:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    80008fe6:	fcc42703          	lw	a4,-52(s0)
    80008fea:	67c1                	lui	a5,0x10
    80008fec:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80008fee:	97ba                	add	a5,a5,a4
    80008ff0:	07b2                	slli	a5,a5,0xc
    80008ff2:	07078793          	addi	a5,a5,112
    80008ff6:	439c                	lw	a5,0(a5)
    80008ff8:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80008ffc:	fe842783          	lw	a5,-24(s0)
    80009000:	8ba1                	andi	a5,a5,8
    80009002:	2781                	sext.w	a5,a5
    80009004:	ef81                	bnez	a5,8000901c <virtio_disk_init+0x238>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    80009006:	00002617          	auipc	a2,0x2
    8000900a:	68a60613          	addi	a2,a2,1674 # 8000b690 <etext+0x690>
    8000900e:	fc043583          	ld	a1,-64(s0)
    80009012:	4509                	li	a0,2
    80009014:	ffff8097          	auipc	ra,0xffff8
    80009018:	cc8080e7          	jalr	-824(ra) # 80000cdc <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    8000901c:	fcc42703          	lw	a4,-52(s0)
    80009020:	67c1                	lui	a5,0x10
    80009022:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80009024:	97ba                	add	a5,a5,a4
    80009026:	07b2                	slli	a5,a5,0xc
    80009028:	03078793          	addi	a5,a5,48
    8000902c:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    80009030:	fcc42703          	lw	a4,-52(s0)
    80009034:	67c1                	lui	a5,0x10
    80009036:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80009038:	97ba                	add	a5,a5,a4
    8000903a:	07b2                	slli	a5,a5,0xc
    8000903c:	04478793          	addi	a5,a5,68
    80009040:	439c                	lw	a5,0(a5)
    80009042:	2781                	sext.w	a5,a5
    80009044:	cf81                	beqz	a5,8000905c <virtio_disk_init+0x278>
      panic_concat(2, name, ": virtio disk should not be ready");
    80009046:	00002617          	auipc	a2,0x2
    8000904a:	66a60613          	addi	a2,a2,1642 # 8000b6b0 <etext+0x6b0>
    8000904e:	fc043583          	ld	a1,-64(s0)
    80009052:	4509                	li	a0,2
    80009054:	ffff8097          	auipc	ra,0xffff8
    80009058:	c88080e7          	jalr	-888(ra) # 80000cdc <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    8000905c:	fcc42703          	lw	a4,-52(s0)
    80009060:	67c1                	lui	a5,0x10
    80009062:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80009064:	97ba                	add	a5,a5,a4
    80009066:	07b2                	slli	a5,a5,0xc
    80009068:	03478793          	addi	a5,a5,52
    8000906c:	439c                	lw	a5,0(a5)
    8000906e:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80009072:	fdc42783          	lw	a5,-36(s0)
    80009076:	2781                	sext.w	a5,a5
    80009078:	ef81                	bnez	a5,80009090 <virtio_disk_init+0x2ac>
      panic_concat(2, name, ": virtio disk has no queue 0");
    8000907a:	00002617          	auipc	a2,0x2
    8000907e:	65e60613          	addi	a2,a2,1630 # 8000b6d8 <etext+0x6d8>
    80009082:	fc043583          	ld	a1,-64(s0)
    80009086:	4509                	li	a0,2
    80009088:	ffff8097          	auipc	ra,0xffff8
    8000908c:	c54080e7          	jalr	-940(ra) # 80000cdc <panic_concat>
  if(max < NUM)
    80009090:	fdc42783          	lw	a5,-36(s0)
    80009094:	0007871b          	sext.w	a4,a5
    80009098:	47bd                	li	a5,15
    8000909a:	00e7ed63          	bltu	a5,a4,800090b4 <virtio_disk_init+0x2d0>
      panic_concat(2, name, ": virtio disk max queue too short");
    8000909e:	00002617          	auipc	a2,0x2
    800090a2:	65a60613          	addi	a2,a2,1626 # 8000b6f8 <etext+0x6f8>
    800090a6:	fc043583          	ld	a1,-64(s0)
    800090aa:	4509                	li	a0,2
    800090ac:	ffff8097          	auipc	ra,0xffff8
    800090b0:	c30080e7          	jalr	-976(ra) # 80000cdc <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    800090b4:	ffff8097          	auipc	ra,0xffff8
    800090b8:	128080e7          	jalr	296(ra) # 800011dc <kalloc>
    800090bc:	862a                	mv	a2,a0
    800090be:	0001e717          	auipc	a4,0x1e
    800090c2:	27a70713          	addi	a4,a4,634 # 80027338 <disk>
    800090c6:	fcc42683          	lw	a3,-52(s0)
    800090ca:	25000793          	li	a5,592
    800090ce:	02f687b3          	mul	a5,a3,a5
    800090d2:	97ba                	add	a5,a5,a4
    800090d4:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    800090d6:	ffff8097          	auipc	ra,0xffff8
    800090da:	106080e7          	jalr	262(ra) # 800011dc <kalloc>
    800090de:	862a                	mv	a2,a0
    800090e0:	0001e717          	auipc	a4,0x1e
    800090e4:	25870713          	addi	a4,a4,600 # 80027338 <disk>
    800090e8:	fcc42683          	lw	a3,-52(s0)
    800090ec:	25000793          	li	a5,592
    800090f0:	02f687b3          	mul	a5,a3,a5
    800090f4:	97ba                	add	a5,a5,a4
    800090f6:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    800090f8:	ffff8097          	auipc	ra,0xffff8
    800090fc:	0e4080e7          	jalr	228(ra) # 800011dc <kalloc>
    80009100:	862a                	mv	a2,a0
    80009102:	0001e717          	auipc	a4,0x1e
    80009106:	23670713          	addi	a4,a4,566 # 80027338 <disk>
    8000910a:	fcc42683          	lw	a3,-52(s0)
    8000910e:	25000793          	li	a5,592
    80009112:	02f687b3          	mul	a5,a3,a5
    80009116:	97ba                	add	a5,a5,a4
    80009118:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    8000911a:	0001e717          	auipc	a4,0x1e
    8000911e:	21e70713          	addi	a4,a4,542 # 80027338 <disk>
    80009122:	fcc42683          	lw	a3,-52(s0)
    80009126:	25000793          	li	a5,592
    8000912a:	02f687b3          	mul	a5,a3,a5
    8000912e:	97ba                	add	a5,a5,a4
    80009130:	679c                	ld	a5,8(a5)
    80009132:	cb9d                	beqz	a5,80009168 <virtio_disk_init+0x384>
    80009134:	0001e717          	auipc	a4,0x1e
    80009138:	20470713          	addi	a4,a4,516 # 80027338 <disk>
    8000913c:	fcc42683          	lw	a3,-52(s0)
    80009140:	25000793          	li	a5,592
    80009144:	02f687b3          	mul	a5,a3,a5
    80009148:	97ba                	add	a5,a5,a4
    8000914a:	6b9c                	ld	a5,16(a5)
    8000914c:	cf91                	beqz	a5,80009168 <virtio_disk_init+0x384>
    8000914e:	0001e717          	auipc	a4,0x1e
    80009152:	1ea70713          	addi	a4,a4,490 # 80027338 <disk>
    80009156:	fcc42683          	lw	a3,-52(s0)
    8000915a:	25000793          	li	a5,592
    8000915e:	02f687b3          	mul	a5,a3,a5
    80009162:	97ba                	add	a5,a5,a4
    80009164:	6f9c                	ld	a5,24(a5)
    80009166:	ef81                	bnez	a5,8000917e <virtio_disk_init+0x39a>
      panic_concat(2, name, ": virtio disk kalloc");
    80009168:	00002617          	auipc	a2,0x2
    8000916c:	5b860613          	addi	a2,a2,1464 # 8000b720 <etext+0x720>
    80009170:	fc043583          	ld	a1,-64(s0)
    80009174:	4509                	li	a0,2
    80009176:	ffff8097          	auipc	ra,0xffff8
    8000917a:	b66080e7          	jalr	-1178(ra) # 80000cdc <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    8000917e:	0001e717          	auipc	a4,0x1e
    80009182:	1ba70713          	addi	a4,a4,442 # 80027338 <disk>
    80009186:	fcc42683          	lw	a3,-52(s0)
    8000918a:	25000793          	li	a5,592
    8000918e:	02f687b3          	mul	a5,a3,a5
    80009192:	97ba                	add	a5,a5,a4
    80009194:	679c                	ld	a5,8(a5)
    80009196:	6605                	lui	a2,0x1
    80009198:	4581                	li	a1,0
    8000919a:	853e                	mv	a0,a5
    8000919c:	ffff8097          	auipc	ra,0xffff8
    800091a0:	368080e7          	jalr	872(ra) # 80001504 <memset>
  memset(disk[id].avail, 0, PGSIZE);
    800091a4:	0001e717          	auipc	a4,0x1e
    800091a8:	19470713          	addi	a4,a4,404 # 80027338 <disk>
    800091ac:	fcc42683          	lw	a3,-52(s0)
    800091b0:	25000793          	li	a5,592
    800091b4:	02f687b3          	mul	a5,a3,a5
    800091b8:	97ba                	add	a5,a5,a4
    800091ba:	6b9c                	ld	a5,16(a5)
    800091bc:	6605                	lui	a2,0x1
    800091be:	4581                	li	a1,0
    800091c0:	853e                	mv	a0,a5
    800091c2:	ffff8097          	auipc	ra,0xffff8
    800091c6:	342080e7          	jalr	834(ra) # 80001504 <memset>
  memset(disk[id].used, 0, PGSIZE);
    800091ca:	0001e717          	auipc	a4,0x1e
    800091ce:	16e70713          	addi	a4,a4,366 # 80027338 <disk>
    800091d2:	fcc42683          	lw	a3,-52(s0)
    800091d6:	25000793          	li	a5,592
    800091da:	02f687b3          	mul	a5,a3,a5
    800091de:	97ba                	add	a5,a5,a4
    800091e0:	6f9c                	ld	a5,24(a5)
    800091e2:	6605                	lui	a2,0x1
    800091e4:	4581                	li	a1,0
    800091e6:	853e                	mv	a0,a5
    800091e8:	ffff8097          	auipc	ra,0xffff8
    800091ec:	31c080e7          	jalr	796(ra) # 80001504 <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    800091f0:	fcc42703          	lw	a4,-52(s0)
    800091f4:	67c1                	lui	a5,0x10
    800091f6:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    800091f8:	97ba                	add	a5,a5,a4
    800091fa:	07b2                	slli	a5,a5,0xc
    800091fc:	03878793          	addi	a5,a5,56
    80009200:	873e                	mv	a4,a5
    80009202:	47c1                	li	a5,16
    80009204:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    80009206:	0001e717          	auipc	a4,0x1e
    8000920a:	13270713          	addi	a4,a4,306 # 80027338 <disk>
    8000920e:	fcc42683          	lw	a3,-52(s0)
    80009212:	25000793          	li	a5,592
    80009216:	02f687b3          	mul	a5,a3,a5
    8000921a:	97ba                	add	a5,a5,a4
    8000921c:	679c                	ld	a5,8(a5)
    8000921e:	86be                	mv	a3,a5
    80009220:	fcc42703          	lw	a4,-52(s0)
    80009224:	67c1                	lui	a5,0x10
    80009226:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80009228:	97ba                	add	a5,a5,a4
    8000922a:	07b2                	slli	a5,a5,0xc
    8000922c:	08078793          	addi	a5,a5,128
    80009230:	873e                	mv	a4,a5
    80009232:	0006879b          	sext.w	a5,a3
    80009236:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    80009238:	0001e717          	auipc	a4,0x1e
    8000923c:	10070713          	addi	a4,a4,256 # 80027338 <disk>
    80009240:	fcc42683          	lw	a3,-52(s0)
    80009244:	25000793          	li	a5,592
    80009248:	02f687b3          	mul	a5,a3,a5
    8000924c:	97ba                	add	a5,a5,a4
    8000924e:	679c                	ld	a5,8(a5)
    80009250:	0207d693          	srli	a3,a5,0x20
    80009254:	fcc42703          	lw	a4,-52(s0)
    80009258:	67c1                	lui	a5,0x10
    8000925a:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    8000925c:	97ba                	add	a5,a5,a4
    8000925e:	07b2                	slli	a5,a5,0xc
    80009260:	08478793          	addi	a5,a5,132
    80009264:	873e                	mv	a4,a5
    80009266:	0006879b          	sext.w	a5,a3
    8000926a:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    8000926c:	0001e717          	auipc	a4,0x1e
    80009270:	0cc70713          	addi	a4,a4,204 # 80027338 <disk>
    80009274:	fcc42683          	lw	a3,-52(s0)
    80009278:	25000793          	li	a5,592
    8000927c:	02f687b3          	mul	a5,a3,a5
    80009280:	97ba                	add	a5,a5,a4
    80009282:	6b9c                	ld	a5,16(a5)
    80009284:	86be                	mv	a3,a5
    80009286:	fcc42703          	lw	a4,-52(s0)
    8000928a:	67c1                	lui	a5,0x10
    8000928c:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    8000928e:	97ba                	add	a5,a5,a4
    80009290:	07b2                	slli	a5,a5,0xc
    80009292:	09078793          	addi	a5,a5,144
    80009296:	873e                	mv	a4,a5
    80009298:	0006879b          	sext.w	a5,a3
    8000929c:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    8000929e:	0001e717          	auipc	a4,0x1e
    800092a2:	09a70713          	addi	a4,a4,154 # 80027338 <disk>
    800092a6:	fcc42683          	lw	a3,-52(s0)
    800092aa:	25000793          	li	a5,592
    800092ae:	02f687b3          	mul	a5,a3,a5
    800092b2:	97ba                	add	a5,a5,a4
    800092b4:	6b9c                	ld	a5,16(a5)
    800092b6:	0207d693          	srli	a3,a5,0x20
    800092ba:	fcc42703          	lw	a4,-52(s0)
    800092be:	67c1                	lui	a5,0x10
    800092c0:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    800092c2:	97ba                	add	a5,a5,a4
    800092c4:	07b2                	slli	a5,a5,0xc
    800092c6:	09478793          	addi	a5,a5,148
    800092ca:	873e                	mv	a4,a5
    800092cc:	0006879b          	sext.w	a5,a3
    800092d0:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    800092d2:	0001e717          	auipc	a4,0x1e
    800092d6:	06670713          	addi	a4,a4,102 # 80027338 <disk>
    800092da:	fcc42683          	lw	a3,-52(s0)
    800092de:	25000793          	li	a5,592
    800092e2:	02f687b3          	mul	a5,a3,a5
    800092e6:	97ba                	add	a5,a5,a4
    800092e8:	6f9c                	ld	a5,24(a5)
    800092ea:	86be                	mv	a3,a5
    800092ec:	fcc42703          	lw	a4,-52(s0)
    800092f0:	67c1                	lui	a5,0x10
    800092f2:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    800092f4:	97ba                	add	a5,a5,a4
    800092f6:	07b2                	slli	a5,a5,0xc
    800092f8:	0a078793          	addi	a5,a5,160
    800092fc:	873e                	mv	a4,a5
    800092fe:	0006879b          	sext.w	a5,a3
    80009302:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    80009304:	0001e717          	auipc	a4,0x1e
    80009308:	03470713          	addi	a4,a4,52 # 80027338 <disk>
    8000930c:	fcc42683          	lw	a3,-52(s0)
    80009310:	25000793          	li	a5,592
    80009314:	02f687b3          	mul	a5,a3,a5
    80009318:	97ba                	add	a5,a5,a4
    8000931a:	6f9c                	ld	a5,24(a5)
    8000931c:	0207d693          	srli	a3,a5,0x20
    80009320:	fcc42703          	lw	a4,-52(s0)
    80009324:	67c1                	lui	a5,0x10
    80009326:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80009328:	97ba                	add	a5,a5,a4
    8000932a:	07b2                	slli	a5,a5,0xc
    8000932c:	0a478793          	addi	a5,a5,164
    80009330:	873e                	mv	a4,a5
    80009332:	0006879b          	sext.w	a5,a3
    80009336:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    80009338:	fcc42703          	lw	a4,-52(s0)
    8000933c:	67c1                	lui	a5,0x10
    8000933e:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80009340:	97ba                	add	a5,a5,a4
    80009342:	07b2                	slli	a5,a5,0xc
    80009344:	04478793          	addi	a5,a5,68
    80009348:	873e                	mv	a4,a5
    8000934a:	4785                	li	a5,1
    8000934c:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    8000934e:	fe042623          	sw	zero,-20(s0)
    80009352:	a03d                	j	80009380 <virtio_disk_init+0x59c>
    disk[id].free[i] = 1;
    80009354:	0001e697          	auipc	a3,0x1e
    80009358:	fe468693          	addi	a3,a3,-28 # 80027338 <disk>
    8000935c:	fec42703          	lw	a4,-20(s0)
    80009360:	fcc42603          	lw	a2,-52(s0)
    80009364:	25000793          	li	a5,592
    80009368:	02f607b3          	mul	a5,a2,a5
    8000936c:	97b6                	add	a5,a5,a3
    8000936e:	97ba                	add	a5,a5,a4
    80009370:	4705                	li	a4,1
    80009372:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    80009376:	fec42783          	lw	a5,-20(s0)
    8000937a:	2785                	addiw	a5,a5,1
    8000937c:	fef42623          	sw	a5,-20(s0)
    80009380:	fec42783          	lw	a5,-20(s0)
    80009384:	0007871b          	sext.w	a4,a5
    80009388:	47bd                	li	a5,15
    8000938a:	fce7d5e3          	bge	a5,a4,80009354 <virtio_disk_init+0x570>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    8000938e:	fe842783          	lw	a5,-24(s0)
    80009392:	0047e793          	ori	a5,a5,4
    80009396:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    8000939a:	fcc42703          	lw	a4,-52(s0)
    8000939e:	67c1                	lui	a5,0x10
    800093a0:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    800093a2:	97ba                	add	a5,a5,a4
    800093a4:	07b2                	slli	a5,a5,0xc
    800093a6:	07078793          	addi	a5,a5,112
    800093aa:	873e                	mv	a4,a5
    800093ac:	fe842783          	lw	a5,-24(s0)
    800093b0:	c31c                	sw	a5,0(a4)

  if (id >= VIRTIO_RAID_DISK_START) {
    800093b2:	fcc42783          	lw	a5,-52(s0)
    800093b6:	2781                	sext.w	a5,a5
    800093b8:	08f05663          	blez	a5,80009444 <virtio_disk_init+0x660>
    transfer_buffer[id] = kalloc();
    800093bc:	ffff8097          	auipc	ra,0xffff8
    800093c0:	e20080e7          	jalr	-480(ra) # 800011dc <kalloc>
    800093c4:	86aa                	mv	a3,a0
    800093c6:	0001e717          	auipc	a4,0x1e
    800093ca:	66270713          	addi	a4,a4,1634 # 80027a28 <transfer_buffer>
    800093ce:	fcc42783          	lw	a5,-52(s0)
    800093d2:	078e                	slli	a5,a5,0x3
    800093d4:	97ba                	add	a5,a5,a4
    800093d6:	e394                	sd	a3,0(a5)
    if (!transfer_buffer[id]) {
    800093d8:	0001e717          	auipc	a4,0x1e
    800093dc:	65070713          	addi	a4,a4,1616 # 80027a28 <transfer_buffer>
    800093e0:	fcc42783          	lw	a5,-52(s0)
    800093e4:	078e                	slli	a5,a5,0x3
    800093e6:	97ba                	add	a5,a5,a4
    800093e8:	639c                	ld	a5,0(a5)
    800093ea:	eb89                	bnez	a5,800093fc <virtio_disk_init+0x618>
      panic("virtio_disk_init: kalloc of transfer_buffer failed");
    800093ec:	00002517          	auipc	a0,0x2
    800093f0:	34c50513          	addi	a0,a0,844 # 8000b738 <etext+0x738>
    800093f4:	ffff8097          	auipc	ra,0xffff8
    800093f8:	894080e7          	jalr	-1900(ra) # 80000c88 <panic>
    }
    memset(transfer_buffer[id], 0, BSIZE);
    800093fc:	0001e717          	auipc	a4,0x1e
    80009400:	62c70713          	addi	a4,a4,1580 # 80027a28 <transfer_buffer>
    80009404:	fcc42783          	lw	a5,-52(s0)
    80009408:	078e                	slli	a5,a5,0x3
    8000940a:	97ba                	add	a5,a5,a4
    8000940c:	639c                	ld	a5,0(a5)
    8000940e:	40000613          	li	a2,1024
    80009412:	4581                	li	a1,0
    80009414:	853e                	mv	a0,a5
    80009416:	ffff8097          	auipc	ra,0xffff8
    8000941a:	0ee080e7          	jalr	238(ra) # 80001504 <memset>
    initsleeplock(&transfer_buffer[id]->lock, "transfer_buffer");
    8000941e:	0001e717          	auipc	a4,0x1e
    80009422:	60a70713          	addi	a4,a4,1546 # 80027a28 <transfer_buffer>
    80009426:	fcc42783          	lw	a5,-52(s0)
    8000942a:	078e                	slli	a5,a5,0x3
    8000942c:	97ba                	add	a5,a5,a4
    8000942e:	639c                	ld	a5,0(a5)
    80009430:	07c1                	addi	a5,a5,16
    80009432:	00002597          	auipc	a1,0x2
    80009436:	33e58593          	addi	a1,a1,830 # 8000b770 <etext+0x770>
    8000943a:	853e                	mv	a0,a5
    8000943c:	ffffd097          	auipc	ra,0xffffd
    80009440:	4c6080e7          	jalr	1222(ra) # 80006902 <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    80009444:	0001                	nop
    80009446:	70e2                	ld	ra,56(sp)
    80009448:	7442                	ld	s0,48(sp)
    8000944a:	6121                	addi	sp,sp,64
    8000944c:	8082                	ret

000000008000944e <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    8000944e:	7179                	addi	sp,sp,-48
    80009450:	f422                	sd	s0,40(sp)
    80009452:	1800                	addi	s0,sp,48
    80009454:	87aa                	mv	a5,a0
    80009456:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    8000945a:	fe042623          	sw	zero,-20(s0)
    8000945e:	a891                	j	800094b2 <alloc_desc+0x64>
    if(disk[id].free[i]){
    80009460:	0001e697          	auipc	a3,0x1e
    80009464:	ed868693          	addi	a3,a3,-296 # 80027338 <disk>
    80009468:	fec42703          	lw	a4,-20(s0)
    8000946c:	fdc42603          	lw	a2,-36(s0)
    80009470:	25000793          	li	a5,592
    80009474:	02f607b3          	mul	a5,a2,a5
    80009478:	97b6                	add	a5,a5,a3
    8000947a:	97ba                	add	a5,a5,a4
    8000947c:	0207c783          	lbu	a5,32(a5)
    80009480:	c785                	beqz	a5,800094a8 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    80009482:	0001e697          	auipc	a3,0x1e
    80009486:	eb668693          	addi	a3,a3,-330 # 80027338 <disk>
    8000948a:	fec42703          	lw	a4,-20(s0)
    8000948e:	fdc42603          	lw	a2,-36(s0)
    80009492:	25000793          	li	a5,592
    80009496:	02f607b3          	mul	a5,a2,a5
    8000949a:	97b6                	add	a5,a5,a3
    8000949c:	97ba                	add	a5,a5,a4
    8000949e:	02078023          	sb	zero,32(a5)
      return i;
    800094a2:	fec42783          	lw	a5,-20(s0)
    800094a6:	a831                	j	800094c2 <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    800094a8:	fec42783          	lw	a5,-20(s0)
    800094ac:	2785                	addiw	a5,a5,1
    800094ae:	fef42623          	sw	a5,-20(s0)
    800094b2:	fec42783          	lw	a5,-20(s0)
    800094b6:	0007871b          	sext.w	a4,a5
    800094ba:	47bd                	li	a5,15
    800094bc:	fae7d2e3          	bge	a5,a4,80009460 <alloc_desc+0x12>
    }
  }
  return -1;
    800094c0:	57fd                	li	a5,-1
}
    800094c2:	853e                	mv	a0,a5
    800094c4:	7422                	ld	s0,40(sp)
    800094c6:	6145                	addi	sp,sp,48
    800094c8:	8082                	ret

00000000800094ca <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    800094ca:	1101                	addi	sp,sp,-32
    800094cc:	ec06                	sd	ra,24(sp)
    800094ce:	e822                	sd	s0,16(sp)
    800094d0:	1000                	addi	s0,sp,32
    800094d2:	87aa                	mv	a5,a0
    800094d4:	872e                	mv	a4,a1
    800094d6:	fef42623          	sw	a5,-20(s0)
    800094da:	87ba                	mv	a5,a4
    800094dc:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    800094e0:	fe842783          	lw	a5,-24(s0)
    800094e4:	0007871b          	sext.w	a4,a5
    800094e8:	47bd                	li	a5,15
    800094ea:	02e7d863          	bge	a5,a4,8000951a <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    800094ee:	0001e717          	auipc	a4,0x1e
    800094f2:	e4a70713          	addi	a4,a4,-438 # 80027338 <disk>
    800094f6:	fec42683          	lw	a3,-20(s0)
    800094fa:	25000793          	li	a5,592
    800094fe:	02f687b3          	mul	a5,a3,a5
    80009502:	97ba                	add	a5,a5,a4
    80009504:	639c                	ld	a5,0(a5)
    80009506:	00002617          	auipc	a2,0x2
    8000950a:	27a60613          	addi	a2,a2,634 # 8000b780 <etext+0x780>
    8000950e:	85be                	mv	a1,a5
    80009510:	4509                	li	a0,2
    80009512:	ffff7097          	auipc	ra,0xffff7
    80009516:	7ca080e7          	jalr	1994(ra) # 80000cdc <panic_concat>
  if(disk[id].free[i])
    8000951a:	0001e697          	auipc	a3,0x1e
    8000951e:	e1e68693          	addi	a3,a3,-482 # 80027338 <disk>
    80009522:	fe842703          	lw	a4,-24(s0)
    80009526:	fec42603          	lw	a2,-20(s0)
    8000952a:	25000793          	li	a5,592
    8000952e:	02f607b3          	mul	a5,a2,a5
    80009532:	97b6                	add	a5,a5,a3
    80009534:	97ba                	add	a5,a5,a4
    80009536:	0207c783          	lbu	a5,32(a5)
    8000953a:	c79d                	beqz	a5,80009568 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    8000953c:	0001e717          	auipc	a4,0x1e
    80009540:	dfc70713          	addi	a4,a4,-516 # 80027338 <disk>
    80009544:	fec42683          	lw	a3,-20(s0)
    80009548:	25000793          	li	a5,592
    8000954c:	02f687b3          	mul	a5,a3,a5
    80009550:	97ba                	add	a5,a5,a4
    80009552:	639c                	ld	a5,0(a5)
    80009554:	00002617          	auipc	a2,0x2
    80009558:	23c60613          	addi	a2,a2,572 # 8000b790 <etext+0x790>
    8000955c:	85be                	mv	a1,a5
    8000955e:	4509                	li	a0,2
    80009560:	ffff7097          	auipc	ra,0xffff7
    80009564:	77c080e7          	jalr	1916(ra) # 80000cdc <panic_concat>
  disk[id].desc[i].addr = 0;
    80009568:	0001e717          	auipc	a4,0x1e
    8000956c:	dd070713          	addi	a4,a4,-560 # 80027338 <disk>
    80009570:	fec42683          	lw	a3,-20(s0)
    80009574:	25000793          	li	a5,592
    80009578:	02f687b3          	mul	a5,a3,a5
    8000957c:	97ba                	add	a5,a5,a4
    8000957e:	6798                	ld	a4,8(a5)
    80009580:	fe842783          	lw	a5,-24(s0)
    80009584:	0792                	slli	a5,a5,0x4
    80009586:	97ba                	add	a5,a5,a4
    80009588:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    8000958c:	0001e717          	auipc	a4,0x1e
    80009590:	dac70713          	addi	a4,a4,-596 # 80027338 <disk>
    80009594:	fec42683          	lw	a3,-20(s0)
    80009598:	25000793          	li	a5,592
    8000959c:	02f687b3          	mul	a5,a3,a5
    800095a0:	97ba                	add	a5,a5,a4
    800095a2:	6798                	ld	a4,8(a5)
    800095a4:	fe842783          	lw	a5,-24(s0)
    800095a8:	0792                	slli	a5,a5,0x4
    800095aa:	97ba                	add	a5,a5,a4
    800095ac:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    800095b0:	0001e717          	auipc	a4,0x1e
    800095b4:	d8870713          	addi	a4,a4,-632 # 80027338 <disk>
    800095b8:	fec42683          	lw	a3,-20(s0)
    800095bc:	25000793          	li	a5,592
    800095c0:	02f687b3          	mul	a5,a3,a5
    800095c4:	97ba                	add	a5,a5,a4
    800095c6:	6798                	ld	a4,8(a5)
    800095c8:	fe842783          	lw	a5,-24(s0)
    800095cc:	0792                	slli	a5,a5,0x4
    800095ce:	97ba                	add	a5,a5,a4
    800095d0:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    800095d4:	0001e717          	auipc	a4,0x1e
    800095d8:	d6470713          	addi	a4,a4,-668 # 80027338 <disk>
    800095dc:	fec42683          	lw	a3,-20(s0)
    800095e0:	25000793          	li	a5,592
    800095e4:	02f687b3          	mul	a5,a3,a5
    800095e8:	97ba                	add	a5,a5,a4
    800095ea:	6798                	ld	a4,8(a5)
    800095ec:	fe842783          	lw	a5,-24(s0)
    800095f0:	0792                	slli	a5,a5,0x4
    800095f2:	97ba                	add	a5,a5,a4
    800095f4:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    800095f8:	0001e697          	auipc	a3,0x1e
    800095fc:	d4068693          	addi	a3,a3,-704 # 80027338 <disk>
    80009600:	fe842703          	lw	a4,-24(s0)
    80009604:	fec42603          	lw	a2,-20(s0)
    80009608:	25000793          	li	a5,592
    8000960c:	02f607b3          	mul	a5,a2,a5
    80009610:	97b6                	add	a5,a5,a3
    80009612:	97ba                	add	a5,a5,a4
    80009614:	4705                	li	a4,1
    80009616:	02e78023          	sb	a4,32(a5)

  wakeup(&disk[id].free[0]);
    8000961a:	fec42703          	lw	a4,-20(s0)
    8000961e:	25000793          	li	a5,592
    80009622:	02f707b3          	mul	a5,a4,a5
    80009626:	02078713          	addi	a4,a5,32
    8000962a:	0001e797          	auipc	a5,0x1e
    8000962e:	d0e78793          	addi	a5,a5,-754 # 80027338 <disk>
    80009632:	97ba                	add	a5,a5,a4
    80009634:	853e                	mv	a0,a5
    80009636:	ffffa097          	auipc	ra,0xffffa
    8000963a:	106080e7          	jalr	262(ra) # 8000373c <wakeup>
}
    8000963e:	0001                	nop
    80009640:	60e2                	ld	ra,24(sp)
    80009642:	6442                	ld	s0,16(sp)
    80009644:	6105                	addi	sp,sp,32
    80009646:	8082                	ret

0000000080009648 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    80009648:	7179                	addi	sp,sp,-48
    8000964a:	f406                	sd	ra,40(sp)
    8000964c:	f022                	sd	s0,32(sp)
    8000964e:	1800                	addi	s0,sp,48
    80009650:	87aa                	mv	a5,a0
    80009652:	872e                	mv	a4,a1
    80009654:	fcf42e23          	sw	a5,-36(s0)
    80009658:	87ba                	mv	a5,a4
    8000965a:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    8000965e:	0001e717          	auipc	a4,0x1e
    80009662:	cda70713          	addi	a4,a4,-806 # 80027338 <disk>
    80009666:	fdc42683          	lw	a3,-36(s0)
    8000966a:	25000793          	li	a5,592
    8000966e:	02f687b3          	mul	a5,a3,a5
    80009672:	97ba                	add	a5,a5,a4
    80009674:	6798                	ld	a4,8(a5)
    80009676:	fd842783          	lw	a5,-40(s0)
    8000967a:	0792                	slli	a5,a5,0x4
    8000967c:	97ba                	add	a5,a5,a4
    8000967e:	00c7d783          	lhu	a5,12(a5)
    80009682:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    80009686:	0001e717          	auipc	a4,0x1e
    8000968a:	cb270713          	addi	a4,a4,-846 # 80027338 <disk>
    8000968e:	fdc42683          	lw	a3,-36(s0)
    80009692:	25000793          	li	a5,592
    80009696:	02f687b3          	mul	a5,a3,a5
    8000969a:	97ba                	add	a5,a5,a4
    8000969c:	6798                	ld	a4,8(a5)
    8000969e:	fd842783          	lw	a5,-40(s0)
    800096a2:	0792                	slli	a5,a5,0x4
    800096a4:	97ba                	add	a5,a5,a4
    800096a6:	00e7d783          	lhu	a5,14(a5)
    800096aa:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    800096ae:	fd842703          	lw	a4,-40(s0)
    800096b2:	fdc42783          	lw	a5,-36(s0)
    800096b6:	85ba                	mv	a1,a4
    800096b8:	853e                	mv	a0,a5
    800096ba:	00000097          	auipc	ra,0x0
    800096be:	e10080e7          	jalr	-496(ra) # 800094ca <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    800096c2:	fec42783          	lw	a5,-20(s0)
    800096c6:	8b85                	andi	a5,a5,1
    800096c8:	2781                	sext.w	a5,a5
    800096ca:	c791                	beqz	a5,800096d6 <free_chain+0x8e>
      i = nxt;
    800096cc:	fe842783          	lw	a5,-24(s0)
    800096d0:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    800096d4:	b769                	j	8000965e <free_chain+0x16>
    else
      break;
    800096d6:	0001                	nop
  }
}
    800096d8:	0001                	nop
    800096da:	70a2                	ld	ra,40(sp)
    800096dc:	7402                	ld	s0,32(sp)
    800096de:	6145                	addi	sp,sp,48
    800096e0:	8082                	ret

00000000800096e2 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    800096e2:	7139                	addi	sp,sp,-64
    800096e4:	fc06                	sd	ra,56(sp)
    800096e6:	f822                	sd	s0,48(sp)
    800096e8:	f426                	sd	s1,40(sp)
    800096ea:	0080                	addi	s0,sp,64
    800096ec:	87aa                	mv	a5,a0
    800096ee:	fcb43023          	sd	a1,-64(s0)
    800096f2:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    800096f6:	fc042e23          	sw	zero,-36(s0)
    800096fa:	a049                	j	8000977c <alloc3_desc+0x9a>
    idx[i] = alloc_desc(id);
    800096fc:	fdc42783          	lw	a5,-36(s0)
    80009700:	078a                	slli	a5,a5,0x2
    80009702:	fc043703          	ld	a4,-64(s0)
    80009706:	00f704b3          	add	s1,a4,a5
    8000970a:	fcc42783          	lw	a5,-52(s0)
    8000970e:	853e                	mv	a0,a5
    80009710:	00000097          	auipc	ra,0x0
    80009714:	d3e080e7          	jalr	-706(ra) # 8000944e <alloc_desc>
    80009718:	87aa                	mv	a5,a0
    8000971a:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    8000971c:	fdc42783          	lw	a5,-36(s0)
    80009720:	078a                	slli	a5,a5,0x2
    80009722:	fc043703          	ld	a4,-64(s0)
    80009726:	97ba                	add	a5,a5,a4
    80009728:	439c                	lw	a5,0(a5)
    8000972a:	0407d463          	bgez	a5,80009772 <alloc3_desc+0x90>
      for(int j = 0; j < i; j++)
    8000972e:	fc042c23          	sw	zero,-40(s0)
    80009732:	a02d                	j	8000975c <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    80009734:	fd842783          	lw	a5,-40(s0)
    80009738:	078a                	slli	a5,a5,0x2
    8000973a:	fc043703          	ld	a4,-64(s0)
    8000973e:	97ba                	add	a5,a5,a4
    80009740:	4398                	lw	a4,0(a5)
    80009742:	fcc42783          	lw	a5,-52(s0)
    80009746:	85ba                	mv	a1,a4
    80009748:	853e                	mv	a0,a5
    8000974a:	00000097          	auipc	ra,0x0
    8000974e:	d80080e7          	jalr	-640(ra) # 800094ca <free_desc>
      for(int j = 0; j < i; j++)
    80009752:	fd842783          	lw	a5,-40(s0)
    80009756:	2785                	addiw	a5,a5,1
    80009758:	fcf42c23          	sw	a5,-40(s0)
    8000975c:	fd842783          	lw	a5,-40(s0)
    80009760:	873e                	mv	a4,a5
    80009762:	fdc42783          	lw	a5,-36(s0)
    80009766:	2701                	sext.w	a4,a4
    80009768:	2781                	sext.w	a5,a5
    8000976a:	fcf745e3          	blt	a4,a5,80009734 <alloc3_desc+0x52>
      return -1;
    8000976e:	57fd                	li	a5,-1
    80009770:	a831                	j	8000978c <alloc3_desc+0xaa>
  for(int i = 0; i < 3; i++){
    80009772:	fdc42783          	lw	a5,-36(s0)
    80009776:	2785                	addiw	a5,a5,1
    80009778:	fcf42e23          	sw	a5,-36(s0)
    8000977c:	fdc42783          	lw	a5,-36(s0)
    80009780:	0007871b          	sext.w	a4,a5
    80009784:	4789                	li	a5,2
    80009786:	f6e7dbe3          	bge	a5,a4,800096fc <alloc3_desc+0x1a>
    }
  }
  return 0;
    8000978a:	4781                	li	a5,0
}
    8000978c:	853e                	mv	a0,a5
    8000978e:	70e2                	ld	ra,56(sp)
    80009790:	7442                	ld	s0,48(sp)
    80009792:	74a2                	ld	s1,40(sp)
    80009794:	6121                	addi	sp,sp,64
    80009796:	8082                	ret

0000000080009798 <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write)
{
    80009798:	7139                	addi	sp,sp,-64
    8000979a:	fc06                	sd	ra,56(sp)
    8000979c:	f822                	sd	s0,48(sp)
    8000979e:	0080                	addi	s0,sp,64
    800097a0:	87aa                	mv	a5,a0
    800097a2:	fcb43023          	sd	a1,-64(s0)
    800097a6:	8732                	mv	a4,a2
    800097a8:	fcf42623          	sw	a5,-52(s0)
    800097ac:	87ba                	mv	a5,a4
    800097ae:	fcf42423          	sw	a5,-56(s0)
    uint64 sector = b->blockno * (BSIZE / 512);
    800097b2:	fc043783          	ld	a5,-64(s0)
    800097b6:	47dc                	lw	a5,12(a5)
    800097b8:	0017979b          	slliw	a5,a5,0x1
    800097bc:	2781                	sext.w	a5,a5
    800097be:	1782                	slli	a5,a5,0x20
    800097c0:	9381                	srli	a5,a5,0x20
    800097c2:	fef43423          	sd	a5,-24(s0)

    acquire(&disk[id].vdisk_lock);
    800097c6:	fcc42703          	lw	a4,-52(s0)
    800097ca:	25000793          	li	a5,592
    800097ce:	02f707b3          	mul	a5,a4,a5
    800097d2:	23078713          	addi	a4,a5,560
    800097d6:	0001e797          	auipc	a5,0x1e
    800097da:	b6278793          	addi	a5,a5,-1182 # 80027338 <disk>
    800097de:	97ba                	add	a5,a5,a4
    800097e0:	07a1                	addi	a5,a5,8
    800097e2:	853e                	mv	a0,a5
    800097e4:	ffff8097          	auipc	ra,0xffff8
    800097e8:	b4c080e7          	jalr	-1204(ra) # 80001330 <acquire>
    // data, one for a 1-byte status result.

    // allocate the three descriptors.
    int idx[3];
    while(1){
        if(alloc3_desc(id, idx) == 0) {
    800097ec:	fd040713          	addi	a4,s0,-48
    800097f0:	fcc42783          	lw	a5,-52(s0)
    800097f4:	85ba                	mv	a1,a4
    800097f6:	853e                	mv	a0,a5
    800097f8:	00000097          	auipc	ra,0x0
    800097fc:	eea080e7          	jalr	-278(ra) # 800096e2 <alloc3_desc>
    80009800:	87aa                	mv	a5,a0
    80009802:	c7a1                	beqz	a5,8000984a <virtio_disk_rw+0xb2>
            break;
        }

        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    80009804:	fcc42703          	lw	a4,-52(s0)
    80009808:	25000793          	li	a5,592
    8000980c:	02f707b3          	mul	a5,a4,a5
    80009810:	02078713          	addi	a4,a5,32
    80009814:	0001e797          	auipc	a5,0x1e
    80009818:	b2478793          	addi	a5,a5,-1244 # 80027338 <disk>
    8000981c:	00f706b3          	add	a3,a4,a5
    80009820:	fcc42703          	lw	a4,-52(s0)
    80009824:	25000793          	li	a5,592
    80009828:	02f707b3          	mul	a5,a4,a5
    8000982c:	23078713          	addi	a4,a5,560
    80009830:	0001e797          	auipc	a5,0x1e
    80009834:	b0878793          	addi	a5,a5,-1272 # 80027338 <disk>
    80009838:	97ba                	add	a5,a5,a4
    8000983a:	07a1                	addi	a5,a5,8
    8000983c:	85be                	mv	a1,a5
    8000983e:	8536                	mv	a0,a3
    80009840:	ffffa097          	auipc	ra,0xffffa
    80009844:	e80080e7          	jalr	-384(ra) # 800036c0 <sleep>
        if(alloc3_desc(id, idx) == 0) {
    80009848:	b755                	j	800097ec <virtio_disk_rw+0x54>
            break;
    8000984a:	0001                	nop
    }

    // format the three descriptors.
    // qemu's virtio-blk.c reads them.

    struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    8000984c:	fd042683          	lw	a3,-48(s0)
    80009850:	fcc42703          	lw	a4,-52(s0)
    80009854:	87ba                	mv	a5,a4
    80009856:	078e                	slli	a5,a5,0x3
    80009858:	97ba                	add	a5,a5,a4
    8000985a:	078a                	slli	a5,a5,0x2
    8000985c:	97ba                	add	a5,a5,a4
    8000985e:	97b6                	add	a5,a5,a3
    80009860:	07cd                	addi	a5,a5,19
    80009862:	00479713          	slli	a4,a5,0x4
    80009866:	0001e797          	auipc	a5,0x1e
    8000986a:	ad278793          	addi	a5,a5,-1326 # 80027338 <disk>
    8000986e:	97ba                	add	a5,a5,a4
    80009870:	07a1                	addi	a5,a5,8
    80009872:	fef43023          	sd	a5,-32(s0)

    if(write)
    80009876:	fc842783          	lw	a5,-56(s0)
    8000987a:	2781                	sext.w	a5,a5
    8000987c:	c791                	beqz	a5,80009888 <virtio_disk_rw+0xf0>
        buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    8000987e:	fe043783          	ld	a5,-32(s0)
    80009882:	4705                	li	a4,1
    80009884:	c398                	sw	a4,0(a5)
    80009886:	a029                	j	80009890 <virtio_disk_rw+0xf8>
    else
        buf0->type = VIRTIO_BLK_T_IN; // read the disk
    80009888:	fe043783          	ld	a5,-32(s0)
    8000988c:	0007a023          	sw	zero,0(a5)
    buf0->reserved = 0;
    80009890:	fe043783          	ld	a5,-32(s0)
    80009894:	0007a223          	sw	zero,4(a5)
    buf0->sector = sector;
    80009898:	fe043783          	ld	a5,-32(s0)
    8000989c:	fe843703          	ld	a4,-24(s0)
    800098a0:	e798                	sd	a4,8(a5)

    disk[id].desc[idx[0]].addr = (uint64) buf0;
    800098a2:	0001e717          	auipc	a4,0x1e
    800098a6:	a9670713          	addi	a4,a4,-1386 # 80027338 <disk>
    800098aa:	fcc42683          	lw	a3,-52(s0)
    800098ae:	25000793          	li	a5,592
    800098b2:	02f687b3          	mul	a5,a3,a5
    800098b6:	97ba                	add	a5,a5,a4
    800098b8:	6798                	ld	a4,8(a5)
    800098ba:	fd042783          	lw	a5,-48(s0)
    800098be:	0792                	slli	a5,a5,0x4
    800098c0:	97ba                	add	a5,a5,a4
    800098c2:	fe043703          	ld	a4,-32(s0)
    800098c6:	e398                	sd	a4,0(a5)
    disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    800098c8:	0001e717          	auipc	a4,0x1e
    800098cc:	a7070713          	addi	a4,a4,-1424 # 80027338 <disk>
    800098d0:	fcc42683          	lw	a3,-52(s0)
    800098d4:	25000793          	li	a5,592
    800098d8:	02f687b3          	mul	a5,a3,a5
    800098dc:	97ba                	add	a5,a5,a4
    800098de:	6798                	ld	a4,8(a5)
    800098e0:	fd042783          	lw	a5,-48(s0)
    800098e4:	0792                	slli	a5,a5,0x4
    800098e6:	97ba                	add	a5,a5,a4
    800098e8:	4741                	li	a4,16
    800098ea:	c798                	sw	a4,8(a5)
    disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    800098ec:	0001e717          	auipc	a4,0x1e
    800098f0:	a4c70713          	addi	a4,a4,-1460 # 80027338 <disk>
    800098f4:	fcc42683          	lw	a3,-52(s0)
    800098f8:	25000793          	li	a5,592
    800098fc:	02f687b3          	mul	a5,a3,a5
    80009900:	97ba                	add	a5,a5,a4
    80009902:	6798                	ld	a4,8(a5)
    80009904:	fd042783          	lw	a5,-48(s0)
    80009908:	0792                	slli	a5,a5,0x4
    8000990a:	97ba                	add	a5,a5,a4
    8000990c:	4705                	li	a4,1
    8000990e:	00e79623          	sh	a4,12(a5)
    disk[id].desc[idx[0]].next = idx[1];
    80009912:	fd442603          	lw	a2,-44(s0)
    80009916:	0001e717          	auipc	a4,0x1e
    8000991a:	a2270713          	addi	a4,a4,-1502 # 80027338 <disk>
    8000991e:	fcc42683          	lw	a3,-52(s0)
    80009922:	25000793          	li	a5,592
    80009926:	02f687b3          	mul	a5,a3,a5
    8000992a:	97ba                	add	a5,a5,a4
    8000992c:	6798                	ld	a4,8(a5)
    8000992e:	fd042783          	lw	a5,-48(s0)
    80009932:	0792                	slli	a5,a5,0x4
    80009934:	97ba                	add	a5,a5,a4
    80009936:	03061713          	slli	a4,a2,0x30
    8000993a:	9341                	srli	a4,a4,0x30
    8000993c:	00e79723          	sh	a4,14(a5)

    disk[id].desc[idx[1]].addr = (uint64) b->data;
    80009940:	fc043783          	ld	a5,-64(s0)
    80009944:	05878613          	addi	a2,a5,88
    80009948:	0001e717          	auipc	a4,0x1e
    8000994c:	9f070713          	addi	a4,a4,-1552 # 80027338 <disk>
    80009950:	fcc42683          	lw	a3,-52(s0)
    80009954:	25000793          	li	a5,592
    80009958:	02f687b3          	mul	a5,a3,a5
    8000995c:	97ba                	add	a5,a5,a4
    8000995e:	6798                	ld	a4,8(a5)
    80009960:	fd442783          	lw	a5,-44(s0)
    80009964:	0792                	slli	a5,a5,0x4
    80009966:	97ba                	add	a5,a5,a4
    80009968:	8732                	mv	a4,a2
    8000996a:	e398                	sd	a4,0(a5)
    disk[id].desc[idx[1]].len = BSIZE;
    8000996c:	0001e717          	auipc	a4,0x1e
    80009970:	9cc70713          	addi	a4,a4,-1588 # 80027338 <disk>
    80009974:	fcc42683          	lw	a3,-52(s0)
    80009978:	25000793          	li	a5,592
    8000997c:	02f687b3          	mul	a5,a3,a5
    80009980:	97ba                	add	a5,a5,a4
    80009982:	6798                	ld	a4,8(a5)
    80009984:	fd442783          	lw	a5,-44(s0)
    80009988:	0792                	slli	a5,a5,0x4
    8000998a:	97ba                	add	a5,a5,a4
    8000998c:	40000713          	li	a4,1024
    80009990:	c798                	sw	a4,8(a5)
    if(write)
    80009992:	fc842783          	lw	a5,-56(s0)
    80009996:	2781                	sext.w	a5,a5
    80009998:	c785                	beqz	a5,800099c0 <virtio_disk_rw+0x228>
        disk[id].desc[idx[1]].flags = 0; // device reads b->data
    8000999a:	0001e717          	auipc	a4,0x1e
    8000999e:	99e70713          	addi	a4,a4,-1634 # 80027338 <disk>
    800099a2:	fcc42683          	lw	a3,-52(s0)
    800099a6:	25000793          	li	a5,592
    800099aa:	02f687b3          	mul	a5,a3,a5
    800099ae:	97ba                	add	a5,a5,a4
    800099b0:	6798                	ld	a4,8(a5)
    800099b2:	fd442783          	lw	a5,-44(s0)
    800099b6:	0792                	slli	a5,a5,0x4
    800099b8:	97ba                	add	a5,a5,a4
    800099ba:	00079623          	sh	zero,12(a5)
    800099be:	a025                	j	800099e6 <virtio_disk_rw+0x24e>
    else
        disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    800099c0:	0001e717          	auipc	a4,0x1e
    800099c4:	97870713          	addi	a4,a4,-1672 # 80027338 <disk>
    800099c8:	fcc42683          	lw	a3,-52(s0)
    800099cc:	25000793          	li	a5,592
    800099d0:	02f687b3          	mul	a5,a3,a5
    800099d4:	97ba                	add	a5,a5,a4
    800099d6:	6798                	ld	a4,8(a5)
    800099d8:	fd442783          	lw	a5,-44(s0)
    800099dc:	0792                	slli	a5,a5,0x4
    800099de:	97ba                	add	a5,a5,a4
    800099e0:	4709                	li	a4,2
    800099e2:	00e79623          	sh	a4,12(a5)
    disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    800099e6:	0001e717          	auipc	a4,0x1e
    800099ea:	95270713          	addi	a4,a4,-1710 # 80027338 <disk>
    800099ee:	fcc42683          	lw	a3,-52(s0)
    800099f2:	25000793          	li	a5,592
    800099f6:	02f687b3          	mul	a5,a3,a5
    800099fa:	97ba                	add	a5,a5,a4
    800099fc:	6798                	ld	a4,8(a5)
    800099fe:	fd442783          	lw	a5,-44(s0)
    80009a02:	0792                	slli	a5,a5,0x4
    80009a04:	97ba                	add	a5,a5,a4
    80009a06:	00c7d703          	lhu	a4,12(a5)
    80009a0a:	0001e697          	auipc	a3,0x1e
    80009a0e:	92e68693          	addi	a3,a3,-1746 # 80027338 <disk>
    80009a12:	fcc42603          	lw	a2,-52(s0)
    80009a16:	25000793          	li	a5,592
    80009a1a:	02f607b3          	mul	a5,a2,a5
    80009a1e:	97b6                	add	a5,a5,a3
    80009a20:	6794                	ld	a3,8(a5)
    80009a22:	fd442783          	lw	a5,-44(s0)
    80009a26:	0792                	slli	a5,a5,0x4
    80009a28:	97b6                	add	a5,a5,a3
    80009a2a:	00176713          	ori	a4,a4,1
    80009a2e:	1742                	slli	a4,a4,0x30
    80009a30:	9341                	srli	a4,a4,0x30
    80009a32:	00e79623          	sh	a4,12(a5)
    disk[id].desc[idx[1]].next = idx[2];
    80009a36:	fd842603          	lw	a2,-40(s0)
    80009a3a:	0001e717          	auipc	a4,0x1e
    80009a3e:	8fe70713          	addi	a4,a4,-1794 # 80027338 <disk>
    80009a42:	fcc42683          	lw	a3,-52(s0)
    80009a46:	25000793          	li	a5,592
    80009a4a:	02f687b3          	mul	a5,a3,a5
    80009a4e:	97ba                	add	a5,a5,a4
    80009a50:	6798                	ld	a4,8(a5)
    80009a52:	fd442783          	lw	a5,-44(s0)
    80009a56:	0792                	slli	a5,a5,0x4
    80009a58:	97ba                	add	a5,a5,a4
    80009a5a:	03061713          	slli	a4,a2,0x30
    80009a5e:	9341                	srli	a4,a4,0x30
    80009a60:	00e79723          	sh	a4,14(a5)

    disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    80009a64:	fd042603          	lw	a2,-48(s0)
    80009a68:	0001e697          	auipc	a3,0x1e
    80009a6c:	8d068693          	addi	a3,a3,-1840 # 80027338 <disk>
    80009a70:	fcc42703          	lw	a4,-52(s0)
    80009a74:	87ba                	mv	a5,a4
    80009a76:	078e                	slli	a5,a5,0x3
    80009a78:	97ba                	add	a5,a5,a4
    80009a7a:	078a                	slli	a5,a5,0x2
    80009a7c:	97ba                	add	a5,a5,a4
    80009a7e:	97b2                	add	a5,a5,a2
    80009a80:	078d                	addi	a5,a5,3
    80009a82:	0792                	slli	a5,a5,0x4
    80009a84:	97b6                	add	a5,a5,a3
    80009a86:	577d                	li	a4,-1
    80009a88:	00e78823          	sb	a4,16(a5)
    disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    80009a8c:	fd042683          	lw	a3,-48(s0)
    80009a90:	fcc42703          	lw	a4,-52(s0)
    80009a94:	87ba                	mv	a5,a4
    80009a96:	078e                	slli	a5,a5,0x3
    80009a98:	97ba                	add	a5,a5,a4
    80009a9a:	078a                	slli	a5,a5,0x2
    80009a9c:	97ba                	add	a5,a5,a4
    80009a9e:	97b6                	add	a5,a5,a3
    80009aa0:	078d                	addi	a5,a5,3
    80009aa2:	00479713          	slli	a4,a5,0x4
    80009aa6:	0001e797          	auipc	a5,0x1e
    80009aaa:	89278793          	addi	a5,a5,-1902 # 80027338 <disk>
    80009aae:	97ba                	add	a5,a5,a4
    80009ab0:	01078613          	addi	a2,a5,16
    80009ab4:	0001e717          	auipc	a4,0x1e
    80009ab8:	88470713          	addi	a4,a4,-1916 # 80027338 <disk>
    80009abc:	fcc42683          	lw	a3,-52(s0)
    80009ac0:	25000793          	li	a5,592
    80009ac4:	02f687b3          	mul	a5,a3,a5
    80009ac8:	97ba                	add	a5,a5,a4
    80009aca:	6798                	ld	a4,8(a5)
    80009acc:	fd842783          	lw	a5,-40(s0)
    80009ad0:	0792                	slli	a5,a5,0x4
    80009ad2:	97ba                	add	a5,a5,a4
    80009ad4:	8732                	mv	a4,a2
    80009ad6:	e398                	sd	a4,0(a5)
    disk[id].desc[idx[2]].len = 1;
    80009ad8:	0001e717          	auipc	a4,0x1e
    80009adc:	86070713          	addi	a4,a4,-1952 # 80027338 <disk>
    80009ae0:	fcc42683          	lw	a3,-52(s0)
    80009ae4:	25000793          	li	a5,592
    80009ae8:	02f687b3          	mul	a5,a3,a5
    80009aec:	97ba                	add	a5,a5,a4
    80009aee:	6798                	ld	a4,8(a5)
    80009af0:	fd842783          	lw	a5,-40(s0)
    80009af4:	0792                	slli	a5,a5,0x4
    80009af6:	97ba                	add	a5,a5,a4
    80009af8:	4705                	li	a4,1
    80009afa:	c798                	sw	a4,8(a5)
    disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009afc:	0001e717          	auipc	a4,0x1e
    80009b00:	83c70713          	addi	a4,a4,-1988 # 80027338 <disk>
    80009b04:	fcc42683          	lw	a3,-52(s0)
    80009b08:	25000793          	li	a5,592
    80009b0c:	02f687b3          	mul	a5,a3,a5
    80009b10:	97ba                	add	a5,a5,a4
    80009b12:	6798                	ld	a4,8(a5)
    80009b14:	fd842783          	lw	a5,-40(s0)
    80009b18:	0792                	slli	a5,a5,0x4
    80009b1a:	97ba                	add	a5,a5,a4
    80009b1c:	4709                	li	a4,2
    80009b1e:	00e79623          	sh	a4,12(a5)
    disk[id].desc[idx[2]].next = 0;
    80009b22:	0001e717          	auipc	a4,0x1e
    80009b26:	81670713          	addi	a4,a4,-2026 # 80027338 <disk>
    80009b2a:	fcc42683          	lw	a3,-52(s0)
    80009b2e:	25000793          	li	a5,592
    80009b32:	02f687b3          	mul	a5,a3,a5
    80009b36:	97ba                	add	a5,a5,a4
    80009b38:	6798                	ld	a4,8(a5)
    80009b3a:	fd842783          	lw	a5,-40(s0)
    80009b3e:	0792                	slli	a5,a5,0x4
    80009b40:	97ba                	add	a5,a5,a4
    80009b42:	00079723          	sh	zero,14(a5)



    // record struct buf for virtio_disk_intr().
    b->disk = 1;
    80009b46:	fc043783          	ld	a5,-64(s0)
    80009b4a:	4705                	li	a4,1
    80009b4c:	c3d8                	sw	a4,4(a5)
    disk[id].info[idx[0]].b = b;
    80009b4e:	fd042603          	lw	a2,-48(s0)
    80009b52:	0001d697          	auipc	a3,0x1d
    80009b56:	7e668693          	addi	a3,a3,2022 # 80027338 <disk>
    80009b5a:	fcc42703          	lw	a4,-52(s0)
    80009b5e:	87ba                	mv	a5,a4
    80009b60:	078e                	slli	a5,a5,0x3
    80009b62:	97ba                	add	a5,a5,a4
    80009b64:	078a                	slli	a5,a5,0x2
    80009b66:	97ba                	add	a5,a5,a4
    80009b68:	97b2                	add	a5,a5,a2
    80009b6a:	078d                	addi	a5,a5,3
    80009b6c:	0792                	slli	a5,a5,0x4
    80009b6e:	97b6                	add	a5,a5,a3
    80009b70:	fc043703          	ld	a4,-64(s0)
    80009b74:	e798                	sd	a4,8(a5)

    // tell the device the first index in our chain of descriptors.
    disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    80009b76:	fd042583          	lw	a1,-48(s0)
    80009b7a:	0001d717          	auipc	a4,0x1d
    80009b7e:	7be70713          	addi	a4,a4,1982 # 80027338 <disk>
    80009b82:	fcc42683          	lw	a3,-52(s0)
    80009b86:	25000793          	li	a5,592
    80009b8a:	02f687b3          	mul	a5,a3,a5
    80009b8e:	97ba                	add	a5,a5,a4
    80009b90:	6b94                	ld	a3,16(a5)
    80009b92:	0001d717          	auipc	a4,0x1d
    80009b96:	7a670713          	addi	a4,a4,1958 # 80027338 <disk>
    80009b9a:	fcc42603          	lw	a2,-52(s0)
    80009b9e:	25000793          	li	a5,592
    80009ba2:	02f607b3          	mul	a5,a2,a5
    80009ba6:	97ba                	add	a5,a5,a4
    80009ba8:	6b9c                	ld	a5,16(a5)
    80009baa:	0027d783          	lhu	a5,2(a5)
    80009bae:	2781                	sext.w	a5,a5
    80009bb0:	8bbd                	andi	a5,a5,15
    80009bb2:	2781                	sext.w	a5,a5
    80009bb4:	03059713          	slli	a4,a1,0x30
    80009bb8:	9341                	srli	a4,a4,0x30
    80009bba:	0786                	slli	a5,a5,0x1
    80009bbc:	97b6                	add	a5,a5,a3
    80009bbe:	00e79223          	sh	a4,4(a5)

    __sync_synchronize();
    80009bc2:	0330000f          	fence	rw,rw


    // tell the device another avail ring entry is available.
    disk[id].avail->idx += 1; // not % NUM ...
    80009bc6:	0001d717          	auipc	a4,0x1d
    80009bca:	77270713          	addi	a4,a4,1906 # 80027338 <disk>
    80009bce:	fcc42683          	lw	a3,-52(s0)
    80009bd2:	25000793          	li	a5,592
    80009bd6:	02f687b3          	mul	a5,a3,a5
    80009bda:	97ba                	add	a5,a5,a4
    80009bdc:	6b9c                	ld	a5,16(a5)
    80009bde:	0027d703          	lhu	a4,2(a5)
    80009be2:	0001d697          	auipc	a3,0x1d
    80009be6:	75668693          	addi	a3,a3,1878 # 80027338 <disk>
    80009bea:	fcc42603          	lw	a2,-52(s0)
    80009bee:	25000793          	li	a5,592
    80009bf2:	02f607b3          	mul	a5,a2,a5
    80009bf6:	97b6                	add	a5,a5,a3
    80009bf8:	6b9c                	ld	a5,16(a5)
    80009bfa:	2705                	addiw	a4,a4,1
    80009bfc:	1742                	slli	a4,a4,0x30
    80009bfe:	9341                	srli	a4,a4,0x30
    80009c00:	00e79123          	sh	a4,2(a5)


    __sync_synchronize();
    80009c04:	0330000f          	fence	rw,rw


    *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009c08:	fcc42703          	lw	a4,-52(s0)
    80009c0c:	67c1                	lui	a5,0x10
    80009c0e:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80009c10:	97ba                	add	a5,a5,a4
    80009c12:	07b2                	slli	a5,a5,0xc
    80009c14:	05078793          	addi	a5,a5,80
    80009c18:	0007a023          	sw	zero,0(a5)


    // Wait for virtio_disk_intr() to say request has finished.
    sleep(b, &disk[id].vdisk_lock);
    80009c1c:	fcc42703          	lw	a4,-52(s0)
    80009c20:	25000793          	li	a5,592
    80009c24:	02f707b3          	mul	a5,a4,a5
    80009c28:	23078713          	addi	a4,a5,560
    80009c2c:	0001d797          	auipc	a5,0x1d
    80009c30:	70c78793          	addi	a5,a5,1804 # 80027338 <disk>
    80009c34:	97ba                	add	a5,a5,a4
    80009c36:	07a1                	addi	a5,a5,8
    80009c38:	85be                	mv	a1,a5
    80009c3a:	fc043503          	ld	a0,-64(s0)
    80009c3e:	ffffa097          	auipc	ra,0xffffa
    80009c42:	a82080e7          	jalr	-1406(ra) # 800036c0 <sleep>


    disk[id].info[idx[0]].b = 0;
    80009c46:	fd042603          	lw	a2,-48(s0)
    80009c4a:	0001d697          	auipc	a3,0x1d
    80009c4e:	6ee68693          	addi	a3,a3,1774 # 80027338 <disk>
    80009c52:	fcc42703          	lw	a4,-52(s0)
    80009c56:	87ba                	mv	a5,a4
    80009c58:	078e                	slli	a5,a5,0x3
    80009c5a:	97ba                	add	a5,a5,a4
    80009c5c:	078a                	slli	a5,a5,0x2
    80009c5e:	97ba                	add	a5,a5,a4
    80009c60:	97b2                	add	a5,a5,a2
    80009c62:	078d                	addi	a5,a5,3
    80009c64:	0792                	slli	a5,a5,0x4
    80009c66:	97b6                	add	a5,a5,a3
    80009c68:	0007b423          	sd	zero,8(a5)
    free_chain(id, idx[0]);
    80009c6c:	fd042703          	lw	a4,-48(s0)
    80009c70:	fcc42783          	lw	a5,-52(s0)
    80009c74:	85ba                	mv	a1,a4
    80009c76:	853e                	mv	a0,a5
    80009c78:	00000097          	auipc	ra,0x0
    80009c7c:	9d0080e7          	jalr	-1584(ra) # 80009648 <free_chain>


    release(&disk[id].vdisk_lock);
    80009c80:	fcc42703          	lw	a4,-52(s0)
    80009c84:	25000793          	li	a5,592
    80009c88:	02f707b3          	mul	a5,a4,a5
    80009c8c:	23078713          	addi	a4,a5,560
    80009c90:	0001d797          	auipc	a5,0x1d
    80009c94:	6a878793          	addi	a5,a5,1704 # 80027338 <disk>
    80009c98:	97ba                	add	a5,a5,a4
    80009c9a:	07a1                	addi	a5,a5,8
    80009c9c:	853e                	mv	a0,a5
    80009c9e:	ffff7097          	auipc	ra,0xffff7
    80009ca2:	6f6080e7          	jalr	1782(ra) # 80001394 <release>

}
    80009ca6:	0001                	nop
    80009ca8:	70e2                	ld	ra,56(sp)
    80009caa:	7442                	ld	s0,48(sp)
    80009cac:	6121                	addi	sp,sp,64
    80009cae:	8082                	ret

0000000080009cb0 <write_block>:


void write_block(int diskn, int blockno, uchar* data) {
    80009cb0:	7179                	addi	sp,sp,-48
    80009cb2:	f406                	sd	ra,40(sp)
    80009cb4:	f022                	sd	s0,32(sp)
    80009cb6:	1800                	addi	s0,sp,48
    80009cb8:	87aa                	mv	a5,a0
    80009cba:	872e                	mv	a4,a1
    80009cbc:	fcc43823          	sd	a2,-48(s0)
    80009cc0:	fcf42e23          	sw	a5,-36(s0)
    80009cc4:	87ba                	mv	a5,a4
    80009cc6:	fcf42c23          	sw	a5,-40(s0)
    //printf("Upisivanje bloka...");
    struct buf *b = transfer_buffer[diskn];// b je null
    80009cca:	0001e717          	auipc	a4,0x1e
    80009cce:	d5e70713          	addi	a4,a4,-674 # 80027a28 <transfer_buffer>
    80009cd2:	fdc42783          	lw	a5,-36(s0)
    80009cd6:	078e                	slli	a5,a5,0x3
    80009cd8:	97ba                	add	a5,a5,a4
    80009cda:	639c                	ld	a5,0(a5)
    80009cdc:	fef43423          	sd	a5,-24(s0)
//    printf("Write_block %d %d %s", diskn, blockno, data);
//    printf("\n%p\n", b);
    b->blockno = blockno;
    80009ce0:	fd842703          	lw	a4,-40(s0)
    80009ce4:	fe843783          	ld	a5,-24(s0)
    80009ce8:	c7d8                	sw	a4,12(a5)


    memmove(b->data, data, BSIZE);
    80009cea:	fe843783          	ld	a5,-24(s0)
    80009cee:	05878793          	addi	a5,a5,88
    80009cf2:	40000613          	li	a2,1024
    80009cf6:	fd043583          	ld	a1,-48(s0)
    80009cfa:	853e                	mv	a0,a5
    80009cfc:	ffff8097          	auipc	ra,0xffff8
    80009d00:	8ec080e7          	jalr	-1812(ra) # 800015e8 <memmove>


//    uint32 device_status = read_mmio_32(VIRTIO_MMIO_STATUS);
//    printf("Virtio Device Status: 0x%x\n", device_status);

    virtio_disk_rw(diskn, b, 1);
    80009d04:	fdc42783          	lw	a5,-36(s0)
    80009d08:	4605                	li	a2,1
    80009d0a:	fe843583          	ld	a1,-24(s0)
    80009d0e:	853e                	mv	a0,a5
    80009d10:	00000097          	auipc	ra,0x0
    80009d14:	a88080e7          	jalr	-1400(ra) # 80009798 <virtio_disk_rw>

    printf("\nBlock has been written\n");
    80009d18:	00002517          	auipc	a0,0x2
    80009d1c:	a8850513          	addi	a0,a0,-1400 # 8000b7a0 <etext+0x7a0>
    80009d20:	ffff7097          	auipc	ra,0xffff7
    80009d24:	d12080e7          	jalr	-750(ra) # 80000a32 <printf>
}
    80009d28:	0001                	nop
    80009d2a:	70a2                	ld	ra,40(sp)
    80009d2c:	7402                	ld	s0,32(sp)
    80009d2e:	6145                	addi	sp,sp,48
    80009d30:	8082                	ret

0000000080009d32 <read_block>:

void read_block(int diskn, int blockno, uchar* data) {
    80009d32:	7179                	addi	sp,sp,-48
    80009d34:	f406                	sd	ra,40(sp)
    80009d36:	f022                	sd	s0,32(sp)
    80009d38:	1800                	addi	s0,sp,48
    80009d3a:	87aa                	mv	a5,a0
    80009d3c:	872e                	mv	a4,a1
    80009d3e:	fcc43823          	sd	a2,-48(s0)
    80009d42:	fcf42e23          	sw	a5,-36(s0)
    80009d46:	87ba                	mv	a5,a4
    80009d48:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = transfer_buffer[diskn];
    80009d4c:	0001e717          	auipc	a4,0x1e
    80009d50:	cdc70713          	addi	a4,a4,-804 # 80027a28 <transfer_buffer>
    80009d54:	fdc42783          	lw	a5,-36(s0)
    80009d58:	078e                	slli	a5,a5,0x3
    80009d5a:	97ba                	add	a5,a5,a4
    80009d5c:	639c                	ld	a5,0(a5)
    80009d5e:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009d62:	fd842703          	lw	a4,-40(s0)
    80009d66:	fe843783          	ld	a5,-24(s0)
    80009d6a:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(diskn, b, 0);
    80009d6c:	fdc42783          	lw	a5,-36(s0)
    80009d70:	4601                	li	a2,0
    80009d72:	fe843583          	ld	a1,-24(s0)
    80009d76:	853e                	mv	a0,a5
    80009d78:	00000097          	auipc	ra,0x0
    80009d7c:	a20080e7          	jalr	-1504(ra) # 80009798 <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    80009d80:	fe843783          	ld	a5,-24(s0)
    80009d84:	05878793          	addi	a5,a5,88
    80009d88:	40000613          	li	a2,1024
    80009d8c:	85be                	mv	a1,a5
    80009d8e:	fd043503          	ld	a0,-48(s0)
    80009d92:	ffff8097          	auipc	ra,0xffff8
    80009d96:	856080e7          	jalr	-1962(ra) # 800015e8 <memmove>
}
    80009d9a:	0001                	nop
    80009d9c:	70a2                	ld	ra,40(sp)
    80009d9e:	7402                	ld	s0,32(sp)
    80009da0:	6145                	addi	sp,sp,48
    80009da2:	8082                	ret

0000000080009da4 <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    80009da4:	7179                	addi	sp,sp,-48
    80009da6:	f406                	sd	ra,40(sp)
    80009da8:	f022                	sd	s0,32(sp)
    80009daa:	1800                	addi	s0,sp,48
    80009dac:	87aa                	mv	a5,a0
    80009dae:	fcf42e23          	sw	a5,-36(s0)

  acquire(&disk[id].vdisk_lock);
    80009db2:	fdc42703          	lw	a4,-36(s0)
    80009db6:	25000793          	li	a5,592
    80009dba:	02f707b3          	mul	a5,a4,a5
    80009dbe:	23078713          	addi	a4,a5,560
    80009dc2:	0001d797          	auipc	a5,0x1d
    80009dc6:	57678793          	addi	a5,a5,1398 # 80027338 <disk>
    80009dca:	97ba                	add	a5,a5,a4
    80009dcc:	07a1                	addi	a5,a5,8
    80009dce:	853e                	mv	a0,a5
    80009dd0:	ffff7097          	auipc	ra,0xffff7
    80009dd4:	560080e7          	jalr	1376(ra) # 80001330 <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80009dd8:	fdc42703          	lw	a4,-36(s0)
    80009ddc:	67c1                	lui	a5,0x10
    80009dde:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80009de0:	97ba                	add	a5,a5,a4
    80009de2:	07b2                	slli	a5,a5,0xc
    80009de4:	06078793          	addi	a5,a5,96
    80009de8:	439c                	lw	a5,0(a5)
    80009dea:	0007869b          	sext.w	a3,a5
    80009dee:	fdc42703          	lw	a4,-36(s0)
    80009df2:	67c1                	lui	a5,0x10
    80009df4:	0785                	addi	a5,a5,1 # 10001 <_entry-0x7ffeffff>
    80009df6:	97ba                	add	a5,a5,a4
    80009df8:	07b2                	slli	a5,a5,0xc
    80009dfa:	06478793          	addi	a5,a5,100
    80009dfe:	873e                	mv	a4,a5
    80009e00:	87b6                	mv	a5,a3
    80009e02:	8b8d                	andi	a5,a5,3
    80009e04:	2781                	sext.w	a5,a5
    80009e06:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    80009e08:	0330000f          	fence	rw,rw

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    80009e0c:	aa11                	j	80009f20 <virtio_disk_intr+0x17c>
    __sync_synchronize();
    80009e0e:	0330000f          	fence	rw,rw
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    80009e12:	0001d717          	auipc	a4,0x1d
    80009e16:	52670713          	addi	a4,a4,1318 # 80027338 <disk>
    80009e1a:	fdc42683          	lw	a3,-36(s0)
    80009e1e:	25000793          	li	a5,592
    80009e22:	02f687b3          	mul	a5,a3,a5
    80009e26:	97ba                	add	a5,a5,a4
    80009e28:	6f98                	ld	a4,24(a5)
    80009e2a:	0001d697          	auipc	a3,0x1d
    80009e2e:	50e68693          	addi	a3,a3,1294 # 80027338 <disk>
    80009e32:	fdc42603          	lw	a2,-36(s0)
    80009e36:	25000793          	li	a5,592
    80009e3a:	02f607b3          	mul	a5,a2,a5
    80009e3e:	97b6                	add	a5,a5,a3
    80009e40:	0307d783          	lhu	a5,48(a5)
    80009e44:	2781                	sext.w	a5,a5
    80009e46:	8bbd                	andi	a5,a5,15
    80009e48:	2781                	sext.w	a5,a5
    80009e4a:	078e                	slli	a5,a5,0x3
    80009e4c:	97ba                	add	a5,a5,a4
    80009e4e:	43dc                	lw	a5,4(a5)
    80009e50:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    80009e54:	0001d697          	auipc	a3,0x1d
    80009e58:	4e468693          	addi	a3,a3,1252 # 80027338 <disk>
    80009e5c:	fec42603          	lw	a2,-20(s0)
    80009e60:	fdc42703          	lw	a4,-36(s0)
    80009e64:	87ba                	mv	a5,a4
    80009e66:	078e                	slli	a5,a5,0x3
    80009e68:	97ba                	add	a5,a5,a4
    80009e6a:	078a                	slli	a5,a5,0x2
    80009e6c:	97ba                	add	a5,a5,a4
    80009e6e:	97b2                	add	a5,a5,a2
    80009e70:	078d                	addi	a5,a5,3
    80009e72:	0792                	slli	a5,a5,0x4
    80009e74:	97b6                	add	a5,a5,a3
    80009e76:	0107c783          	lbu	a5,16(a5)
    80009e7a:	c79d                	beqz	a5,80009ea8 <virtio_disk_intr+0x104>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    80009e7c:	0001d717          	auipc	a4,0x1d
    80009e80:	4bc70713          	addi	a4,a4,1212 # 80027338 <disk>
    80009e84:	fdc42683          	lw	a3,-36(s0)
    80009e88:	25000793          	li	a5,592
    80009e8c:	02f687b3          	mul	a5,a3,a5
    80009e90:	97ba                	add	a5,a5,a4
    80009e92:	639c                	ld	a5,0(a5)
    80009e94:	00002617          	auipc	a2,0x2
    80009e98:	92c60613          	addi	a2,a2,-1748 # 8000b7c0 <etext+0x7c0>
    80009e9c:	85be                	mv	a1,a5
    80009e9e:	4509                	li	a0,2
    80009ea0:	ffff7097          	auipc	ra,0xffff7
    80009ea4:	e3c080e7          	jalr	-452(ra) # 80000cdc <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    80009ea8:	0001d697          	auipc	a3,0x1d
    80009eac:	49068693          	addi	a3,a3,1168 # 80027338 <disk>
    80009eb0:	fec42603          	lw	a2,-20(s0)
    80009eb4:	fdc42703          	lw	a4,-36(s0)
    80009eb8:	87ba                	mv	a5,a4
    80009eba:	078e                	slli	a5,a5,0x3
    80009ebc:	97ba                	add	a5,a5,a4
    80009ebe:	078a                	slli	a5,a5,0x2
    80009ec0:	97ba                	add	a5,a5,a4
    80009ec2:	97b2                	add	a5,a5,a2
    80009ec4:	078d                	addi	a5,a5,3
    80009ec6:	0792                	slli	a5,a5,0x4
    80009ec8:	97b6                	add	a5,a5,a3
    80009eca:	679c                	ld	a5,8(a5)
    80009ecc:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    80009ed0:	fe043783          	ld	a5,-32(s0)
    80009ed4:	0007a223          	sw	zero,4(a5)

    wakeup(b);
    80009ed8:	fe043503          	ld	a0,-32(s0)
    80009edc:	ffffa097          	auipc	ra,0xffffa
    80009ee0:	860080e7          	jalr	-1952(ra) # 8000373c <wakeup>

    disk[id].used_idx += 1;
    80009ee4:	0001d717          	auipc	a4,0x1d
    80009ee8:	45470713          	addi	a4,a4,1108 # 80027338 <disk>
    80009eec:	fdc42683          	lw	a3,-36(s0)
    80009ef0:	25000793          	li	a5,592
    80009ef4:	02f687b3          	mul	a5,a3,a5
    80009ef8:	97ba                	add	a5,a5,a4
    80009efa:	0307d783          	lhu	a5,48(a5)
    80009efe:	2785                	addiw	a5,a5,1
    80009f00:	03079713          	slli	a4,a5,0x30
    80009f04:	9341                	srli	a4,a4,0x30
    80009f06:	0001d697          	auipc	a3,0x1d
    80009f0a:	43268693          	addi	a3,a3,1074 # 80027338 <disk>
    80009f0e:	fdc42603          	lw	a2,-36(s0)
    80009f12:	25000793          	li	a5,592
    80009f16:	02f607b3          	mul	a5,a2,a5
    80009f1a:	97b6                	add	a5,a5,a3
    80009f1c:	02e79823          	sh	a4,48(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    80009f20:	0001d717          	auipc	a4,0x1d
    80009f24:	41870713          	addi	a4,a4,1048 # 80027338 <disk>
    80009f28:	fdc42683          	lw	a3,-36(s0)
    80009f2c:	25000793          	li	a5,592
    80009f30:	02f687b3          	mul	a5,a3,a5
    80009f34:	97ba                	add	a5,a5,a4
    80009f36:	0307d603          	lhu	a2,48(a5)
    80009f3a:	0001d717          	auipc	a4,0x1d
    80009f3e:	3fe70713          	addi	a4,a4,1022 # 80027338 <disk>
    80009f42:	fdc42683          	lw	a3,-36(s0)
    80009f46:	25000793          	li	a5,592
    80009f4a:	02f687b3          	mul	a5,a3,a5
    80009f4e:	97ba                	add	a5,a5,a4
    80009f50:	6f9c                	ld	a5,24(a5)
    80009f52:	0027d783          	lhu	a5,2(a5)
    80009f56:	0006071b          	sext.w	a4,a2
    80009f5a:	2781                	sext.w	a5,a5
    80009f5c:	eaf719e3          	bne	a4,a5,80009e0e <virtio_disk_intr+0x6a>
  }

  release(&disk[id].vdisk_lock);
    80009f60:	fdc42703          	lw	a4,-36(s0)
    80009f64:	25000793          	li	a5,592
    80009f68:	02f707b3          	mul	a5,a4,a5
    80009f6c:	23078713          	addi	a4,a5,560
    80009f70:	0001d797          	auipc	a5,0x1d
    80009f74:	3c878793          	addi	a5,a5,968 # 80027338 <disk>
    80009f78:	97ba                	add	a5,a5,a4
    80009f7a:	07a1                	addi	a5,a5,8
    80009f7c:	853e                	mv	a0,a5
    80009f7e:	ffff7097          	auipc	ra,0xffff7
    80009f82:	416080e7          	jalr	1046(ra) # 80001394 <release>
    //printf("\nvirtio_disk_intr %d\n",id);



}
    80009f86:	0001                	nop
    80009f88:	70a2                	ld	ra,40(sp)
    80009f8a:	7402                	ld	s0,32(sp)
    80009f8c:	6145                	addi	sp,sp,48
    80009f8e:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051073          	csrw	sscratch,a0
    8000a004:	02000537          	lui	a0,0x2000
    8000a008:	357d                	addiw	a0,a0,-1 # 1ffffff <_entry-0x7e000001>
    8000a00a:	0536                	slli	a0,a0,0xd
    8000a00c:	02153423          	sd	ra,40(a0)
    8000a010:	02253823          	sd	sp,48(a0)
    8000a014:	02353c23          	sd	gp,56(a0)
    8000a018:	04453023          	sd	tp,64(a0)
    8000a01c:	04553423          	sd	t0,72(a0)
    8000a020:	04653823          	sd	t1,80(a0)
    8000a024:	04753c23          	sd	t2,88(a0)
    8000a028:	f120                	sd	s0,96(a0)
    8000a02a:	f524                	sd	s1,104(a0)
    8000a02c:	fd2c                	sd	a1,120(a0)
    8000a02e:	e150                	sd	a2,128(a0)
    8000a030:	e554                	sd	a3,136(a0)
    8000a032:	e958                	sd	a4,144(a0)
    8000a034:	ed5c                	sd	a5,152(a0)
    8000a036:	0b053023          	sd	a6,160(a0)
    8000a03a:	0b153423          	sd	a7,168(a0)
    8000a03e:	0b253823          	sd	s2,176(a0)
    8000a042:	0b353c23          	sd	s3,184(a0)
    8000a046:	0d453023          	sd	s4,192(a0)
    8000a04a:	0d553423          	sd	s5,200(a0)
    8000a04e:	0d653823          	sd	s6,208(a0)
    8000a052:	0d753c23          	sd	s7,216(a0)
    8000a056:	0f853023          	sd	s8,224(a0)
    8000a05a:	0f953423          	sd	s9,232(a0)
    8000a05e:	0fa53823          	sd	s10,240(a0)
    8000a062:	0fb53c23          	sd	s11,248(a0)
    8000a066:	11c53023          	sd	t3,256(a0)
    8000a06a:	11d53423          	sd	t4,264(a0)
    8000a06e:	11e53823          	sd	t5,272(a0)
    8000a072:	11f53c23          	sd	t6,280(a0)
    8000a076:	140022f3          	csrr	t0,sscratch
    8000a07a:	06553823          	sd	t0,112(a0)
    8000a07e:	00853103          	ld	sp,8(a0)
    8000a082:	02053203          	ld	tp,32(a0)
    8000a086:	01053283          	ld	t0,16(a0)
    8000a08a:	00053303          	ld	t1,0(a0)
    8000a08e:	12000073          	sfence.vma
    8000a092:	18031073          	csrw	satp,t1
    8000a096:	12000073          	sfence.vma
    8000a09a:	8282                	jr	t0

000000008000a09c <userret>:
    8000a09c:	12000073          	sfence.vma
    8000a0a0:	18051073          	csrw	satp,a0
    8000a0a4:	12000073          	sfence.vma
    8000a0a8:	02000537          	lui	a0,0x2000
    8000a0ac:	357d                	addiw	a0,a0,-1 # 1ffffff <_entry-0x7e000001>
    8000a0ae:	0536                	slli	a0,a0,0xd
    8000a0b0:	02853083          	ld	ra,40(a0)
    8000a0b4:	03053103          	ld	sp,48(a0)
    8000a0b8:	03853183          	ld	gp,56(a0)
    8000a0bc:	04053203          	ld	tp,64(a0)
    8000a0c0:	04853283          	ld	t0,72(a0)
    8000a0c4:	05053303          	ld	t1,80(a0)
    8000a0c8:	05853383          	ld	t2,88(a0)
    8000a0cc:	7120                	ld	s0,96(a0)
    8000a0ce:	7524                	ld	s1,104(a0)
    8000a0d0:	7d2c                	ld	a1,120(a0)
    8000a0d2:	6150                	ld	a2,128(a0)
    8000a0d4:	6554                	ld	a3,136(a0)
    8000a0d6:	6958                	ld	a4,144(a0)
    8000a0d8:	6d5c                	ld	a5,152(a0)
    8000a0da:	0a053803          	ld	a6,160(a0)
    8000a0de:	0a853883          	ld	a7,168(a0)
    8000a0e2:	0b053903          	ld	s2,176(a0)
    8000a0e6:	0b853983          	ld	s3,184(a0)
    8000a0ea:	0c053a03          	ld	s4,192(a0)
    8000a0ee:	0c853a83          	ld	s5,200(a0)
    8000a0f2:	0d053b03          	ld	s6,208(a0)
    8000a0f6:	0d853b83          	ld	s7,216(a0)
    8000a0fa:	0e053c03          	ld	s8,224(a0)
    8000a0fe:	0e853c83          	ld	s9,232(a0)
    8000a102:	0f053d03          	ld	s10,240(a0)
    8000a106:	0f853d83          	ld	s11,248(a0)
    8000a10a:	10053e03          	ld	t3,256(a0)
    8000a10e:	10853e83          	ld	t4,264(a0)
    8000a112:	11053f03          	ld	t5,272(a0)
    8000a116:	11853f83          	ld	t6,280(a0)
    8000a11a:	7928                	ld	a0,112(a0)
    8000a11c:	10200073          	sret
	...
