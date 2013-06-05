//
//  Medication.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Medication.h"

@implementation Medication

@synthesize medicationDictionary = _medicationDictionary; //a dictionary containing all resources in this medication object
@synthesize name = _name; //The common name of the medication.
@synthesize code = _code; //References to codes for this medication in standard medication terminologies, drug dictionaries, etc.
@synthesize isBrand = _isBrand; //Set to true if the item is attributable to a specific manufacturer (even if we don't know who that is).
@synthesize manufacturer = _manufacturer; //Describes the details of the manufacturer.
@synthesize kind = _kind; //product | package.
@synthesize package = _package; //Specifies Ingredient / Product / Package.
@synthesize product = _product; //If is a product.

- (id)init
{
    self = [super init];
    if (self) {
        _medicationDictionary = [[FHIRResourceDictionary alloc] init];
        _name = [[String alloc] init];
        _code = [[CodeableConcept alloc] init];
        _isBrand = [[Bool alloc] init];
        _manufacturer = [[Resource alloc] init];
        _package = [[Package alloc] init];
        _product = [[Product alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return @"medication";
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    _medicationDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [_name generateAndReturnDictionary], @"name",
                                           [_code generateAndReturnDictionary], @"code",
                                           [_isBrand generateAndReturnDictionary], @"isBrand",
                                           [_manufacturer generateAndReturnDictionary], @"manufacturer",
                                           [_package generateAndReturnDictionary], @"package",
                                           [_product generateAndReturnDictionary], @"product",
                                           nil];
    [_medicationDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_medicationDictionary.dataForResource, @"Medication", nil];
    returnable.resourceName = @"medication";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)medicationParser:(NSDictionary *)dictionary
{
    NSDictionary *medicationDict = [dictionary objectForKey:@"Medication"];
    //NSLog(@"%@", medicationDict);
    
    [_name setValueString:[medicationDict objectForKey:@"name"]];
    [_code codeableConceptParser:[medicationDict objectForKey:@"code"]];
    [_isBrand setValueBool:[medicationDict objectForKey:@"isBrand"]];
    [_manufacturer resourceParser:[medicationDict objectForKey:@"manufacturer"]];
    [_package packageParser:[medicationDict objectForKey:@"package"]];
    [_product productParser:[medicationDict objectForKey:@"product"]];
    
}

@end
