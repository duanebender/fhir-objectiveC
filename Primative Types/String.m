//
//  String.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "String.h"

@implementation String

@synthesize value = _value;

- (NSDictionary *)generateAndReturnDictionary
{
    NSDictionary *stringDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:_value, @"value", nil];
    return stringDictionary;
}

- (void)setValueString:(NSDictionary *)dictionary
{
    _value = [dictionary objectForKey:@"value"];
}

@end
