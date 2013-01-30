//
//  FHIR.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Patient.h"

@interface Animal()

@property (nonatomic, retain) CodeableConcept *species; //Identifies the high level categorization of the kind of animal
@property (nonatomic, retain) CodeableConcept *breed; //Identifies the detailed categorization of the kind of animal.
@property (nonatomic, retain) CodeableConcept *genderStatus; //Indicates the current state of the animal's reproductive organs

@end

@interface Patient()

@property (nonatomic, retain) NSArray link; //THIS ARRAY IS FILLED WITH "ResourceReference" OBJECTS ONLY. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
@property (nonatomic, retain) BOOL *active; //Whether the patient record is in use, or has been removed from active use
@property (nonatomic, retain) NSArray *identifier; //THIS ARRAY IS FILLED WITH "HumanId" OBJECTS ONLY.. An identifier that applies to this person as a patient
@property (nonatomic, retain) Demographics *details; //Patient Demographic details
@property (nonatomic, retain) Animal *animal; //This element has a value if the patient is an animal
@property (nonatomic, retain) ResourceReference *provider; //The provider for whom this is a patient record
@property (nonatomic, retain) CodeableConcept *diet; //Dietary restrictions for the patient
@property (nonatomic, retain) CodeableConcept *confidentiality; //Confidentiality of the patient records
@property (nonatomic, retain) CodeableConcept *recordLocation; //The location of the paper record for the patient, if there is one

@end

@implementation Patient:Resource //could also be @interface Patient (Resource):NSObject


    @implementation Animal:Element //could also be @interface Animal (Element):NSObject
    

        - (CodeableConcept *)getSpecies
        {
            return self.species;
        }

        - (void)setSpecies:(CodeableConcept *)value
        {
            self.species = value;
        }

        - (CodeableConcept *)getBreed
        {
            return self.breed;
        }

        - (void)setBreed:(CodeableConcept *)value
        {
            self.breed = value;
        }

        - (CodeableConcept *)getGenderStatus
        {
            return self.genderStatus;
        }

        - (void)setGenderStatus:(CodeableConcept *)value
        {
            self.genderStatus = value;
        }

    
    @end
    
    - (NSArray *)getLink
    {
        return self.link;
    }
    
    - (BOOL *)getActive
    {
        return self.active;
    }
    
    - (void)setActive:(BOOL *)value
    {
        self.active = value;
    }
    
    - (NSArray *)getIdentifier
    {
        return self.identifier;
    }
    
    - (Demographics *)getDetails
    {
        return self.details;
    }
    
    - (void)setDetails:(Demographics *)value
    {
        self.details = value;
    }
    
    - (Animal *)getAnimal
    {
        return self.animal;
    }
    
    - (void)setAnimal:(Animal *)value
    {
        self.animal = value;
    }
    
    - (ResourceReference *)getProvider
    {
        retrun self.provider;
    }
    
    - (void)setProvider:(ResourceReference *)value
    {
        self.provider = value;
    }
    
    - (CodeableConcept *)getDiet
    {
        return self.diet;
    }
    
    - (void)setDiet:(CodeableConcept *)value
    {
        self.diet = value;
    }
    
    - (CodeableConcept *)getConfidentiality
    {
        return this.confidentiality;
    }
    
    - (void)setConfidentiality:(CodeableConcept *)value
    {
        self.confidentiality = value;
    }
    
    - (CodeableConcept *)getRecordLocation
    {
        return self.recordLocation;
    }
    
    - (void)setRecordLocation:(CodeableConcept *)value
    {
        self.recordLocation = value;
    }
    
    //override method
    - (ResourceType *)getResourceType
    {
        return ResourceType.Patient;
    }

@end
