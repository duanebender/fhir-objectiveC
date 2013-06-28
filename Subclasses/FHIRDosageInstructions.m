//
//  FHIRDosageInstructions.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRDosageInstructions.h"

@implementation FHIRDosageInstructions

@synthesize dosageInstructionsDictionary = _dosageInstructionsDictionary; //dictionary of all dosageInstructions resources
@synthesize dosageInstructionsText = _dosageInstructionsText; //
@synthesize additionalInstructionsX = _additionalInstructionsX; //
@synthesize timing = _timing; //
@synthesize site = _site; //
@synthesize route = _route; //
@synthesize method = _method; //
@synthesize doseQuantity = _doseQuantity; //
@synthesize rate = _rate; //
@synthesize maxDosePerPeriod = _maxDosePerPeriod; //

- (id)init
{
    self = [super init];
    if (self) {
        _dosageInstructionsDictionary = [[FHIRResourceDictionary alloc] init];
        _dosageInstructionsText = [[FHIRString alloc] init];
        _additionalInstructionsX = [[NSArray alloc] init];
        _timing = [[FHIRSchedule alloc] init];
        _site = [[FHIRCodeableConcept alloc] init];
        _route = [[FHIRCodeableConcept alloc] init];
        _method = [[FHIRCodeableConcept alloc] init];
        _doseQuantity = [[FHIRQuantity alloc] init];
        _rate = [[FHIRRatio alloc] init];
        _maxDosePerPeriod = [[FHIRRatio alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    //find additionalInstructions type to set for xml tag
    NSString *addInstTagString = [[NSString alloc] init];
    if ([_additionalInstructionsX count] == 1)
    {
        if ([[_additionalInstructionsX objectAtIndex:0] class] == [FHIRString class]) addInstTagString = [NSString stringWithFormat:@"additionalInstructionsString"];
        else if ([[_additionalInstructionsX objectAtIndex:0] class] == [FHIRCodeableConcept class]) addInstTagString = [NSString stringWithFormat:@"additionalInstructionsCodeableConcept"];
        else addInstTagString = [NSString stringWithFormat:@"additionalInstructions?"];
    }
    
    _dosageInstructionsDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     [_dosageInstructionsText generateAndReturnDictionary], @"dosageInstructionsText",
                                                     [FHIRExistanceChecker checkEmptySingleObjectArray:_additionalInstructionsX], addInstTagString,
                                                     [_timing generateAndReturnDictionary], @"timing",
                                                     [_site generateAndReturnDictionary], @"site",
                                                     [_route generateAndReturnDictionary], @"route",
                                                     [_method generateAndReturnDictionary], @"method",
                                                     [_doseQuantity generateAndReturnDictionary], @"doseQuantity",
                                                     [_rate generateAndReturnDictionary], @"rate",
                                                     [_maxDosePerPeriod generateAndReturnDictionary], @"maxDosePerPeriod",
                                               nil];
    _dosageInstructionsDictionary.resourceName = @"DosageInstructions";
    [_dosageInstructionsDictionary cleanUpDictionaryValues];
    return _dosageInstructionsDictionary.dataForResource;
}

- (void)dosageInstructionsParser:(NSDictionary *)dictionary
{
    [_dosageInstructionsText setValueString:[dictionary objectForKey:@"dosageInstructionsText"]];
    
    //sets additionalInstructions array with the correct object sent
    for (NSString *key in dictionary)
    {
        if ([key isEqualToString:@"additionalInstructionsString"])
        {
            FHIRString *addInstString = [[FHIRString alloc] init];
            [addInstString setValueString:[dictionary objectForKey:@"additionalInstructionsString"]];
            _additionalInstructionsX = [[NSArray alloc] initWithObjects:addInstString, nil];
        }
        if ([key isEqualToString:@"additionalInstructionsCodeableConcept"])
        {
            FHIRCodeableConcept *addInstCodeableConcept = [[FHIRCodeableConcept alloc] init];
            [addInstCodeableConcept codeableConceptParser:[dictionary objectForKey:@"additionalInstructionsCodeableConcept"]];
            _additionalInstructionsX = [[NSArray alloc] initWithObjects:addInstCodeableConcept, nil];
        }
    }
    
    [_timing scheduleParser:[dictionary objectForKey:@"timing"]];
    [_site codeableConceptParser:[dictionary objectForKey:@"site"]];
    [_route codeableConceptParser:[dictionary objectForKey:@"route"]];
    [_method codeableConceptParser:[dictionary objectForKey:@"method"]];
    [_doseQuantity quantityParser:[dictionary objectForKey:@"doseQuantity"]];
    [_rate ratioParser:[dictionary objectForKey:@"rate"]];
    [_maxDosePerPeriod ratioParser:[dictionary objectForKey:@"maxDosePerPeriod"]];
    
}

@end
