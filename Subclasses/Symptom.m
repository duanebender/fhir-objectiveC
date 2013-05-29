//
//  Symptom.m
//  FHIR
//
//  Created by Adam Sippel on 2013-05-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Symptom.h"

@implementation Symptom

@synthesize symptomDictionary = _symptomDictionary; //a dictionary containing all resources in this Symptom object
@synthesize code = _code; //the symptom and information about it.
@synthesize severity = _severity; //The severety of the symptom.

- (id)init
{
    self = [super init];
    if (self) {
        _symptomDictionary = [[FHIRResourceDictionary alloc] init];
        _code = [[CodeableConcept alloc] init];
        _severity = [[Code alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _symptomDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [_code generateAndReturnDictionary], @"code",
                                           [_severity generateAndReturnDictionary], @"severity",
                                           nil];
    _symptomDictionary.resourceName = @"Symptom";
    [_symptomDictionary cleanUpDictionaryValues];
    return _symptomDictionary.dataForResource;
}

- (void)languageParser:(NSDictionary *)dictionary
{
    [_code codeableConceptParser:[dictionary objectForKey:@"code"]];
    [_severity setValueCode:[dictionary objectForKey:@"severity"]];
}

@end
