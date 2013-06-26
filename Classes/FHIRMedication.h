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
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"
#import "FHIRCodeableConcept.h"
#import "FHIRPackage.h"
#import "FHIRProduct.h"

@interface FHIRMedication : FHIRResource

@property (nonatomic, strong) FHIRResourceDictionary *medicationDictionary; //a dictionary containing all resources in this medication object
@property (nonatomic, strong) FHIRResource *resourceTypeValue;

//following properties are individual parts of the Medication Object that can be influenced Individually
@property (nonatomic, strong) FHIRString *name; //The common name of the medication.
@property (nonatomic, strong) FHIRCodeableConcept *code; //References to codes for this medication in standard medication terminologies, drug dictionaries, etc.
@property (nonatomic, strong) FHIRBool *isBrand; //Set to true if the item is attributable to a specific manufacturer (even if we don't know who that is).
@property (nonatomic, strong) FHIRResourceReference *manufacturer; //Describes the details of the manufacturer. (Organization)
@property (nonatomic, strong) FHIRCode *kind; //product | package.
@property (nonatomic, strong) FHIRPackage *package; //Specifies Ingredient / Product / Package.
@property (nonatomic, strong) FHIRProduct *product; //If is a product.

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case CarePlan
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from medication in an NSdictionary format

- (void)medicationParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an medication object

@end
