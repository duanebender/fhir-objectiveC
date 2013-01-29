//
//  FHIR.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Patient.h"

@implementation FHIR

@implementation Patient:Resource //could also be @interface Patient (Resource):NSObject
{

    @implementation Animal:Element //could also be @interface Animal (Element):NSObject
    {

        + (CodeableConcept)getSpecies
        {
            return self.species;
        }

        + (void)setSpecies:(CodeableConcept)value
        {
            self.species = value;
        }

        + (CodeableConcept)getBreed
        {
            return self.breed;
        }

        + (void)setBreed:(CodeableConcept)value
        {
            self.breed = value;
        }

        + (CodeableConcept)getGenderStatus
        {
            return self.genderStatus;
        }

        + (void)setGenderStatus:(CodeableConcept)value
        {
            self.genderStatus = value;
        }

    }
    @end
    
    + (NSArray)<ResourceReference>getLink //NOT SURE OF PROPER CODE FOR THIS
    {
        return self.link;
    }
    
    + (BOOL)getActive
    {
        return self.active;
    }
    
    + (void)setActive:(BOOL *)value
    {
        self.active = value;
    }
    
    + (NSArray)<HumanId>getIdentifier //NOT SURE OF PROPER CODE FOR THIS
    {
        return self.identifier;
    }
    
    + (Demographics)getDetails
    {
        return self.details;
    }
    
    + (void)setDetails:(Demographics *)value
    {
        self.details = value;
    }
    
    + (Animal)getAnimal
    {
        return self.animal;
    }
    
    + (void)setAnimal:(Animal *)value
    {
        self.animal = value;
    }
    
    + (ResourceReference)getProvider
    {
        retrun self.provider;
    }
    
    + (void)setProvider:(ResourceReference *)value
    {
        self.provider = value;
    }
    
    + (CodeableConcept)getDiet
    {
        return self.diet;
    }
    
    + (void)setDiet:(CodeableConcept *)value
    {
        self.diet = value;
    }
    
    + (CodeableConcept)getConfidentiality
    {
        return this.confidentiality;
    }
    
    + (void)setConfidentiality:(CodeableConcept *)value
    {
        self.confidentiality = value;
    }
    
    + (CodeableConcept)getRecordLocation
    {
        return self.recordLocation;
    }
    
    + (void)setRecordLocation:(CodeableConcept *)value
    {
        self.recordLocation = value;
    }
    
    //override method
    + (ResourceType)getResourceType
    {
        return ResourceType.Patient;
    }

}
@end
