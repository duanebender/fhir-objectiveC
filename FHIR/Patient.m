//
//  FHIR.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Patient.h"


@implementation Patient //could also be @interface Patient (Resource):NSObject

@synthesize active;

    
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
