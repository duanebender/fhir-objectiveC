//
//  Code.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Code.h"

@implementation Code

@synthesize value = _value;

- (NSDictionary *)generateAndReturnDictionary
{
    NSDictionary *codeDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:_value, @"value", nil];
    return codeDictionary;
}

- (void)setValueCode:(NSDictionary *)dictionary
{
    _value = [dictionary objectForKey:@"value"];
}

@end
