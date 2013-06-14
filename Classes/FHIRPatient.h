//
//  Patient.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A patient is a person or animal that is receiving care
 */

#import <Foundation/Foundation.h>
#import "FHIRDemographics.h"
#import "FHIRExistanceChecker.h"
#import "FHIRAnimal.h"
#import "FHIRBool.h"
#import "FHIRText.h"

@interface FHIRPatient : FHIRResource

@property (nonatomic, retain) FHIRResourceDictionary *patientDictionary; //a dictionary containing all resources in this patient object

//following properties are individual parts of the Patient Object that can be influenced Individually
@property (nonatomic) NSMutableArray *link; //THIS ARRAY IS FILLED WITH "ResourceReference" OBJECTS ONLY. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
@property (nonatomic, retain) FHIRBool *active; //Whether the patient record is in use, or has been removed from active use
@property (nonatomic, retain) NSMutableArray *identifier; //THIS ARRAY IS FILLED WITH "HumanId" OBJECTS ONLY. An identifier that applies to this person as a patient
@property (nonatomic, retain) FHIRDemographics *details; //Patient Demographic details
@property (nonatomic, retain) FHIRAnimal *animal; //This element has a value if the patient is an animal
@property (nonatomic, retain) FHIRResourceReference *provider; //The provider for whom this is a patient record
@property (nonatomic, retain) FHIRCodeableConcept *diet; //Dietary restrictions for the patient
@property (nonatomic, retain) FHIRCodeableConcept *confidentiality; //Confidentiality of the patient records
@property (nonatomic, retain) FHIRCodeableConcept *recordLocation; //The location of the paper record for the patient, if there is one
@property (nonatomic, retain) FHIRText *genText; //text holder for extra generated text
@property (nonatomic, retain) FHIRResource *resourceTypeName; //holds resource type, text, name, and extensions

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case Patient
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from patient in an NSdictionary format

- (void)patientParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into a patient object

@end


