//
//  Quantity.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A measured amount (or an amount that can potentially be measured). Note that measured amounts include amounts that are not precisely quantified, including amounts involving arbitrary units and floating currencies
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"

@interface FHIRQuantity : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *quantityDictionary; //resources for quantity

//following properties are individual parts of the Quantity Object that can be influenced Individually
@property (nonatomic, retain) NSNumber *value; //The value of the measured amount. The value includes an implicit precision in the presentation of the value.
@property (nonatomic, retain) FHIRCode *comparator; //How the value should be understood and represented - whether the actual value is greater or less than the stated value due to measurement issues. E.g. if the comparator is "<" , then the real value is < stated value.
@property (nonatomic, retain) FHIRString *units; //A human readable form of the units.
@property (nonatomic, retain) FHIRUri *system; //The identification of the system that provides the coded form of the unit.
@property (nonatomic, retain) FHIRCode *code; //A computer processable form of the units in some unit representation system.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all of the elements of this Quantity Object
- (void)quantityParser:(NSDictionary *)dictionary; //set this Quantity Object from an NSDictionary

@end
