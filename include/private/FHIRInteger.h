//
//  FHIRInteger.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FHIRType.h"

@interface FHIRInteger : FHIRType

//value of this integer for direct influence
@property (nonatomic, retain) NSNumber *value; //contains the value of a integer

//Public Methods
- (NSObject *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this String Object
- (void)setValueInteger:(NSDictionary *)dictionary; //sets this string from an NSDictionary

@end
