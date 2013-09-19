//
//  FHIRMedicationDispense.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Dispensing a medication to a named patient. This includes a description of the supply provided and the instructions for administering the medication.
 */

#import <Foundation/Foundation.h>
#import "FHIRResource.h"
#import "FHIRExistanceChecker.h"
#import "FHIRCodeableConcept.h"
#import "FHIRDispense.h"
#import "FHIRSubstitution.h"

@interface FHIRMedicationDispense : FHIRResource

@property (nonatomic, strong) FHIRResourceDictionary *medicationDispenseDictionary; //a dictionary containing all resources in this medicationDispense object
@property (nonatomic, retain) FHIRResource *resourceTypeValue; //holds resource type, text, name, and extensions

//following properties are individual parts of the Medication Dispense Object that can be influenced Individually
@property (nonatomic, strong) NSMutableArray *identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. Identifier assigned by the dispensing facility - this is an identifier assigned outside FHIR.
@property (nonatomic, strong) FHIRCodeableConcept *status; //A code specifying the state of the set of dispense events.
@property (nonatomic, strong) FHIRResourceReference *patient; // A link to a resource representing the person to whom the medication will be given.(Patient)
@property (nonatomic, strong) FHIRResourceReference *dispenser; // The individual reponsible for dispensing the medication.(Practitioner)
@property (nonatomic, strong) FHIRResourceReference *visit; // A link to a resource that identifies the particular occurrence of contact between patient and health care provider.(Visit)
@property (nonatomic, strong) NSMutableArray *authorizingPrescription; //THIS ARRAY CONTAINS "ResourceReference(MedicationPrescription)" OBJECTS ONLY. Indicates the medication order that is being dispensed against.
@property (nonatomic, strong) FHIRSubstitution *substitution; //Indicates whether or not substitution was made as part of the dispense. In some cases substitution will be expected but doesn't happen, in other cases substitution is not expected but does happen. This block explains what substitition did or did not happen and why.
@property (nonatomic, strong) NSMutableArray *dispense; //THIS ARRAY CONTAINS "Dispense" OBJECTS ONLY. Indicates the details of the dispense event such as the days supply and quantity of medication dispensed.

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case MedicationDispense
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from medicationDispense in an NSdictionary format

- (void)medicationDispenseParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into a medicationDispense object

@end
