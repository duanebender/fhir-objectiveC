//
//  String.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A standard string object
 */

#import <Foundation/Foundation.h>
#import "FHIRType.h"

@interface FHIRString : FHIRType

//value of this string for direct influence
@property (nonatomic, retain) NSString *value; //contains the value of a string

//Public Methods
- (NSObject *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this String Object
- (void)setValueString:(NSDictionary *)dictionary; //sets this string from an NSDictionary

@end
