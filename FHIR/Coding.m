//
//  Coding.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Coding.h"

@implementation Coding

+ (Uri)getSystem
{
    return self.system;
}

+ (void)setSystem:(Uri *)value
{
    self.system = value;
}

+ (Code)getCode
{
    return self.code;
}

+ (void)setCode:(Code *)value
{
    self.code = value;
}

+ (NSString *)getDisplay
{
    return self.display;
}

+ (void)setDisplay:(NSString *)value
{
    self.display = value;
}

@end
