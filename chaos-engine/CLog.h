//
//  CLog.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/11/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
    #define clog(args...) _clog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args)
#else
    #define clog(x...)
#endif

#ifdef WARNING
    #define cwarning(args...) _cwarning(__FILE__, __LINE__, __PRETTY_FUNCTION__, args)
#else
    #define cwarning(x...)
#endif

#ifdef ERROR
    #define cerror(args...) _cerror(__FILE__, __LINE__, __PRETTY_FUNCTION__, args)
#else
    #define cerror(x...)
#endif

@interface CLog : NSObject

void _clog(const char *fileName, int lineNumber, const char *methodName, NSString *format, ...);
void _cwarning(const char *fileName, int lineNumber, const char *methodName, NSString *format, ...);
void _cerror(const char *fileName, int lineNumber, const char *methodName, NSString *format, ...);

@end
