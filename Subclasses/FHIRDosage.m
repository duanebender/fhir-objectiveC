//
//  FHIRDosage.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRDosage.h"

@implementation FHIRDosage

@synthesize dosageDictionary = _dosageDictionary; //dictionary of all dosage resources
@synthesize timing = _timing; 
@synthesize site = _site;
@synthesize route = _route; 
@synthesize method = _method; 
@synthesize quantity = _quantity; 
@synthesize rate = _rate; 
@synthesize maxDosePerPeriod = _maxDosePerPeriod; 

- (id)init
{
    self = [super init];
    if (self) {
        _dosageDictionary = [[FHIRResourceDictionary alloc] init];
        _timing = [[FHIRSchedule alloc] init];
        _site = [[FHIRCodeableConcept alloc] init];
        _route = [[FHIRCodeableConcept alloc] init];
        _method = [[FHIRCodeableConcept alloc] init];
        _quantity = [[FHIRQuantity alloc] init];
        _rate = [[FHIRRatio alloc] init];
        _maxDosePerPeriod = [[FHIRRatio alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _dosageDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                [_timing generateAndReturnDictionary], @"timing",
                                                [_site generateAndReturnDictionary], @"site",
                                                [_route generateAndReturnDictionary], @"route",
                                                [_method generateAndReturnDictionary], @"method",
                                                [_quantity generateAndReturnDictionary], @"quantity",
                                                [_rate generateAndReturnDictionary], @"rate",
                                                [_maxDosePerPeriod generateAndReturnDictionary], @"maxDosePerPeriod",
                                                nil];
    _dosageDictionary.resourceName = @"Dosage";
    [_dosageDictionary cleanUpDictionaryValues];
    return _dosageDictionary.dataForResource;
}

- (void)dosageParser:(NSDictionary *)dictionary
{
    [_timing scheduleParser:[dictionary objectForKey:@"timing"]];
    [_site codeableConceptParser:[dictionary objectForKey:@"site"]];
    [_route codeableConceptParser:[dictionary objectForKey:@"route"]];
    [_method codeableConceptParser:[dictionary objectForKey:@"method"]];
    [_quantity quantityParser:[dictionary objectForKey:@"quantity"]];
    [_rate ratioParser:[dictionary objectForKey:@"rate"]];
    [_maxDosePerPeriod ratioParser:[dictionary objectForKey:@"maxDosePerPeriod"]];
}

@end
