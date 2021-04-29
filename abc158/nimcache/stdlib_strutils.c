/* Generated by Nim Compiler v0.13.0 */
/*   (c) 2015 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w  -I/home/dotharaai/.choosenim/toolchains/nim-0.13.0/lib -o /home/dotharaai/projects/nim/abc158/nimcache/stdlib_strutils.o /home/dotharaai/projects/nim/abc158/nimcache/stdlib_strutils.c */
#define NIM_INTBITS 64

#include "nimbase.h"
#include <string.h>
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct Valueerror3646 Valueerror3646;
typedef struct Exception Exception;
typedef struct TNimObject TNimObject;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct Cell47905 Cell47905;
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
typedef struct TY15805 TY15805;
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
struct  TNimObject  {
TNimType* m_type;
};
struct  Exception  {
  TNimObject Sup;
Exception* parent;
NCSTRING name;
NimStringDesc* message;
NimStringDesc* trace;
};
struct  Valueerror3646  {
  Exception Sup;
};
struct  TNimNode  {
NU8 kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
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
struct  Freecell30030  {
Freecell30030* next;
NI zerofield;
};
struct TY15805 {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};
N_NIMCALL(NI, npuParseInt)(NimStringDesc* s, NI* number, NI start);
N_NIMCALL(void*, newObj)(TNimType* typ, NI size);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
N_NIMCALL(NimStringDesc*, rawNewString)(NI space);
static N_INLINE(void, asgnRefNoCycle)(void** dest, void* src);
static N_INLINE(Cell47905*, usrtocell_51840)(void* usr);
static N_INLINE(void, nimFrame)(TFrame* s);
N_NOINLINE(void, stackoverflow_22201)(void);
static N_INLINE(void, popFrame)(void);
static N_INLINE(void, rtladdzct_53401)(Cell47905* c);
N_NOINLINE(void, addzct_51817)(Cellseq47921* s, Cell47905* c);
N_NIMCALL(void, raiseException)(Exception* e, NCSTRING ename);
N_NIMCALL(void*, newSeq)(TNimType* typ, NI len);
N_NIMCALL(NimStringDesc*, copyStrLast)(NimStringDesc* s, NI start_80210, NI last);
N_NIMCALL(NimStringDesc*, copyStrLast)(NimStringDesc* s, NI first, NI last);
static N_INLINE(NIM_BOOL, eqStrings)(NimStringDesc* a, NimStringDesc* b);
N_NIMCALL(TGenericSeq*, incrSeqV2)(TGenericSeq* seq, NI elemsize);
N_NIMCALL(NimStringDesc*, copyStringRC1)(NimStringDesc* src);
static N_INLINE(void, nimGCunrefNoCycle)(void* p);
N_NIMCALL(NimStringDesc*, rawNewString)(NI cap);
N_NIMCALL(NimStringDesc*, resizeString)(NimStringDesc* dest, NI addlen);
N_NIMCALL(NimStringDesc*, copyString)(NimStringDesc* src);
STRING_LITERAL(TMP177, "invalid integer: ", 17);
STRING_LITERAL(TMP182, "", 0);
extern TNimType NTI24025; /* ref ValueError */
extern TNimType NTI3646; /* ValueError */
extern TFrame* frameptr_19436;
extern Gcheap50218 gch_50259;
extern TNimType NTI15805; /* seq[string] */

static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src) {
	memcpy(((NCSTRING) ((&(*dest).data[((*dest).Sup.len)- 0]))), ((NCSTRING) ((*src).data)), (NI)((*src).Sup.len + ((NI) 1)));
	(*dest).Sup.len += (*src).Sup.len;
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

static N_INLINE(void, asgnRefNoCycle)(void** dest, void* src) {
	nimfr("asgnRefNoCycle", "gc.nim")
	nimln(264, "gc.nim");
	{
		Cell47905* c;
		nimln(349, "system.nim");
		if (!!((src == NIM_NIL))) goto LA3;
		nimln(265, "gc.nim");
		c = usrtocell_51840(src);
		nimln(182, "gc.nim");
		(*c).refcount += ((NI) 8);
	}
	LA3: ;
	nimln(267, "gc.nim");
	{
		Cell47905* c;
		nimln(349, "system.nim");
		if (!!(((*dest) == NIM_NIL))) goto LA7;
		nimln(268, "gc.nim");
		c = usrtocell_51840((*dest));
		nimln(269, "gc.nim");
		{
			nimln(180, "gc.nim");
			(*c).refcount -= ((NI) 8);
			nimln(181, "gc.nim");
			if (!((NU64)((*c).refcount) < (NU64)(((NI) 8)))) goto LA11;
			nimln(270, "gc.nim");
			rtladdzct_53401(c);
		}
		LA11: ;
	}
	LA7: ;
	nimln(271, "gc.nim");
	(*dest) = src;
	popFrame();
}

N_NIMCALL(NI, nsuParseInt)(NimStringDesc* s) {
	NI result;
	NI L;
	nimfr("parseInt", "strutils.nim")
	result = 0;
	L = npuParseInt(s, (&result), ((NI) 0));
	{
		NIM_BOOL LOC3;
		Valueerror3646* e_98655;
		NimStringDesc* LOC7;
		LOC3 = 0;
		LOC3 = !((L == (s ? s->Sup.len : 0)));
		if (LOC3) goto LA4;
		LOC3 = (L == ((NI) 0));
		LA4: ;
		if (!LOC3) goto LA5;
		e_98655 = 0;
		e_98655 = (Valueerror3646*) newObj((&NTI24025), sizeof(Valueerror3646));
		(*e_98655).Sup.Sup.m_type = (&NTI3646);
		LOC7 = 0;
		LOC7 = rawNewString(s->Sup.len + 17);
appendString(LOC7, ((NimStringDesc*) &TMP177));
appendString(LOC7, s);
		asgnRefNoCycle((void**) (&(*e_98655).Sup.message), LOC7);
		raiseException((Exception*)e_98655, "ValueError");
	}
	LA5: ;
	popFrame();
	return result;
}

static N_INLINE(NIM_BOOL, eqStrings)(NimStringDesc* a, NimStringDesc* b) {
	NIM_BOOL result;
	NIM_BOOL LOC11;
	int LOC13;
{	result = 0;
	{
		if (!(a == b)) goto LA3;
		result = NIM_TRUE;
		goto BeforeRet;
	}
	LA3: ;
	{
		NIM_BOOL LOC7;
		LOC7 = 0;
		LOC7 = (a == NIM_NIL);
		if (LOC7) goto LA8;
		LOC7 = (b == NIM_NIL);
		LA8: ;
		if (!LOC7) goto LA9;
		result = NIM_FALSE;
		goto BeforeRet;
	}
	LA9: ;
	LOC11 = 0;
	LOC11 = ((*a).Sup.len == (*b).Sup.len);
	if (!(LOC11)) goto LA12;
	LOC13 = 0;
	LOC13 = memcmp(((NCSTRING) ((*a).data)), ((NCSTRING) ((*b).data)), (*a).Sup.len);
	LOC11 = (LOC13 == ((NI32) 0));
	LA12: ;
	result = LOC11;
	goto BeforeRet;
	}BeforeRet: ;
	return result;
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

N_NIMCALL(TY15805*, nsuSplitString)(NimStringDesc* s, NimStringDesc* sep) {
	TY15805* result;
	nimfr("split", "strutils.nim")
	result = 0;
	result = (TY15805*) newSeq((&NTI15805), 0);
	{
		NimStringDesc* x_98483;
		NI last_98514;
		x_98483 = 0;
		last_98514 = ((NI) 0);
		{
			if (!(((NI) 0) < (s ? s->Sup.len : 0))) goto LA4;
			{
				while (1) {
					NI first_98516;
					NimStringDesc* LOC13;
					if (!(last_98514 <= (s ? s->Sup.len : 0))) goto LA7;
					first_98516 = last_98514;
					{
						while (1) {
							NIM_BOOL LOC10;
							NimStringDesc* LOC12;
							LOC10 = 0;
							LOC10 = (last_98514 < (s ? s->Sup.len : 0));
							if (!(LOC10)) goto LA11;
							LOC12 = 0;
							LOC12 = copyStrLast(s, last_98514, (NI)(last_98514 + ((sep ? sep->Sup.len : 0) - 1)));
							LOC10 = !(eqStrings(LOC12, sep));
							LA11: ;
							if (!LOC10) goto LA9;
							last_98514 += ((NI) 1);
						} LA9: ;
					}
					x_98483 = copyStrLast(s, first_98516, (NI)(last_98514 - ((NI) 1)));
					result = (TY15805*) incrSeqV2(&(result)->Sup, sizeof(NimStringDesc*));
					LOC13 = 0;
					LOC13 = result->data[result->Sup.len]; result->data[result->Sup.len] = copyStringRC1(x_98483);
					if (LOC13) nimGCunrefNoCycle(LOC13);
					++result->Sup.len;
					last_98514 += (sep ? sep->Sup.len : 0);
				} LA7: ;
			}
		}
		LA4: ;
	}
	popFrame();
	return result;
}

N_NIMCALL(NimStringDesc*, nsuJoin)(NimStringDesc** a, NI aLen0) {
	NimStringDesc* result;
	nimfr("join", "strutils.nim")
	result = 0;
	{
		NI L;
		if (!(((NI) 0) < aLen0)) goto LA3;
		L = ((NI) 0);
		{
			NI i_99468;
			NI HEX3Atmp_99489;
			NI res_99492;
			i_99468 = 0;
			HEX3Atmp_99489 = 0;
			HEX3Atmp_99489 = (aLen0-1);
			res_99492 = ((NI) 0);
			{
				while (1) {
					if (!(res_99492 <= HEX3Atmp_99489)) goto LA7;
					i_99468 = res_99492;
					L += (a[i_99468] ? a[i_99468]->Sup.len : 0);
					res_99492 += ((NI) 1);
				} LA7: ;
			}
		}
		result = rawNewString(((NI) (L)));
		{
			NI i_99487;
			NI HEX3Atmp_99497;
			NI res_99500;
			i_99487 = 0;
			HEX3Atmp_99497 = 0;
			HEX3Atmp_99497 = (aLen0-1);
			res_99500 = ((NI) 0);
			{
				while (1) {
					if (!(res_99500 <= HEX3Atmp_99497)) goto LA10;
					i_99487 = res_99500;
					result = resizeString(result, a[i_99487]->Sup.len + 0);
appendString(result, a[i_99487]);
					res_99500 += ((NI) 1);
				} LA10: ;
			}
		}
	}
	goto LA1;
	LA3: ;
	{
		result = copyString(((NimStringDesc*) &TMP182));
	}
	LA1: ;
	popFrame();
	return result;
}
NIM_EXTERNC N_NOINLINE(void, stdlib_strutilsInit000)(void) {
	nimfr("strutils", "strutils.nim")
	popFrame();
}

NIM_EXTERNC N_NOINLINE(void, stdlib_strutilsDatInit000)(void) {
}

