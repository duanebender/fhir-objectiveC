//
//  FHIRMedicationPrescriptionDispense.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Deals with details of the dispense part of the order.
 */

#import <Foundation/Foundation.h>
#import "FHIRInteger.h"
#import "FHIRPeriod.h"
#import "FHIRQuantity.h"

@interface FHIRMedicationPrescriptionDispense : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *medicationPrescriptionDispenseDictionary; //dictionary of all dispense resources

//following properties are individual parts of the dispense Object that can be influenced Individually
@property (nonatomic, strong) FHIRPeriod *validityPeriod; //Design Comments: This indicates the validity period of a prescription (stale dating the Prescription) It reflects the prescriber perspective for the validity of the prescription. Dispenses must not be made against the prescription outside of this period. The lower-bound of the Dispensing Window signifies the earliest date that the prescription can be filled for the first time. If an upper-bound is not specified then the Prescription is open-ended or will default to a stale-date based on regulations. Rationale: Indicates when the Prescription becomes valid, and when it ceases to be a dispensable Prescription.
@property (nonatomic, strong) FHIRInteger *numberOfRepeatsAllowed; //An integer indicating the number of repeats of the Dispense. UsageNotes: For example, the number of times the prescribed quantity is to be supplied including the initial standard fill.
@property (nonatomic, strong) FHIRQuantity *quantity; //The amount that is to be dispensed.
@property (nonatomic, strong) FHIRQuantity *expectedSupplyDuration; //Identifies the period time over which the supplied product is expected to be used, or the length of time the dispense is expected to last. In some situations, this attribute may be used instead of quantity to identify the amount supplied by how long it is expected to last, rather than the physical quantity issued. E.g. 90 days supply of medication (based on an ordered dosage) When possible, it is always better to specify quantity, as this tends to be more precise. expectedSupplyDuration will always be an estimate that can be influenced by external factors. (Duration is a variant of Quantity)

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of dispense containing all it's elements
- (void)dispenseParser:(NSDictionary *)dictionary; //set dispense from an NSdictionary

@end
