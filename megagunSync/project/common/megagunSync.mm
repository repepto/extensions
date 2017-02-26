#include "Utils.h"
#import<Foundation/Foundation.h>


namespace megagunsync {

	void Save(const char *v, const char *k) {

		NSString *val = [[NSString alloc] initWithUTF8String:v];
		NSString *key = [[NSString alloc] initWithUTF8String:k];

		[[NSUserDefaults standardUserDefaults]setObject:val forKey:key];
		[[NSUserDefaults standardUserDefaults]synchronize];
	}

	const char *Load(const char *k)
	{
		NSString *key = [[NSString alloc] initWithUTF8String:k];

		NSString *val=[[NSUserDefaults standardUserDefaults]objectForKey:key];

		return [val UTF8String];
	}
	
	
}
