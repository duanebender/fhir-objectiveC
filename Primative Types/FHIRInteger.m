//
//  FHIRInteger.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRInteger.h"

@implementation FHIRInteger

@synthesize value = _value;

- (NSDictionary *)generateAndReturnDictionary
{
    NSDictionary *integerDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:_value, @"value", nil];
    return integerDictionary;
}

- (void)setValueInteger:(NSDictionary *)dictionary
{
    _value = [[NSNumber alloc] initWithInteger:[[dictionary objectForKey:@"value"] intValue]];
}

@end
