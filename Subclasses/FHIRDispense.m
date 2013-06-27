//
//  FHIRDispense.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRDispense.h"
#import "FHIRDosage.h"

@implementation FHIRDispense

@synthesize dispenseDictionary = _dispenseDictionary; //dictionary of all dispense resources
@synthesize identifier = _identifier; //Identifier assigned by the dispensing facility. This is an identifier assigned outside FHIR.
@synthesize status = _status; //A code specifying the state of the dispense event.
@synthesize type = _type; //Indicates the type of dispensing event that is performed. Examples include: Trial Fill, Completion of Trial, Partial Fill, Emergency Fill, Samples, etc.
@synthesize quantity = _quantity; //The amount of medication that has been dispensed. Includes unit of measure.
@synthesize medication = _medication; //Identifies the medication being administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications. (Medication)
@synthesize whenPrepared = _whenPrepared; //The time the dispense event occurred.
@synthesize whenHandedOver = _whenHandedOver; //The time the dispense event occurred.
@synthesize destination = _destination; //Identification of the facility/location where the medication was shipped to, as part of the dispense event. (Location)
@synthesize reciever = _reciever; //THIS ARRAY CONTAINS "ResourceReference(Practitioner)" OBJECTS ONLY. Identifies the person who picked up the medication.
@synthesize dosage = _dosage; //THIS ARRAY CONTAINS "Dosage" OBJECTS ONLY. Indicates how the medication is to be used by the patient.

- (id)init
{
    self = [super init];
    if (self) {
        _dispenseDictionary = [[FHIRResourceDictionary alloc] init];
        _identifier = [[FHIRIdentifier alloc] init];
        _status = [[FHIRCodeableConcept alloc] init];
        _type = [[FHIRCodeableConcept alloc] init];
        _quantity = [[FHIRQuantity alloc] init];
        _medication = [[FHIRResourceReference alloc] init];
        _whenPrepared = [[FHIRPeriod alloc] init];
        _whenHandedOver = [[FHIRPeriod alloc] init];
        _destination = [[FHIRResourceReference alloc] init];
        _reciever = [[NSMutableArray alloc] init];
        _dosage = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _dispenseDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [_identifier generateAndReturnDictionary], @"identifier",
                                         [_status generateAndReturnDictionary], @"status",
                                         [_type generateAndReturnDictionary], @"type",
                                         [_quantity generateAndReturnDictionary], @"quantity",
                                         [_medication generateAndReturnDictionary], @"medication",
                                         [_whenPrepared generateAndReturnDictionary], @"whenPrepared",
                                         [_whenHandedOver generateAndReturnDictionary], @"whenHandedOver",
                                         [_destination generateAndReturnDictionary], @"destination",
                                         [FHIRExistanceChecker generateArray:_reciever], @"reciever",
                                         [FHIRExistanceChecker generateArray:_dosage], @"dosage",
                                         nil];
    _dispenseDictionary.resourceName = @"Dispense";
    [_dispenseDictionary cleanUpDictionaryValues];
    return _dispenseDictionary.dataForResource;
}

- (void)dispenseParser:(NSDictionary *)dictionary
{
    [_identifier identifierParser:[dictionary objectForKey:@"identifier"]];
    [_status codeableConceptParser:[dictionary objectForKey:@"status"]];
    [_type codeableConceptParser:[dictionary objectForKey:@"type"]];
    [_quantity quantityParser:[dictionary objectForKey:@"quantity"]];
    [_medication resourceReferenceParser:[dictionary objectForKey:@"medication"]];
    [_whenPrepared periodParser:[dictionary objectForKey:@"whenPrepared"]];
    [_whenHandedOver periodParser:[dictionary objectForKey:@"whenHandedOver"]];
    [_destination resourceReferenceParser:[dictionary objectForKey:@"destination"]];
    
    //_reciever
    NSArray *recieverArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"reciever"]];
    _reciever = [[NSMutableArray alloc] init];
    for (int i = 0; i < [recieverArray count]; i++)
    {
        FHIRResourceReference *tempRR = [[FHIRResourceReference alloc] init];
        [tempRR resourceReferenceParser:[recieverArray objectAtIndex:i]];
        [_reciever addObject:tempRR];
        //NSLog(@"%@", _reciever);
    }
    
    //_dosage
    NSArray *dosageArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"dosage"]];
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
