//
//  String.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRString.h"
#import "FHIRExistanceChecker.h"

@implementation FHIRString

@synthesize value = _value;

- (NSObject *)generateAndReturnDictionary
{
    NSObject *stringObject;
    stringObject = [FHIRExistanceChecker primitiveValueChecker:[[NSDictionary alloc] initWithObjectsAndKeys:_value, @"value", nil]];
    return stringObject;
}

- (void)setValueString:(NSDictionary *)dictionary
{
    _value = [dictionary objectForKey:@"value"];
}

@end
