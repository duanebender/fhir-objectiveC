//
//  Ingredient.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * The ingredients of the medication.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"
#import "FHIRRatio.h"

@interface FHIRIngredient : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *ingredientDictionary; //a dictionary containing all resources in this ingredient object

//following properties are individual parts of the ingredient Object that can be influenced Individually
@property (nonatomic, retain) FHIRResourceReference *item; //The actual ingredient - either a substance (simple ingredient) or another medication. (Substance|Medication)
@property (nonatomic, retain) FHIRRatio *amount; //Specifies how many (or how much) of the items there are in this Medication. E.g. 250 mg per tablet.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this ingredient Object
- (void)ingredientParser:(NSDictionary *)dictionary; //set this ingredient object from an NSdictionary

@end
