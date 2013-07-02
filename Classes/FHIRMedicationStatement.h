//
//  FHIRMedicationStatement.h
//  FHIR
//
//  Created by Adam Sippel on 2013-07-02.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A record of medication being taken by a patient, or that the medication has been given to a patient where the record is the result of a report from the patient, or another clinician.
 */

#import <Foundation/Foundation.h>
#import "FHIRResource.h"
#import "FHIRExistanceChecker.h"
#import "FHIRCodeableConcept.h"

@interface FHIRMedicationStatement : FHIRResource

@property (nonatomic, strong) FHIRResourceDictionary *medicationStatementDictionary; //a dictionary containing all resources in this medicationStatement object
@property (nonatomic, retain) FHIRResource *resourceTypeValue; //holds resource type, text, name, and extensions of this resource

//following properties are individual parts of the Medication Statement Object that can be influenced Individually
@property (nonatomic, strong) NSMutableArray *identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. External identifier - FHIR will generate its own internal IDs (probably URLs) which do not need to be explicitly managed by the resource. The identifier here is one that would be used by another non-FHIR system - for example an automated medication pump would provide a record each time it operated; an administration while the patient was off the ward might be made with a different system and entered after the event. Particularly important if these records have to be updated.
@property (nonatomic, strong) FHIRResourceReference *patient; //A link to a resource representing the person to whom the medication was given. (Patient)
@property (nonatomic, strong) FHIRBool *wasNotGiven; //Set this to true if the record is saying that the medication was NOT administered.
@property (nonatomic, strong) NSMutableArray *reasonNotGiven; //THIS ARRAY CONTAINS "CodeableConcept" OBJECTS ONLY. A code indicating why the administration has been negated. Use only if isNegated is set to TRUE.
@property (nonatomic, strong) FHIRPeriod *whenGiven; //An interval of time during which the administration takes place. For many administrations, such as swallowing a tablet the lower and upper values of the interval will be the same.
@property (nonatomic, strong) FHIRResourceReference *medication; //Identifies the medication being administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications. (Medication)
@property (nonatomic, strong) NSMutableArray *administrationDevice; //THIS ARRAY CONTAINS "ResourceReference(Device)" OBJECTS ONLY. An identifier or a link to a resource that identifies a device used in administering the medication to the patient.
@property (nonatomic, strong) NSMutableArray *dosage; //THIS ARRAY CONTAINS "Dosage" OBJECTS ONLY. Indicates how the medication is to be used by the patient.

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case MedicationStatement
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from medicationStatement in an NSdictionary format

- (void)medicationStatementParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an medicationStatement object

@end
