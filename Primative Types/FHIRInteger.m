//
//  FHIRInteger.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRInteger.h"
#import "FHIRExistanceChecker.h"

@implementation FHIRInteger

@synthesize value = _value;

- (NSObject *)generateAndReturnDictionary
{
    NSObject *integerObject;
    integerObject = [FHIRExistanceChecker primitiveValueChecker:[[NSDictionary alloc] initWithObjectsAndKeys:_value, @"value", nil]];
    return integerObject;
}

- (void)setValueInteger:(NSDictionary *)dictionary
{
    _value = [[NSNumber alloc] initWithInteger:[[dictionary objectForKey:@"value"] intValue]];
}

@end
