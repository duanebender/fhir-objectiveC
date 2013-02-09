//
//  Animal.m
//  FHIR
//
//  Created by Duane Bender on 13-02-09.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Animal.h"


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

