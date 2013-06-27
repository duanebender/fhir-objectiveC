//
//  FHIRMedicationAdministration.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Describes the event of a patient being given a dose of a medication. This may be as simple as swallowing a tablet or it may be a long running infusion. Related resources tie this event to the authorizing prescription, and the specific visit between patient and health care practitioner.
 */

#import <Foundation/Foundation.h>
#import "FHIRResource.h"
#import "FHIRExistanceChecker.h"

@interface FHIRMedicationAdministration : FHIRResource

@property (nonatomic, strong) FHIRResourceDictionary *medicationAdministrationDictionary; //a dictionary containing all resources in this medicationAdministration object
@property (nonatomic, retain) FHIRResource *resourceTypeValue; //holds resource type, text, name, and extensions of this resource

//following properties are individual parts of the Medication Administration Object that can be influenced Individually
@property (nonatomic, strong) NSMutableArray *identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. External identifier - FHIR will generate its own internal IDs (probably URLs) which do not need to be explicitly managed by the resource. The identifier here is one that would be used by another non-FHIR system - for example an automated medication pump would provide a record each time it operated; an administration while the patient was off the ward might be made with a different system and entered after the event. Particularly important if these records have to be updated.
@property (nonatomic, strong) FHIRCode *status; //Will generally be set to show that the administration has been completed. For some long running administrations such as infusions it is possible for an administration to be started but not completed or it may be paused while some other process is under way.
@property (nonatomic, strong) FHIRResourceReference *patient; //A link to a resource representing the person to whom the medication was given. (Patient)
@property (nonatomic, strong) FHIRResourceReference *practitioner; //This is the individual who is responsible for giving the medication to the patient. (Practitioner)
@property (nonatomic, strong) FHIRResourceReference *visit; //An link to a resource that identifies the particular occurrence of contact between patient and health care provider. (Visit)
@property (nonatomic, strong) FHIRResourceReference *prescription; //A link to a resource that provides the original request, instruction and authority to perform the administration. (MedicationPrescription)
@property (nonatomic, strong) FHIRBool *wasNotGiven; //Set this to true if the record is saying that the medication was NOT administered.
@property (nonatomic, strong) NSMutableArray *reasonNotGiven; //THIS ARRAY CONTAINS "CodeableConcept" OBJECTS ONLY. A code indicating why the administration has been negated. Use only if isNegated is set to TRUE
@property (nonatomic, strong) FHIRPeriod *whenGiven; //An interval of time during which the administration takes place. For many administrations, such as swallowing a tablet the lower and upper values of the interval will be the same.
@property (nonatomic, strong) FHIRResourceReference *medication; //Identifies the medication being administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications. (Medication)
@property (nonatomic, strong) NSMutableArray *administrationDevice; // THIS ARRAY CONTAINS "ResourceReference(Device)" OBJECTS ONLY. An identifier or a link to a resource that identifies a device used in administering the medication to the patient.
@property (nonatomic, strong) NSMutableArray *dosage; //THIS ARRAY CONTAINS "Dosage" OBJECTS ONLY. Indicates how the medication is to be used by the patient.

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case MedicationAdministration
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from medicationAdministration in an NSdictionary format

- (void)medicationAdministrationParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an medicationAdministration object

@end
