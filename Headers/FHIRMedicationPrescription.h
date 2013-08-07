//
//  FHIRMedicationPrescription.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * An order for both supply of the medication and the instructions for administration of the medicine to a patient.
 */

#import <Foundation/Foundation.h>
#import "FHIRResource.h"
#import "FHIRExistanceChecker.h"
#import "FHIRCodeableConcept.h"
#import "FHIRDosageInstructions.h"
#import "FHIRMedicationPrescriptionDispense.h"
#import "FHIRMedicationPrescriptionSubstitution.h"

@interface FHIRMedicationPrescription : FHIRResource

@property (nonatomic, strong) FHIRResourceDictionary *medicationPrescriptionDictionary; //a dictionary containing all resources in this medicationPrescription object
@property (nonatomic, retain) FHIRResource *resourceTypeValue; //holds resource type, text, name, and extensions of this resource

//following properties are individual parts of the Medication Prescription Object that can be influenced Individually
@property (nonatomic, strong) NSMutableArray *identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. External identifier - FHIR will generate its own internal IDs which do not need to be explicitly managed by the resource. The identifier here is one that would be used by another non-FHIR system - for example a re-imbursement system might issue its own id for each prescription that is created. This is particularly important where FHIR only provides part of an erntire workflow process where records have to be tracked through an entire system.
@property (nonatomic, strong) NSDate *dateWritten; //The date (and perhaps time) when the prescription was written.
@property (nonatomic, strong) FHIRCodeableConcept *status; //A code specifying the state of the order. Generally this will be active or completed state.
@property (nonatomic, strong) FHIRResourceReference *patient; //A link to a resource representing the person to whom the medication will be given. (Patient)
@property (nonatomic, strong) FHIRResourceReference *prescriber; //The healthcare professional responsible for authorising the prescription (Practitioner)
@property (nonatomic, strong) FHIRResourceReference *visit; //A link to a resource that identifies the particular occurrence of contact between patient and health care provider. (Visit)
@property (nonatomic, strong) NSArray *reasonForPrescribingX; //Can be the reason or the indication for writing the prescription. (String/CodeableCOncept)
@property (nonatomic, strong) FHIRResourceReference *medication; //Identifies the medication being administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications. (Medication)
@property (nonatomic, strong) NSMutableArray *dosageInstructions; //THIS ARRAY CONTAINS "DosageInstructions" OBJECTS ONLY. Indicates how the medication is to be used by the patient.
@property (nonatomic, strong) FHIRMedicationPrescriptionDispense *dispense; //Deals with details of the dispense part of the order.
@property (nonatomic, strong) FHIRMedicationPrescriptionSubstitution *substitution; //Indicates whether or not substitution can or should as part of the dispense. In some cases substitution must happen, in other cases substitution must not happen, and in others it does not matter. This block explains the prescribers intent. If nothing is specified substitution may be done.

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case MedicationPrescription
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from medicationPrescription in an NSdictionary format

- (void)medicationPrescriptionParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an medicationPrescription object


@end
