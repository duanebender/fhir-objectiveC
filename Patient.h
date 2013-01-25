//
//  Patient.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifndef FHIR_Patient_h
#define FHIR_Patient_h

/**
 * A patient is a person or animal that is recieving care
 */
@interface Patient (Resource)

    @interface Animal (Element)

        //Identifies the high level categorization of the kind of animal
        private CodableConcept *species;

        //Identifies the detailed categorization of the kind of animal
        private CodableConcept *breed;

        //Indicates animals sex
        private CodableConcept *genderStatus;

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

    @end

@protected NSArray <ResourceReference> link;

@end




#endif
