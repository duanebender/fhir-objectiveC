//
//  Ratio.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A ratio of two Quantity values - a numerator and a denominator.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRQuantity.h"

@interface FHIRRatio : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *ratioDictionary; //resources for ratio

//following properties are individual parts of the Ratio Object that can be influenced Individually
@property (nonatomic, retain) FHIRQuantity *numerator; //The numerator.
@property (nonatomic, retain) FHIRQuantity *denominator; //The denominator.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all of the elements of this Ratio Object
- (void)ratioParser:(NSDictionary *)dictionary; //set this Ratio Object from an NSDictionary

@end
