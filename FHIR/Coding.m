//
//  Coding.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Coding.h"

@implementation Coding

- (Uri *)getSystem
{
    return self.system;
}

+ (void)setSystem:(Uri *)value
{
    self.system = value;
}

- (Code *)getCode
{
    return self.code;
}

+ (void)setCode:(Code *)value
{
    self.code = value;
}

- (String_ *)getDisplay
{
    return self.display;
}

+ (void)setDisplay:(String_ *)value
{
    self.display = value;
}

@end
