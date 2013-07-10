//
//  Code.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRCode.h"
#import "FHIRExistanceChecker.h"

@implementation FHIRCode

@synthesize value = _value;

- (NSObject *)generateAndReturnDictionary
{
    NSDictionary *codeDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:_value, @"value", nil];
    return [FHIRExistanceChecker emptyObjectChecker:codeDictionary];
}

- (void)setValueCode:(NSDictionary *)dictionary
{
    _value = [dictionary objectForKey:@"value"];
}

@end
