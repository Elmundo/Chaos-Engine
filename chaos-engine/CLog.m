//
//  CLog.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/11/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CLog.h"

@implementation CLog

void _clog(const char *fileName, int lineNumber, const char *methodName, NSString *format, ...)
{
    // Type to hold information about variable arguments.
    va_list ap;
    
    // Initialize a variable argument list
    va_start(ap, format);
    
    // NSLog only adds a newline to the end of the NSLog format if one is not already there.
    if (![format hasSuffix:@"\n"]) {
        format = [format stringByAppendingString:@"\n"];
    }
    
    NSString *body  = [[NSString alloc] initWithFormat:format arguments:ap];
    
    // End using variable argument list.
    va_end(ap);
    
    NSString *fileNameStr = [[NSString stringWithUTF8String:fileName] lastPathComponent];
    fprintf(stderr, "LOG: (%s) (%s:%d) %s", methodName, [fileNameStr UTF8String],
                                       lineNumber, [body UTF8String]);
}

void _cwarning(const char *fileName, int lineNumber, const char *methodName, NSString *format, ...)
{
    // Type to hold information about variable arguments.
    va_list ap;
    
    // Initialize a variable argument list
    va_start(ap, format);
    
    // NSLog only adds a newline to the end of the NSLog format if one is not already there.
    if (![format hasSuffix:@"\n"]) {
        format = [format stringByAppendingString:@"\n"];
    }
    
    NSString *body  = [[NSString alloc] initWithFormat:format arguments:ap];
    
    // End using variable argument list.
    va_end(ap);
    
    NSString *fileNameStr = [[NSString stringWithUTF8String:fileName] lastPathComponent];
    fprintf(stderr, "WARNING: (%s) (%s:%d) %s", methodName, [fileNameStr UTF8String],
            lineNumber, [body UTF8String]);
}

void _cerror(const char *fileName, int lineNumber, const char *methodName, NSString *format, ...)
{
    // Type to hold information about variable arguments.
    va_list ap;
    
    // Initialize a variable argument list
    va_start(ap, format);
    
    // NSLog only adds a newline to the end of the NSLog format if one is not already there.
    if (![format hasSuffix:@"\n"]) {
        format = [format stringByAppendingString:@"\n"];
    }
    
    NSString *body  = [[NSString alloc] initWithFormat:format arguments:ap];
    
    // End using variable argument list.
    va_end(ap);
    
    NSString *fileNameStr = [[NSString stringWithUTF8String:fileName] lastPathComponent];
    fprintf(stderr, "ERROR: (%s) (%s:%d) %s", methodName, [fileNameStr UTF8String],
            lineNumber, [body UTF8String]);
}

@end
