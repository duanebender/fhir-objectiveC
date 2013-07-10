//
//  Animal.m
//  FHIR
//
//  Created by Duane Bender 2013-02-09.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRAnimal.h"


@implementation FHIRAnimal : FHIRElement //could also be @interface Animal (Element):NSObject

@synthesize animalDictionary = _animalDictionary;

@synthesize species = _species; //Identifies the high level categorization of the kind of animal
@synthesize breed = _breed; //Identifies the detailed categorization of the kind of animal.
@synthesize genderStatus = _genderStatus; //Indicates the current state of the animal's reproductive organs

- (id)init
{
    self = [super init];
    if (self) {
        _species = [[FHIRCodeableConcept alloc] init];
        _breed = [[FHIRCodeableConcept alloc] init];
        _genderStatus = [[FHIRCodeableConcept alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _animalDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [FHIRExistanceChecker emptyObjectChecker:[_species generateAndReturnDictionary]], @"species",
                                               [FHIRExistanceChecker emptyObjectChecker:[_breed generateAndReturnDictionary]], @"breed",
                                               [FHIRExistanceChecker emptyObjectChecker:[_genderStatus generateAndReturnDictionary]], @"genderStatus",
                                               nil];
    _animalDictionary.resourceName = @"Animal";
    [_animalDictionary cleanUpDictionaryValues];
    return _animalDictionary.dataForResource;
}

- (void)animalParser:(NSDictionary *)dictionary
{
    [_species codeableConceptParser:[dictionary objectForKey:@"species"]];
    [_breed codeableConceptParser:[dictionary objectForKey:@"breed"]];
    [_genderStatus codeableConceptParser:[dictionary objectForKey:@"genderStatus"]];
}

@end
