//
//  Animal.m
//  FHIR
//
//  Created by Duane Bender 2013-02-09.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Animal.h"


@implementation Animal:Element //could also be @interface Animal (Element):NSObject

@synthesize species = _species; //Identifies the high level categorization of the kind of animal
@synthesize breed = _breed; //Identifies the detailed categorization of the kind of animal.
@synthesize genderStatus = _genderStatus; //Indicates the current state of the animal's reproductive organs


@end
