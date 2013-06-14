//
//  Exposure.m
//  FHIR
//
//  Created by Adam Sippel on 2013-05-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRExposure.h"

@implementation FHIRExposure

@synthesize exposureDictionary = _exposureDictionary; //a dictionary containing all resources in this Symptom object
@synthesize exposureDate = _exposureDate; //Date initially exposed.
@synthesize exposureType = _exposureType; //Drug Administration, Immunization, Coincidental
@synthesize causalityExpectation = _causalityExpectation; //A statement of how confident that the recorder was that this exposure caused the reaction.
@synthesize substance = _substance; //Substance(s) that is presumed to have caused the adverse reaction.

- (id)init
{
    self = [super init];
    if (self) {
        _exposureDictionary = [[FHIRResourceDictionary alloc] init];
        _exposureDate = [[NSDate alloc] init];
        _exposureType = [[FHIRCode alloc] init];
        _causalityExpectation = [[FHIRCode alloc] init];
        _substance = [[FHIRResource alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _exposureDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [NSDateFormatter localizedStringFromDate:_exposureDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"exposureDate",
                                          [_exposureType generateAndReturnDictionary], @"exposureType",
                                          [_causalityExpectation generateAndReturnDictionary], @"causalityExpectation",
                                          [_substance generateAndReturnDictionary], @"substance",
                                          nil];
    _exposureDictionary.resourceName = @"Exposure";
    [_exposureDictionary cleanUpDictionaryValues];
    return _exposureDictionary.dataForResource;
}

- (void)exposureParser:(NSDictionary *)dictionary
{
    _exposureDate = [FHIRExistanceChecker generateDateTimeFromString:[dictionary objectForKey:@"exposureDate"]];
    [_exposureType setValueCode:[dictionary objectForKey:@"exposureType"]];
    [_causalityExpectation setValueCode:[dictionary objectForKey:@"causalityExpectation"]];
    [_substance resourceParser:[dictionary objectForKey:@"substance"]];
}

@end
