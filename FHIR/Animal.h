//
//  Animal.h
//  FHIR
//
//  Created by Duane Bender 2013-02-09.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeableConcept.h"
#import "Resource.h"

@interface Animal : Element

@property (nonatomic, retain) CodeableConcept *species; //Identifies the high level categorization of the kind of animal
@property (nonatomic, retain) CodeableConcept *breed; //Identifies the detailed categorization of the kind of animal.
@property (nonatomic, retain) CodeableConcept *genderStatus; //Indicates the current state of the animal's reproductive organs

@end
