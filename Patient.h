//
//  Patient.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeableConcept.h"

//A patient is a person or animal that is receiving care
@interface Patient : Resource
{
    
    @interface Animal : Element
    {
        
    @private
        CodeableConcept species; //Identifies the high level categorization of the kind of animal
        CodeableConcept breed; //Identifies the detailed categorization of the kind of animal.
        CodeableConcept genderStatus; //Indicates the current state of the animal's reproductive organs
        
    @public
        + (CodeableConcept)getSpecies; //get species of animal and return
        + (void)setSpecies:(CodeableConcept *)value; //set species of this instance of animal
        + (CodeableConcept)getBreed; //get breed of animal and return
        + (void)setBreed:(CodeableConcept *)value; //set breed of this instance of animal
        + (CodeableConcept)getGenderStatus; //returns gender of the animal
        + (void)setGenderStatus:(CodeableConcept *)value; //set gender of this instance of animal
        
    }
    @end
    
@private
    NSArray<ResourceReference> link; //NOT SURE OF PROPER FORMAT FOR THIS CODE. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
    BOOL active; //Whether the patient record is in use, or has been removed from active use
    NSArray<HumanId> identifier; //NOT SURE OF PROPER FORMAT FOR THIS CODE. An identifier that applies to this person as a patient
    Demographics details; //Patient Demographic details
    Animal animal; //This element has a value if the patient is an animal
    ResourceReference provider; //The provider for whom this is a patient record
    CodeableConcept diet; //Dietary restrictions for the patient
    CodeableConcept confidentiality; //Confidentiality of the patient records
    CodeableConcept recordLocation; //The location of the paper record for the patient, if there is one
    
@public
    + (NSArray) <ResourceReference> link;//UNSURE OF PROPER FORMAT FOR THIS METHOD
    + (BOOL)getActive; //returns whether the patient is active
    + (void)setActive:(BOOL *)value; //sets the patients active value
    + (NSArray) <HumanId> identifier;//UNSURE OF PROPER FORMAT FOR THIS METHOD
    + (Demographics)getDetails; //returns details demographics on the patient
    + (void)setDetails:(Demographics *)value; //sets the detail demographics on the patient
    + (Animal)getAnimal; //returns animal
    + (void)setAnimal:(Animal *)value; //sets animal
    + (ResourceReference)getProvider; //returns the provider of the document for the patient
    + (void)setProvider:(ResourceReference *)value; //sets the provider of the document
    + (CodeableConcept)getDiet; //returns the dietary requirements for patient
    + (void)setDiet:(CodeableConcept *)value; //sets the dietary requirements for the patient
    + (CodeableConcept)getConfidentiality; //returns the confidentiality of the patients paperwork
    + (void)setConfidentiality:(CodeableConcept *)value; //sets the confidentiality of the patients paperwork
    + (CodeableConcept)getRecordLocation; //returns location of the patients records
    + (void)setRecordLocation:(CodeableConcept *)value; //sets the location of the records
    
    +(ResourceType)getResourceType; //override method
    
}
@end
