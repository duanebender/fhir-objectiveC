//
//  Medication.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * This is primarily for identification and definition of Medication, but also covers ingredients and packaging.
 */

#import <Foundation/Foundation.h>
#import "ExistanceChecker.h"
#import "Resource.h"
#import "CodeableConcept.h"
#import "Package.h"
#import "Product.h"

@interface Medication : Resource

@property (nonatomic, retain) FHIRResourceDictionary *medicationDictionary; //a dictionary containing all resources in this medication object

//following properties are individual parts of the Medication Object that can be influenced Individually
@property (nonatomic, retain) FHIRString *name; //The common name of the medication.
@property (nonatomic, retain) CodeableConcept *code; //References to codes for this medication in standard medication terminologies, drug dictionaries, etc.
@property (nonatomic, retain) Bool *isBrand; //Set to true if the item is attributable to a specific manufacturer (even if we don't know who that is).
@property (nonatomic, retain) Resource *manufacturer; //Describes the details of the manufacturer. (Organization)
@property (nonatomic, retain) Code *kind; //product | package.
@property (nonatomic, retain) Package *package; //Specifies Ingredient / Product / Package.
@property (nonatomic, retain) Product *product; //If is a product.

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case CarePlan
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from medication in an NSdictionary format

- (void)medicationParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an medication object

@end
