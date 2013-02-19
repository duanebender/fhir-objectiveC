//
//  Bool.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Bool.h"

@implementation Bool

@synthesize value = _value;
@synthesize original = _original;

- (NSDictionary *)generateAndReturnDictionary
{
    NSDictionary *boolDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:(_value)? @"true": @"false", @"value", nil];
    return boolDictionary;
}

@end