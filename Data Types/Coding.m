//
//  Coding.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Coding.h"

@implementation Coding

@synthesize codingDictionary = _codingDictionary;

@synthesize system = _system; //The identification of the system that defines the meaning of the symbol in the code. Can be a simple list of enumerations, a list of codes with meanings or all the way to a complex semantic web such as SNOMED-CT, whether classification, terminology, or ontology
@synthesize code = _code; //A symbol in syntax defined by the system. The symbol may be a predefined code or an expression in a syntax defined by the coding system
@synthesize display = _display; //A representation of the meaning of the code in the system, following the rules laid out by the system.

- (id)init
{
    self = [super init];
    if (self) {
        _codingDictionary = [[FHIRResourceDictionary alloc] init];
        _system = [[Uri alloc] init];
        _code = [[Code alloc] init];
        _display = [[String alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _codingDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [_system generateAndReturnDictionary], @"system",
                                          [_code generateAndReturnDictionary], @"code",
                                          [_display generateAndReturnDictionary], @"display",
                                          nil];
    _codingDictionary.resourceName = @"Coding";
    return _codingDictionary.dataForResource;
}

- (void)codingParser:(NSDictionary *)dictionary
{
    [_system setValueURI:[dictionary objectForKey:@"system"]];
    [_code setValueCode:[dictionary objectForKey:@"code"]];
    [_display setValueString:[dictionary objectForKey:@"display"]];
}

@end
