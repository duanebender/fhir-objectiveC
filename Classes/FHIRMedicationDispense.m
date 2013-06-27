//
//  FHIRMedicationDispense.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRMedicationDispense.h"

@implementation FHIRMedicationDispense

@synthesize medicationDispenseDictionary = _medicationDispenseDictionary; //a dictionary containing all resources in this medicationDispense object
@synthesize resourceTypeValue = _resourceTypeValue; //holds resource type, text, name, and extensions
@synthesize identifier = _identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. Identifier assigned by the dispensing facility - this is an identifier assigned outside FHIR.
@synthesize status = _status; //A code specifying the state of the set of dispense events.
@synthesize patient = _patient; // A link to a resource representing the person to whom the medication will be given.(Patient)
@synthesize dispenser = _dispenser; // The individual reponsible for dispensing the medication.(Practitioner)
@synthesize visit = _visit; // A link to a resource that identifies the particular occurrence of contact between patient and health care provider.(Visit)
@synthesize authorizingPrescription = _authorizingPrescription; //THIS ARRAY CONTAINS "ResourceReference(MedicationPrescription)" OBJECTS ONLY. Indicates the medication order that is being dispensed against.
@synthesize substitution = _substitution; //Indicates whether or not substitution was made as part of the dispense. In some cases substitution will be expected but doesn't happen, in other cases substitution is not expected but does happen. This block explains what substitition did or did not happen and why.
@synthesize dispense = _dispense; //THIS ARRAY CONTAINS "Dispense" OBJECTS ONLY. Indicates the details of the dispense event such as the days supply and quantity of medication dispensed.

- (id)init
{
    self = [super init];
    if (self) {
        _medicationDispenseDictionary = [[FHIRResourceDictionary alloc] init];
        _resourceTypeValue = [[FHIRResource alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        _status = [[FHIRCodeableConcept alloc] init];
        _patient = [[FHIRResourceReference alloc] init];
        _dispenser = [[FHIRResourceReference alloc] init];
        _visit = [[FHIRResourceReference alloc] init];
        _authorizingPrescription = [[NSMutableArray alloc] init];
        _substitution = [[FHIRSubstitution alloc] init];
        _dispense = [[NSMutableArray alloc] init];
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
    _medicationDispenseDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [FHIRExistanceChecker generateArray:_identifier], @"identifier",
                                                           [_status generateAndReturnDictionary], @"status",
                                                           [_patient generateAndReturnDictionary], @"patient",
                                                           [_dispenser generateAndReturnDictionary], @"dispenser",
                                                           [_resourceTypeValue.text generateAndReturnDictionary], @"text",
                                                           [_visit generateAndReturnDictionary], @"visit",
                                                           [FHIRExistanceChecker generateArray:_authorizingPrescription], @"authorizingPrescription",
                                                           [_substitution generateAndReturnDictionary], @"substitution",
                                                           [FHIRExistanceChecker generateArray:_dispense], @"dispense",
                                                           [FHIRExistanceChecker generateArray:_resourceTypeValue.extensions], @"extension",
                                                           [FHIRExistanceChecker generateArray:_resourceTypeValue.contained], @"contained",
                                                           nil];
    [_medicationDispenseDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_medicationDispenseDictionary.dataForResource, @"MedicationDispense", nil];
    returnable.resourceName = @"medicationDispense";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)medicationDispenseParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"medicationDispense"];
    NSDictionary *medDisDict = [dictionary objectForKey:@"MedicationDispense"];
    //NSLog(@"%@", patient);
    
    [_resourceTypeValue resourceParser:medDisDict];
    
    [_status codeableConceptParser:[medDisDict objectForKey:@"status"]];
    [_patient resourceReferenceParser:[medDisDict objectForKey:@"patient"]];
    [_dispenser resourceReferenceParser:[medDisDict objectForKey:@"dispenser"]];
    [_visit resourceReferenceParser:[medDisDict objectForKey:@"visit"]];
    
    //_authorizingPrescription
    NSArray *auPresArray = [[NSArray alloc] initWithArray:[medDisDict objectForKey:@"authorizingPrescription"]];
    _authorizingPrescription = [[NSMutableArray alloc] init];
    for (int i = 0; i < [auPresArray count]; i++)
    {
        FHIRResourceReference *tempRR = [[FHIRResourceReference alloc] init];
        [tempRR resourceReferenceParser:[auPresArray objectAtIndex:i]];
        [_authorizingPrescription addObject:tempRR];
    }
    
    [_substitution substitutionParser:[medDisDict objectForKey:@"substitution"]];
    
    //_dispense
    NSArray *dispenseArray = [[NSArray alloc] initWithArray:[medDisDict objectForKey:@"dispence"]];
    _dispense = [[NSMutableArray alloc] init];
    for (int i = 0; i < [dispenseArray count]; i++)
    {
        FHIRDispense *tempDIS = [[FHIRDispense alloc] init];
        [tempDIS dispenseParser:[dispenseArray objectAtIndex:i]];
        [_dispense addObject:tempDIS];
        //NSLog(@"%@", _dispense);
    }
    
}

@end
