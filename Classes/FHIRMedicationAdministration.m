//
//  FHIRMedicationAdministration.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRMedicationAdministration.h"
#import "FHIRDosage.h"

@implementation FHIRMedicationAdministration

@synthesize medicationAdministrationDictionary = _medicationAdministrationDictionary;
@synthesize resourceTypeValue = _resourceTypeValue;
@synthesize identifier = _identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY.
@synthesize status = _status; 
@synthesize patient = _patient; //(Patient)
@synthesize practitioner = _practitioner; //(Practitioner)
@synthesize visit = _visit; //(Visit)
@synthesize prescription = _prescription; //(MedicationPrescription)
@synthesize wasNotGiven = _wasNotGiven; //
@synthesize reasonNotGiven = _reasonNotGiven; //THIS ARRAY CONTAINS "CodeableConcept" OBJECTS ONLY.
@synthesize whenGiven = _whenGiven; 
@synthesize medication = _medication; //(Medication)
@synthesize administrationDevice = _administrationDevice; // THIS ARRAY CONTAINS "ResourceReference(Device)" OBJECTS ONLY.
@synthesize dosage = _dosage; //THIS ARRAY CONTAINS "Dosage" OBJECTS ONLY.

- (id)init
{
    self = [super init];
    if (self) {
        _medicationAdministrationDictionary = [[FHIRResourceDictionary alloc] init];
        _resourceTypeValue = [[FHIRResource alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        _status = [[FHIRCode alloc] init];
        _patient = [[FHIRResourceReference alloc] init];
        _practitioner = [[FHIRResourceReference alloc] init];
        _visit = [[FHIRResourceReference alloc] init];
        _prescription = [[FHIRResourceReference alloc] init];
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
    _medicationAdministrationDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [_status generateAndReturnDictionary], @"status",
                                          [FHIRExistanceChecker generateArray:_identifier], @"identifier",
                                          [_patient generateAndReturnDictionary], @"patient",
                                          [_practitioner generateAndReturnDictionary], @"practitioner",
                                          [_resourceTypeValue.text generateAndReturnDictionary], @"text",
                                          [_visit generateAndReturnDictionary], @"visit",
                                          [_prescription generateAndReturnDictionary], @"prescription",
                                          [_whenGiven generateAndReturnDictionary], @"whenGiven",
                                          [FHIRExistanceChecker generateArray:_resourceTypeValue.extensions], @"extension",
                                          [FHIRExistanceChecker generateArray:_resourceTypeValue.contained], @"contained",
                                          [_wasNotGiven generateAndReturnDictionary], @"wasNotGiven",
                                          [FHIRExistanceChecker generateArray:_reasonNotGiven], @"reasonNotGiven",
                                          [_medication generateAndReturnDictionary], @"medication",
                                          [FHIRExistanceChecker generateArray:_administrationDevice], @"administrationDevice",
                                          [FHIRExistanceChecker generateArray:_dosage], @"dosage",
                                          nil];
    [_medicationAdministrationDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_medicationAdministrationDictionary.dataForResource, @"MedicationAdministration", nil];
    returnable.resourceName = @"medicationAdministration";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)medicationAdministrationParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"medicationAdministration"];
    NSDictionary *medAdminDict = [dictionary objectForKey:@"MedicationAdministration"];
    //NSLog(@"%@", patient);
    
    [_resourceTypeValue resourceParser:medAdminDict];
    //NSLog(@"%@", patientDict);
    
    [_status setValueCode:[medAdminDict objectForKey:@"status"]];
    
    //_identifier
    NSArray *identifierArray = [[NSArray alloc] initWithArray:[medAdminDict objectForKey:@"identifier"]];
    _identifier = [[NSMutableArray alloc] init];
    for (int i = 0; i < [identifierArray count]; i++)
    {
        FHIRIdentifier *tempID = [[FHIRIdentifier alloc] init];
        [tempID identifierParser:[identifierArray objectAtIndex:i]];
        [_identifier addObject:tempID];
    }
    
    [_patient resourceReferenceParser:[medAdminDict objectForKey:@"patient"]];
    [_practitioner resourceReferenceParser:[medAdminDict objectForKey:@"practitioner"]];
    [_visit resourceReferenceParser:[medAdminDict objectForKey:@"visit"]];
    [_prescription resourceReferenceParser:[medAdminDict objectForKey:@"prescription"]];
    [_wasNotGiven setValueBool:[medAdminDict objectForKey:@"wasNotGiven"]];
    
    //_reasonNotGiven
    NSArray *RNGArray = [[NSArray alloc] initWithArray:[medAdminDict objectForKey:@"reasonNotGiven"]];
    _reasonNotGiven = [[NSMutableArray alloc] init];
    for (int i = 0; i < [RNGArray count]; i++)
    {
        FHIRCodeableConcept *tempCC = [[FHIRCodeableConcept alloc] init];
        [tempCC codeableConceptParser:[RNGArray objectAtIndex:i]];
        [_reasonNotGiven addObject:tempCC];
        //NSLog(@"%@", _reasonNotGiven);
    }
    
    [_whenGiven periodParser:[medAdminDict objectForKey:@"whenGiven"]];
    [_medication resourceReferenceParser:[medAdminDict objectForKey:@"medication"]];
    
    //_administrativeDevice
    NSArray *adminDeviceArray = [[NSArray alloc] initWithArray:[medAdminDict objectForKey:@"administrativeDevice"]];
    _administrationDevice = [[NSMutableArray alloc] init];
    for (int i = 0; i < [adminDeviceArray count]; i++)
    {
        FHIRResourceReference *tempRR = [[FHIRResourceReference alloc] init];
        [tempRR resourceReferenceParser:[adminDeviceArray objectAtIndex:i]];
        [_administrationDevice addObject:tempRR];
        //NSLog(@"%@", _administrativeDevice);
    }
    
    //_dosage
    NSArray *dosageArray = [[NSArray alloc] initWithArray:[medAdminDict objectForKey:@"dosage"]];
    _dosage = [[NSMutableArray alloc] init];
    for (int i = 0; i < [dosageArray count]; i++)
    {
        FHIRDosage *tempDO = [[FHIRDosage alloc] init];
        [tempDO dosageParser:[dosageArray objectAtIndex:i]];
        [_dosage addObject:tempDO];
        //NSLog(@"%@", _dosage);
    }
    
}

@end
