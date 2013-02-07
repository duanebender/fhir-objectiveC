//
//  Patient.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeableConcept.h"
#import "Resource.h"
#import "Demographics.h"
#import "ResourceReference.h"

//A patient is a person or animal that is receiving care

@interface Animal : Element

- (CodeableConcept *)getSpecies; //get species of animal and return
- (void)setSpecies:(CodeableConcept *)value; //set species of this instance of animal
- (CodeableConcept *)getBreed; //get breed of animal and return
- (void)setBreed:(CodeableConcept *)value; //set breed of this instance of animal
- (CodeableConcept *)getGenderStatus; //returns gender of the animal
- (void)setGenderStatus:(CodeableConcept *)value; //set gender of this instance of animal


@end

@interface Patient : Resource
    
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
    
    - (ResourceType *)getResourceType; //override method
    
@end


