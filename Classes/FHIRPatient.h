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
#import "FHIRPatientContact.h"
#import "FHIRAnimal.h"
#import "FHIRBool.h"
#import "FHIRText.h"

@interface FHIRPatient : FHIRResource

@property (nonatomic, strong) FHIRResourceDictionary *patientDictionary; //a dictionary containing all resources in this patient object

//following properties are individual parts of the Patient Object that can be influenced Individually
@property (nonatomic, strong) NSMutableArray *identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. An identifier that applies to this person as a patient
@property (nonatomic, strong) FHIRResourceReference *provider; //The provider for whom this is a patient record. (ResourceReference(Organisation))
@property (nonatomic, strong) NSArray *multipleBirthX; //The boolean or integer in which describes a multiple birth, possibly containing the position born.(Integer/Boolean object)
@property (nonatomic, strong) NSDate *deceasedDate; //date in which patient has died
@property (nonatomic, strong) NSMutableArray *link; //THIS ARRAY IS FILLED WITH "ResourceReference(Patient)" OBJECTS ONLY. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
@property (nonatomic, strong) FHIRBool *active; //Whether the patient record is in use, or has been removed from active use
@property (nonatomic, strong) FHIRAnimal *animal; //This element has a value if the patient is an animal
@property (nonatomic, strong) FHIRDemographics *details; //Patient Demographic details
@property (nonatomic, strong) NSMutableArray *contact; //THIS ARRAY IS FILLED WITH "PatientContact" OBJECTS ONLY. A contact party (e.g. guardian, partner, friend) for the patient
@property (nonatomic, retain) FHIRText *genText; //text holder for extra generated text
@property (nonatomic, retain) FHIRResource *resourceTypeValue; //holds resource type, text, name, and extensions

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case Patient
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from patient in an NSdictionary format

- (void)patientParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into a patient object

@end


