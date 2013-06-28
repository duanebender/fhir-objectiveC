//
//  FHIRMedicationPrescriptionDispense.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRMedicationPrescriptionDispense.h"

@implementation FHIRMedicationPrescriptionDispense

@synthesize medicationPrescriptionDispenseDictionary = _medicationPrescriptionDispenseDictionary; //dictionary of all dispense resources
@synthesize validityPeriod = _validityPeriod;
@synthesize numberOfRepeatsAllowed = _numberOfRepeatsAllowed;
@synthesize quantity = _quantity;
@synthesize expectedSupplyDuration = _expectedSupplyDuration;

- (id)init
{
    self = [super init];
    if (self) {
        _medicationPrescriptionDispenseDictionary = [[FHIRResourceDictionary alloc] init];
        _validityPeriod = [[FHIRPeriod alloc] init];
        _numberOfRepeatsAllowed = [[FHIRInteger alloc] init];
        _quantity = [[FHIRQuantity alloc] init];
        _expectedSupplyDuration = [[FHIRQuantity alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _medicationPrescriptionDispenseDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [_validityPeriod generateAndReturnDictionary], @"validityPeriod",
                                               [_numberOfRepeatsAllowed generateAndReturnDictionary], @"numberOfRepeatsAllowed",
                                               [_quantity generateAndReturnDictionary], @"quantity",
                                               [_expectedSupplyDuration generateAndReturnDictionary], @"expectedSupplyDuration",
                                               nil];
    _medicationPrescriptionDispenseDictionary.resourceName = @"Dispense";
    [_medicationPrescriptionDispenseDictionary cleanUpDictionaryValues];
    return _medicationPrescriptionDispenseDictionary.dataForResource;
}

- (void)dispenseParser:(NSDictionary *)dictionary
{
    [_validityPeriod periodParser:[dictionary objectForKey:@"validityPeriod"]];
    [_numberOfRepeatsAllowed setValueInteger:[dictionary objectForKey:@"numberOfRepeatsAllowed"]];
    [_quantity quantityParser:[dictionary objectForKey:@"quantity"]];
    [_expectedSupplyDuration quantityParser:[dictionary objectForKey:@"expectedSupplyDuration"]];
}

@end
