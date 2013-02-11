//
//  Patient.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeableConcept.h"
#import "Resource.h"
#import "Demographics.h"
#import "ResourceReference.h"
#import "FHIRResourceDictionary.h"
#import "Animal.h"

//A patient is a person or animal that is receiving care

@interface Patient : Resource

@property (nonatomic, retain) FHIRResourceDictionary *patientDictionary;

    
    - (FHIRResourceDictionary *)getPatientResourceDictionary;
    - (void)setPatientResourceDictionary:(FHIRResourceDictionary *)resources;
    

    - (NSArray *)link;//method to return array of <ResourceReference>'s
    - (BOOL *)getActive; //returns whether the patient is active
    - (void)setActive:(BOOL *)value; //sets the patients active value
    - (NSArray *)identifier;//method to return array of <HumanId>'s
    - (Demographics *)getDetails; //returns details demographics on the patient
    - (void)setDetails:(Demographics *)value; //sets the detail demographics on the patient
    - (Animal *)getAnimal; //returns animal
    - (void)setAnimal:(Animal *)value; //sets animal
    - (ResourceReference *)getProvider; //returns the provider of the document for the patient
    - (void)setProvider:(ResourceReference *)value; //sets the provider of the document
    - (CodeableConcept *)getDiet; //returns the dietary requirements for patient
    - (void)setDiet:(CodeableConcept *)value; //sets the dietary requirements for the patient
    - (CodeableConcept *)getConfidentiality; //returns the confidentiality of the patients paperwork
    - (void)setConfidentiality:(CodeableConcept *)value; //sets the confidentiality of the patients paperwork
    - (CodeableConcept *)getRecordLocation; //returns location of the patients records
    - (void)setRecordLocation:(CodeableConcept *)value; //sets the location of the records
    
    - (NSInteger)getResourceType; //override method. Returns integer of specified type, in this case Patient


@property (nonatomic) NSArray *link; //THIS ARRAY IS FILLED WITH "ResourceReference" OBJECTS ONLY. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
@property (nonatomic) BOOL *active; //Whether the patient record is in use, or has been removed from active use
@property (nonatomic, retain) NSArray *identifier; //THIS ARRAY IS FILLED WITH "HumanId" OBJECTS ONLY.. An identifier that applies to this person as a patient
@property (nonatomic, retain) Demographics *details; //Patient Demographic details
@property (nonatomic, retain) Animal *animal; //This element has a value if the patient is an animal
@property (nonatomic, retain) ResourceReference *provider; //The provider for whom this is a patient record
@property (nonatomic, retain) CodeableConcept *diet; //Dietary restrictions for the patient
@property (nonatomic, retain) CodeableConcept *confidentiality; //Confidentiality of the patient records
@property (nonatomic, retain) CodeableConcept *recordLocation; //The location of the paper record for the patient, if there is one
    
@end


