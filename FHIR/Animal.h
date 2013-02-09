//
//  Animal.h
//  FHIR
//
//  Created by Duane Bender on 13-02-09.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"
#import "CodeableConcept.h"

@interface Animal : Element {


}

- (CodeableConcept *)getSpecies; //get species of animal and return
- (void)setSpecies:(CodeableConcept *)value; //set species of this instance of animal
- (CodeableConcept *)getBreed; //get breed of animal and return
- (void)setBreed:(CodeableConcept *)value; //set breed of this instance of animal
- (CodeableConcept *)getGenderStatus; //returns gender of the animal
- (void)setGenderStatus:(CodeableConcept *)value; //set gender of this instance of animal

@property (nonatomic, retain) CodeableConcept *species; //Identifies the high level categorization of the kind of animal
@property (nonatomic, retain) CodeableConcept *breed; //Identifies the detailed categorization of the kind of animal.
@property (nonatomic, retain) CodeableConcept *genderStatus; //Indicates the current state of the animal's reproductive organs

@end


