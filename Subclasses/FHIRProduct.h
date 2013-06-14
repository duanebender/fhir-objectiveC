//
//  Product.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * If is a product.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRCodeableConcept.h"
#import "FHIRIngredient.h"

@interface FHIRProduct : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *productDictionary; //a dictionary containing all resources in this product object

//following properties are individual parts of the product Object that can be influenced Individually
@property (nonatomic, retain) FHIRCodeableConcept *form; //Describes the form of the item. Powder; tables; carton.
@property (nonatomic, retain) NSMutableArray *ingredient; //THIS ARRAY CONTAINS "Ingredient" OBJECTS ONLY. The ingredients of the medication.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this Product Object
- (void)productParser:(NSDictionary *)dictionary; //set this product object from an NSdictionary

@end
