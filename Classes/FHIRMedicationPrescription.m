//
//  FHIRMedicationPrescription.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRMedicationPrescription.h"

@implementation FHIRMedicationPrescription

@synthesize medicationPrescriptionDictionary = _medicationPrescriptionDictionary;
@synthesize resourceTypeValue = _resourceTypeValue;
@synthesize identifier = _identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY.
@synthesize dateWritten = _dateWritten; 
@synthesize status = _status;
@synthesize patient = _patient;
@synthesize prescriber = _prescriber;
@synthesize visit = _visit;
@synthesize reasonForPrescribingX = _reasonForPrescribingX;
@synthesize medication = _medication;
@synthesize dosageInstructions = _dosageInstructions; //THIS ARRAY CONTAINS "DosageInstructions" OBJECTS ONLY.
@synthesize dispense = _dispense;
@synthesize substitution = _substitution;

- (id)init
{
    self = [super init];
    if (self) {
        _medicationPrescriptionDictionary = [[FHIRResourceDictionary alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        _dateWritten = [[NSDate alloc] init];
        _status = [[FHIRCodeableConcept alloc] init];
        _patient = [[FHIRResourceReference alloc] init];
        _prescriber = [[FHIRResourceReference alloc] init];
        _visit = [[FHIRResourceReference alloc] init];
        _resourceTypeValue = [[FHIRResource alloc] init];
        _reasonForPrescribingX = [[NSArray alloc] init];
        _medication = [[FHIRResourceReference alloc] init];
        _dosageInstructions = [[NSMutableArray alloc] init];
        _dispense = [[FHIRMedicationPrescriptionDispense alloc] init];
        _substitution = [[FHIRMedicationPrescriptionSubstitution alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return [_resourceTypeValue returnResourceType];
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    //find multipleBirth type to set for xml tag
    NSString *reasonPrescribeTagString = [[NSString alloc] init];
    if ([_reasonForPrescribingX count] == 1)
    {
        if ([[_reasonForPrescribingX objectAtIndex:0] class] == [FHIRString class]) reasonPrescribeTagString = [NSString stringWithFormat:@"reasonForPresribingString"];
        else if ([[_reasonForPrescribingX objectAtIndex:0] class] == [FHIRCodeableConcept class]) reasonPrescribeTagString = [NSString stringWithFormat:@"reasonForPrescribingCodeableConcept"];
        else reasonPrescribeTagString = [NSString stringWithFormat:@"reasonForPrescribing?"];
    }
    
    _medicationPrescriptionDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [FHIRExistanceChecker generateArray:_identifier], @"identifier",
                                          [NSDateFormatter localizedStringFromDate:_dateWritten dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"dateWritten",
                                          [_status generateAndReturnDictionary], @"status",
                                          [_patient generateAndReturnDictionary], @"patient",
                                          [_resourceTypeValue.text generateAndReturnDictionary], @"text",
                                          [_prescriber generateAndReturnDictionary], @"prescriber",
                                          [_visit generateAndReturnDictionary], @"visit",
                                          [FHIRExistanceChecker generateArray:_resourceTypeValue.extensions], @"extension",
                                          [FHIRExistanceChecker generateArray:_resourceTypeValue.contained], @"contained",
                                          [FHIRExistanceChecker checkEmptySingleObjectArray:_reasonForPrescribingX], reasonPrescribeTagString,
                                          [_medication generateAndReturnDictionary], @"medication",
                                          [FHIRExistanceChecker generateArray:_dosageInstructions], @"dosageInstructions",
                                          [_dispense generateAndReturnDictionary], @"dispense",
                                          [_substitution generateAndReturnDictionary], @"substitution",
                                          nil];
    [_medicationPrescriptionDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_medicationPrescriptionDictionary.dataForResource, @"MedicationPrescription", nil];
    returnable.resourceName = @"medicationPrescription";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)medicationPrescriptionParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"medicationPrescription"];
    NSDictionary *medPresDict = [dictionary objectForKey:@"MedicationPrescription"];
    
    [_resourceTypeValue resourceParser:medPresDict];
    //NSLog(@"%@", medPresDict);
    
    //_identifier
    NSArray *identifierArray = [[NSArray alloc] initWithArray:[medPresDict objectForKey:@"identifier"]];
    _identifier = [[NSMutableArray alloc] init];
    for (int i = 0; i < [identifierArray count]; i++)
    {
        FHIRIdentifier *tempID = [[FHIRIdentifier alloc] init];
        [tempID identifierParser:[identifierArray objectAtIndex:i]];
        [_identifier addObject:tempID];
    }
    
    _dateWritten = [FHIRExistanceChecker generateDateTimeFromString:[medPresDict objectForKey:@"dateWritten"]];
    [_status codeableConceptParser:[medPresDict objectForKey:@"status"]];
    [_patient resourceReferenceParser:[medPresDict objectForKey:@"patient"]];
    [_prescriber resourceReferenceParser:[medPresDict objectForKey:@"prescriber"]];
    [_visit resourceReferenceParser:[medPresDict objectForKey:@"visit"]];
    
    //sets reasonForPrescribing array with the correct object sent
    for (NSString *key in dictionary)
    {
        if ([key isEqualToString:@"reasonForPrescribingString"] == TRUE)
        {
            FHIRString *reasonPresString = [[FHIRString alloc] init];
            [reasonPresString setValueString:[medPresDict objectForKey:@"reasonForPrescribingString"]];
            _reasonForPrescribingX = [[NSArray alloc] initWithObjects:reasonPresString, nil];
        }
        else if ([key isEqualToString:@"reasonForPrescribingCodeableConcept"] == TRUE)
        {
            FHIRCodeableConcept *reasonPresCC = [[FHIRCodeableConcept alloc] init];
            [reasonPresCC codeableConceptParser:[medPresDict objectForKey:@"reasonForPrescribingCodeableConcept"]];
            _reasonForPrescribingX = [[NSArray alloc] initWithObjects:reasonPresCC, nil];
        }
        
    }
    
    [_medication resourceReferenceParser:[medPresDict objectForKey:@"medication"]];
    
    //_diagnoseInstructions
    NSArray *doseInstArray = [[NSArray alloc] initWithArray:[medPresDict objectForKey:@"dosageInstructions"]];
    _dosageInstructions = [[NSMutableArray alloc] init];
    for (int i = 0; i < [doseInstArray count]; i++)
    {
        FHIRDosageInstructions *tempDI = [[FHIRDosageInstructions alloc] init];
        [tempDI dosageInstructionsParser:[doseInstArray objectAtIndex:i]];
        [_dosageInstructions addObject:tempDI];
        //NSLog(@"%@", _dosageInstructions);
    }
    
    [_dispense dispenseParser:[medPresDict objectForKey:@"dispense"]];
    [_substitution substitutionParser:[medPresDict objectForKey:@"substitution"]];
    
}

@end
