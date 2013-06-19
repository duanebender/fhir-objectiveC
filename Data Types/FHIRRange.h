//
//  FHIRRange.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIR.h"

@interface FHIRRange : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *rangeDictionary; //resources for choice

//following properties are individual parts of the Range Object that can be influenced Individually
@property (nonatomic, retain) FHIRQuantity *low; //low limit.
@property (nonatomic, retain) FHIRQuantity *high; //high limit.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all of the elements of this range Object
- (void)rangeParser:(NSDictionary *)dictionary; //set this Range Object from an NSDictionary

@end
