//
//  Animal.h
//  FHIR
//
//  Created by Duane Bender 2013-02-09.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * This is the Object representing everything to do with the animal aspects of a Patient.
 */

#import <Foundation/Foundation.h>
#import "CodeableConcept.h"
#import "Resource.h"

@interface Animal : Element

//Dictionary that holds all elements of this resource
@property (nonatomic, retain) FHIRResourceDictionary *animalDictionary; //contains all resources of animal

//following properties are individual parts of the Animal Object that can be influenced Individually
@property (nonatomic, retain) CodeableConcept *species; //Identifies the high level categorization of the kind of animal
@property (nonatomic, retain) CodeableConcept *breed; //Identifies the detailed categorization of the kind of animal.
@property (nonatomic, retain) CodeableConcept *genderStatus; //Indicates the current state of the animal's reproductive organs

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSdictionary containing all the elements of this Animal Object
- (void)animalParser:(NSDictionary *)dictionary; //sets animal values from an NSdictionary

@end
