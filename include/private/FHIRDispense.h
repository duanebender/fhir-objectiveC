//
//  FHIRDispense.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Indicates the details of the dispense event such as the days supply and quantity of medication dispensed.
 */

#import "FHIR.h"

@interface FHIRDispense : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *dispenseDictionary; //dictionary of all dispense resources

//following properties are individual parts of the dispense Object that can be influenced Individually
@property (nonatomic, strong) FHIRIdentifier *identifier; //Identifier assigned by the dispensing facility. This is an identifier assigned outside FHIR.
@property (nonatomic, strong) FHIRCodeableConcept *status; //A code specifying the state of the dispense event.
@property (nonatomic, strong) FHIRCodeableConcept *type; //Indicates the type of dispensing event that is performed. Examples include: Trial Fill, Completion of Trial, Partial Fill, Emergency Fill, Samples, etc.
@property (nonatomic, strong) FHIRQuantity *quantity; //The amount of medication that has been dispensed. Includes unit of measure.
@property (nonatomic, strong) FHIRResourceReference *medication; //Identifies the medication being administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications. (Medication)
@property (nonatomic, strong) FHIRPeriod *whenPrepared; //The time the dispense event occurred.
@property (nonatomic, strong) FHIRPeriod *whenHandedOver; //The time the dispense event occurred.
@property (nonatomic, strong) FHIRResourceReference *destination; //Identification of the facility/location where the medication was shipped to, as part of the dispense event. (Location)
@property (nonatomic, strong) NSMutableArray *reciever; //THIS ARRAY CONTAINS "ResourceReference(Practitioner)" OBJECTS ONLY. Identifies the person who picked up the medication.
@property (nonatomic, strong) NSMutableArray *dosage; //THIS ARRAY CONTAINS "Dosage" OBJECTS ONLY. Indicates how the medication is to be used by the patient.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of dispense containing all it's elements
- (void)dispenseParser:(NSDictionary *)dictionary; //set dispense from an NSdictionary

@end
