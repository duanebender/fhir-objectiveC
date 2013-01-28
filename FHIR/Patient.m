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

        + (CodableConcept)getSpecies
        {
            return self.species;
        }

        + (void)setSpecies:(CodableConcept)value
        {
            self.species = value;
        }

        + (CodableConcept)getBreed
        {
            return self.breed;
        }

        + (void)setBreed:(CodableConcept)value
        {
            self.breed = value;
        }

        + (CodableConcept)getGenderStatus
        {
            return self.genderStatus;
        }

        + (void)setGenderStatus:(CodableConcept)value
        {
            self.genderStatus = value;
        }

    }
    
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
    
    + (CodableConcept)getDiet
    {
        return self.diet;
    }
    
    + (void)setDiet:(CodableConcept *)value
    {
        self.diet = value;
    }
    
    + (CodableConcept)getConfidentiality
    {
        return this.confidentiality;
    }
    
    + (void)setConfidentiality:(CodableConcept *)value
    {
        self.confidentiality = value;
    }
    
    + (CodableConcept)getRecordLocation
    {
        return self.recordLocation;
    }
    
    + (void)setRecordLocation:(CodableConcept *)value
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
