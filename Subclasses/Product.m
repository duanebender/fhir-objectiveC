//
//  Product.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Product.h"

@implementation Product

@synthesize productDictionary = _productDictionary; //a dictionary containing all resources in this product object
@synthesize form = _form; //Describes the form of the item. Powder; tables; carton.
@synthesize ingredient = _ingredient; //THIS ARRAY CONTAINS "Ingredient" OBJECTS ONLY. The ingredients of the medication.

- (id)init
{
    self = [super init];
    if (self) {
        _productDictionary = [[FHIRResourceDictionary alloc] init];
        _form = [[CodeableConcept alloc] init];
        _ingredient = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _productDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [_form generateAndReturnDictionary], @"form",
                                          [ExistanceChecker generateArray:_ingredient], @"form",
                                          nil];
    _productDictionary.resourceName = @"Product";
    [_productDictionary cleanUpDictionaryValues];
    return _productDictionary.dataForResource;
}

- (void)activityParser:(NSDictionary *)dictionary
{
    [_form codeableConceptParser:[dictionary objectForKey:@"form"]];
    
    //_ingredient
    NSArray *ingredientArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"ingedient"]];
    _ingredient = [[NSMutableArray alloc] init];
    for (int i = 0; i < [ingredientArray count]; i++)
    {
        Ingredient *tempIN = [[Ingredient alloc] init];
        [tempIN ingredientParser:[ingredientArray objectAtIndex:i]];
        [_ingredient addObject:tempIN];
        //NSLog(@"%@", _ingredient);
    }
    
}

@end
