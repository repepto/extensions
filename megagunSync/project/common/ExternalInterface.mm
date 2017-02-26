#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"


using namespace megagunsync;

static void megagunsync_save (value val, value key) {

    Save(val_string(val), val_string(key));
}
DEFINE_PRIM (megagunsync_save, 2);


static value megagunsync_load (value key) {

    const char *ret = Load(val_string(key));

    if(!ret) 
	{
		return alloc_null();
	}
    else return alloc_string(ret);
}
DEFINE_PRIM (megagunsync_load, 1);



extern "C" void megagunsync_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (megagunsync_main);



extern "C" int megagunsync_register_prims () { return 0; }
