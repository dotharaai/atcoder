/* Generated by Nim Compiler v0.13.0 */
/*   (c) 2015 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w  -I/home/dotharaai/.choosenim/toolchains/nim-0.13.0/lib -o /home/dotharaai/projects/nim/abc158/nimcache/stdlib_algorithm.o /home/dotharaai/projects/nim/abc158/nimcache/stdlib_algorithm.c */
#define NIM_INTBITS 64

#include "nimbase.h"
typedef struct TY15805 TY15805;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct Cell47905 Cell47905;
typedef struct TNimType TNimType;
typedef struct Cellseq47921 Cellseq47921;
typedef struct Gcheap50218 Gcheap50218;
typedef struct Gcstack50216 Gcstack50216;
typedef struct Cellset47917 Cellset47917;
typedef struct Pagedesc47913 Pagedesc47913;
typedef struct Memregion30088 Memregion30088;
typedef struct Smallchunk30040 Smallchunk30040;
typedef struct Llchunk30082 Llchunk30082;
typedef struct Bigchunk30042 Bigchunk30042;
typedef struct Intset30014 Intset30014;
typedef struct Trunk30010 Trunk30010;
typedef struct Avlnode30086 Avlnode30086;
typedef struct Gcstat50214 Gcstat50214;
typedef struct TNimNode TNimNode;
typedef struct Basechunk30038 Basechunk30038;
typedef struct Freecell30030 Freecell30030;
struct  TGenericSeq  {
NI len;
NI reserved;
};
struct  NimStringDesc  {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct  Cell47905  {
NI refcount;
TNimType* typ;
};
struct  Cellseq47921  {
NI len;
NI cap;
Cell47905** d;
};
struct  Cellset47917  {
NI counter;
NI max;
Pagedesc47913* head;
Pagedesc47913** data;
};
typedef Smallchunk30040* TY30103[512];
typedef Trunk30010* Trunkbuckets30012[256];
struct  Intset30014  {
Trunkbuckets30012 data;
};
struct  Memregion30088  {
NI minlargeobj;
NI maxlargeobj;
TY30103 freesmallchunks;
Llchunk30082* llmem;
NI currmem;
NI maxmem;
NI freemem;
NI lastsize;
Bigchunk30042* freechunkslist;
Intset30014 chunkstarts;
Avlnode30086* root;
Avlnode30086* deleted;
Avlnode30086* last;
Avlnode30086* freeavlnodes;
};
struct  Gcstat50214  {
NI stackscans;
NI cyclecollections;
NI maxthreshold;
NI maxstacksize;
NI maxstackcells;
NI cycletablesize;
NI64 maxpause;
};
struct  Gcheap50218  {
Gcstack50216* stack;
void* stackbottom;
NI cyclethreshold;
Cellseq47921 zct;
Cellseq47921 decstack;
Cellset47917 cycleroots;
Cellseq47921 tempstack;
NI recgclock;
Memregion30088 region;
Gcstat50214 stat;
};
typedef N_NIMCALL_PTR(void, TY3489) (void* p, NI op);
typedef N_NIMCALL_PTR(void*, TY3494) (void* p);
struct  TNimType  {
NI size;
NU8 kind;
NU8 flags;
TNimType* base;
TNimNode* node;
void* finalizer;
TY3489 marker;
TY3494 deepcopy;
};
struct  Gcstack50216  {
Gcstack50216* prev;
Gcstack50216* next;
void* starts;
void* pos;
NI maxstacksize;
};
typedef NI TY30019[8];
struct  Pagedesc47913  {
Pagedesc47913* next;
NI key;
TY30019 bits;
};
struct  Basechunk30038  {
NI prevsize;
NI size;
NIM_BOOL used;
};
struct  Smallchunk30040  {
  Basechunk30038 Sup;
Smallchunk30040* next;
Smallchunk30040* prev;
Freecell30030* freelist;
NI free;
NI acc;
NF data;
};
struct  Llchunk30082  {
NI size;
NI acc;
Llchunk30082* next;
};
struct  Bigchunk30042  {
  Basechunk30038 Sup;
Bigchunk30042* next;
Bigchunk30042* prev;
NI align;
NF data;
};
struct  Trunk30010  {
Trunk30010* next;
NI key;
TY30019 bits;
};
typedef Avlnode30086* TY30093[2];
struct  Avlnode30086  {
TY30093 link;
NI key;
NI upperbound;
NI level;
};
struct  TNimNode  {
NU8 kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
struct  Freecell30030  {
Freecell30030* next;
NI zerofield;
};
struct TY15805 {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};
static N_INLINE(NI, HEX2A_103008)(NI x, NU8 order);
static N_INLINE(NI, subInt)(NI a, NI b);
N_NOINLINE(void, raiseOverflow)(void);
static N_INLINE(void, nimFrame)(TFrame* s);
N_NOINLINE(void, stackoverflow_22201)(void);
static N_INLINE(void, popFrame)(void);
N_NIMCALL(TY15805*, reversed_105864)(NimStringDesc** a, NI aLen0, NI first, NI last);
N_NIMCALL(void, failedassertimpl_89116)(NimStringDesc* msg);
N_NIMCALL(TY15805*, newseq_105810)(NI len);
static N_INLINE(NI, addInt)(NI a, NI b);
static N_INLINE(NI, chckRange)(NI i, NI a, NI b);
N_NOINLINE(void, raiseRangeError)(NI64 val);
N_NOINLINE(void, raiseIndexError)(void);
N_NIMCALL(NimStringDesc*, copyStringRC1)(NimStringDesc* src);
static N_INLINE(void, nimGCunrefNoCycle)(void* p);
static N_INLINE(Cell47905*, usrtocell_51840)(void* usr);
static N_INLINE(void, rtladdzct_53401)(Cell47905* c);
N_NOINLINE(void, addzct_51817)(Cellseq47921* s, Cell47905* c);
STRING_LITERAL(TMP160, "\012  first - 1 <= last ", 21);
extern TFrame* frameptr_19436;
extern Gcheap50218 gch_50259;

static N_INLINE(NI, subInt)(NI a, NI b) {
	NI result;
{	result = 0;
	result = (NI)((NU64)(a) - (NU64)(b));
	{
		NIM_BOOL LOC3;
		LOC3 = 0;
		LOC3 = (((NI) 0) <= (NI)(result ^ a));
		if (LOC3) goto LA4;
		LOC3 = (((NI) 0) <= (NI)(result ^ (NI)((NU64) ~(b))));
		LA4: ;
		if (!LOC3) goto LA5;
		goto BeforeRet;
	}
	LA5: ;
	raiseOverflow();
	}BeforeRet: ;
	return result;
}

static N_INLINE(void, nimFrame)(TFrame* s) {
	NI LOC1;
	LOC1 = 0;
	{
		if (!(frameptr_19436 == NIM_NIL)) goto LA4;
		LOC1 = ((NI) 0);
	}
	goto LA2;
	LA4: ;
	{
		LOC1 = ((NI) ((NI16)((*frameptr_19436).calldepth + ((NI16) 1))));
	}
	LA2: ;
	(*s).calldepth = ((NI16) (LOC1));
	(*s).prev = frameptr_19436;
	frameptr_19436 = s;
	{
		if (!((*s).calldepth == ((NI16) 2000))) goto LA9;
		stackoverflow_22201();
	}
	LA9: ;
}

static N_INLINE(void, popFrame)(void) {
	frameptr_19436 = (*frameptr_19436).prev;
}

static N_INLINE(NI, HEX2A_103008)(NI x, NU8 order) {
	NI result;
	NI y;
	NI TMP148;
	NI TMP149;
	nimfr("*", "algorithm.nim")
	result = 0;
	nimln(24, "algorithm.nim");
	TMP148 = subInt(((NI) (order)), ((NI) 1));
	y = (NI)(TMP148);
	nimln(25, "algorithm.nim");
	TMP149 = subInt((NI)(x ^ ((NI) (y))), ((NI) (y)));
	result = (NI)(TMP149);
	popFrame();
	return result;
}

static N_INLINE(NI, addInt)(NI a, NI b) {
	NI result;
{	result = 0;
	result = (NI)((NU64)(a) + (NU64)(b));
	{
		NIM_BOOL LOC3;
		LOC3 = 0;
		LOC3 = (((NI) 0) <= (NI)(result ^ a));
		if (LOC3) goto LA4;
		LOC3 = (((NI) 0) <= (NI)(result ^ b));
		LA4: ;
		if (!LOC3) goto LA5;
		goto BeforeRet;
	}
	LA5: ;
	raiseOverflow();
	}BeforeRet: ;
	return result;
}

static N_INLINE(NI, chckRange)(NI i, NI a, NI b) {
	NI result;
{	result = 0;
	{
		NIM_BOOL LOC3;
		LOC3 = 0;
		LOC3 = (a <= i);
		if (!(LOC3)) goto LA4;
		LOC3 = (i <= b);
		LA4: ;
		if (!LOC3) goto LA5;
		result = i;
		goto BeforeRet;
	}
	goto LA1;
	LA5: ;
	{
		raiseRangeError(((NI64) (i)));
	}
	LA1: ;
	}BeforeRet: ;
	return result;
}

static N_INLINE(Cell47905*, usrtocell_51840)(void* usr) {
	Cell47905* result;
	nimfr("usrToCell", "gc.nim")
	result = 0;
	nimln(131, "gc.nim");
	result = ((Cell47905*) ((NI)((NU64)(((NI) (usr))) - (NU64)(((NI)sizeof(Cell47905))))));
	popFrame();
	return result;
}

static N_INLINE(void, rtladdzct_53401)(Cell47905* c) {
	nimfr("rtlAddZCT", "gc.nim")
	nimln(212, "gc.nim");
	addzct_51817((&gch_50259.zct), c);
	popFrame();
}

static N_INLINE(void, nimGCunrefNoCycle)(void* p) {
	Cell47905* c;
	nimfr("nimGCunrefNoCycle", "gc.nim")
	nimln(246, "gc.nim");
	c = usrtocell_51840(p);
	nimln(248, "gc.nim");
	{
		nimln(180, "gc.nim");
		(*c).refcount -= ((NI) 8);
		nimln(181, "gc.nim");
		if (!((NU64)((*c).refcount) < (NU64)(((NI) 8)))) goto LA3;
		nimln(249, "gc.nim");
		rtladdzct_53401(c);
	}
	LA3: ;
	popFrame();
}

N_NIMCALL(TY15805*, reversed_105864)(NimStringDesc** a, NI aLen0, NI first, NI last) {
	TY15805* result;
	NI i;
	NI TMP161;
	NI x;
	NI TMP162;
	nimfr("reversed", "algorithm.nim")
	result = 0;
	nimln(53, "algorithm.nim");
	{
		NI TMP159;
		TMP159 = subInt(((NI) (first)), ((NI) 1));
		if (!!((((NI) ((NI)(TMP159))) <= last))) goto LA3;
		failedassertimpl_89116(((NimStringDesc*) &TMP160));
	}
	LA3: ;
	nimln(54, "algorithm.nim");
	TMP161 = subInt(last, ((NI) (first)));
	i = (NI)(TMP161);
	nimln(55, "algorithm.nim");
	x = ((NI) (first));
	nimln(56, "algorithm.nim");
	TMP162 = addInt(i, ((NI) 1));
	result = newseq_105810(((NI)chckRange((NI)(TMP162), ((NI) 0), ((NI) IL64(9223372036854775807)))));
	{
		nimln(57, "algorithm.nim");
		while (1) {
			NimStringDesc* LOC7;
			NI TMP163;
			NI TMP164;
			nimln(353, "system.nim");
			if (!(((NI) 0) <= i)) goto LA6;
			nimln(58, "algorithm.nim");
			if ((NU)(i) >= (NU)(result->Sup.len)) raiseIndexError();
			if ((NU)(x) >= (NU)(aLen0)) raiseIndexError();
			LOC7 = 0;
			LOC7 = result->data[i]; result->data[i] = copyStringRC1(a[x]);
			if (LOC7) nimGCunrefNoCycle(LOC7);
			nimln(59, "algorithm.nim");
			TMP163 = subInt(i, ((NI) 1));
			i = (NI)(TMP163);
			nimln(60, "algorithm.nim");
			TMP164 = addInt(x, ((NI) 1));
			x = (NI)(TMP164);
		} LA6: ;
	}
	popFrame();
	return result;
}

N_NIMCALL(TY15805*, reversed_105848)(NimStringDesc** a, NI aLen0) {
	TY15805* result;
	nimfr("reversed", "algorithm.nim")
	result = 0;
	nimln(63, "algorithm.nim");
	nimln(64, "algorithm.nim");
	result = reversed_105864(a, aLen0, ((NI) 0), (aLen0-1));
	popFrame();
	return result;
}
NIM_EXTERNC N_NOINLINE(void, stdlib_algorithmInit000)(void) {
	nimfr("algorithm", "algorithm.nim")
	popFrame();
}

NIM_EXTERNC N_NOINLINE(void, stdlib_algorithmDatInit000)(void) {
}

