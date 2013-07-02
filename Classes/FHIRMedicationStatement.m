//
//  FHIRMedicationStatement.m
//  FHIR
//
//  Created by Adam Sippel on 2013-07-02.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRMedicationStatement.h"
#import "FHIRDosage.h"

@implementation FHIRMedicationStatement

@synthesize medicationStatementDictionary = _medicationStatementDictionary; //a dictionary containing all resources in this medicationStatement object
@synthesize resourceTypeValue = _resourceTypeValue; //holds resource type, text, name, and extensions of this resource
@synthesize identifier = _identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY.
@synthesize patient = _patient; //(Patient)
@synthesize wasNotGiven = _wasNotGiven;
@synthesize reasonNotGiven = _reasonNotGiven; //THIS ARRAY CONTAINS "CodeableConcept" OBJECTS ONLY.
@synthesize whenGiven = _whenGiven;
@synthesize medication = _medication; //(Medication)
@synthesize administrationDevice = _administrationDevice; //THIS ARRAY CONTAINS "ResourceReference(Device)" OBJECTS ONLY.
@synthesize dosage = _dosage; //THIS ARRAY CONTAINS "Dosage" OBJECTS ONLY.

- (id)init
{
    self = [super init];
    if (self) {
        _medicationStatementDictionary = [[FHIRResourceDictionary alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        _patient = [[FHIRResourceReference alloc] init];
        _resourceTypeValue = [[FHIRResource alloc] init];
        _wasNotGiven = [[FHIRBool alloc] init];
        _reasonNotGiven = [[NSMutableArray alloc] init];
        _whenGiven = [[FHIRPeriod alloc] init];
        _medication = [[FHIRResourceReference alloc] init];
        _administrationDevice = [[NSMutableArray alloc] init];
        _dosage = [[NSMutableArray alloc] init];
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
    _medicationStatementDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     [FHIRExistanceChecker generateArray:_identifier], @"identifier",
                                                     [_patient generateAndReturnDictionary], @"patient",
                                                     [_resourceTypeValue.text generateAndReturnDictionary], @"text",
                                                     [_wasNotGiven generateAndReturnDictionary], @"wasNotGiven",
                                                     [FHIRExistanceChecker generateArray:_reasonNotGiven], @"reasonNotGiven",
                                                     [_whenGiven generateAndReturnDictionary], @"whenGiven",
                                                     [_medication generateAndReturnDictionary], @"medication",
                                                     [FHIRExistanceChecker generateArray:_administrationDevice], @"administrationDevice",
                                                     [FHIRExistanceChecker generateArray:_dosage], @"dosage",
                                                     [FHIRExistanceChecker generateArray:_resourceTypeValue.extensions], @"extension",
                                                     [FHIRExistanceChecker generateArray:_resourceTypeValue.contained], @"contained",
                                                     nil];
    [_medicationStatementDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_medicationStatementDictionary.dataForResource, @"MedicationStatement", nil];
    returnable.resourceName = @"medicationStatement";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)medicationStatementParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"medicationStatement"];
    NSDictionary *medStateDict = [dictionary objectForKey:@"MedicationStatement"];
    //NSLog(@"%@", patient);
    
    [_resourceTypeValue resourceParser:medStateDict];
    
    //_identifier
    NSArray *identifierArray = [[NSArray alloc] initWithArray:[medStateDict objectForKey:@"identifier"]];
    _identifier = [[NSMutableArray alloc] init];
    for (int i = 0; i < [identifierArray count]; i++)
    {
        FHIRIdentifier *tempID = [[FHIRIdentifier alloc] init];
        [tempID identifierParser:[identifierArray objectAtIndex:i]];
        [_identifier addObject:tempID];
    }
    
    [_patient resourceReferenceParser:[medStateDict objectForKey:@"patient"]];
    [_wasNotGiven setValueBool:[medStateDict objectForKey:@"wasNotGiven"]];
    
    //_reasonNotGiven
    NSArray *reasonNotArray = [[NSArray alloc] initWithArray:[medStateDict objectForKey:@"reasonNotGiven"]];
    _reasonNotGiven = [[NSMutableArray alloc] init];
    for (int i = 0; i < [reasonNotArray count]; i++)
    {
        FHIRCodeableConcept *tempCC = [[FHIRCodeableConcept alloc] init];
        [tempCC codeableConceptParser:[reasonNotArray objectAtIndex:i]];
        [_reasonNotGiven addObject:tempCC];
    }
    
    [_whenGiven periodParser:[medStateDict objectForKey:@"whenGiven"]];
    [_medication resourceReferenceParser:[medStateDict objectForKey:@"medication"]];
    
    //_administrationDevice
    NSArray *addDeviceArray = [[NSArray alloc] initWithArray:[medStateDict objectForKey:@"administrationDevice"]];
    _administrationDevice = [[NSMutableArray alloc] init];
    for (int i = 0; i < [addDeviceArray count]; i++)
    {
        FHIRResourceReference *tempRR = [[FHIRResourceReference alloc] init];
        [tempRR resourceReferenceParser:[addDeviceArray objectAtIndex:i]];
        [_administrationDevice addObject:tempRR];
    }
    
    //_dosage
    NSArray *dosageArray = [[NSArray alloc] initWithArray:[medStateDict objectForKey:@"dosage"]];
    _dosage = [[NSMutableArray alloc] init];
    for (int i = 0; i < [dosageArray count]; i++)
    {
        FHIRDosage *tempDO = [[FHIRDosage alloc] init];
        [tempDO dosageParser:[dosageArray objectAtIndex:i]];
        [_dosage addObject:tempDO];
    }
    
}

@end
