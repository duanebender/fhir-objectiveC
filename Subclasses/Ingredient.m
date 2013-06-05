//
//  Ingredient.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Ingredient.h"

@implementation Ingredient

@synthesize ingredientDictionary = _ingredientDictionary; //a dictionary containing all resources in this ingredient object
@synthesize item = _item; //The actual ingredient - either a substance (simple ingredient) or another medication.
@synthesize amount = _amount; //Specifies how many (or how much) of the items there are in this Medication. E.g. 250 mg per tablet.

- (id)init
{
    self = [super init];
    if (self) {
        _ingredientDictionary = [[FHIRResourceDictionary alloc] init];
        _item = [[Resource alloc] init];
        _amount = [[Ratio alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _ingredientDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [_item generateAndReturnDictionary], @"item",
                                          [_amount generateAndReturnDictionary], @"amount",
                                          nil];
    _ingredientDictionary.resourceName = @"Ingredient";
    [_ingredientDictionary cleanUpDictionaryValues];
    return _ingredientDictionary.dataForResource;
}

- (void)ingredientParser:(NSDictionary *)dictionary
{
    [_item resourceParser:[dictionary objectForKey:@"item"]];
    [_amount ratioParser:[dictionary objectForKey:@"amount"]];
}

@end
