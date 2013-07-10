//
//  Code.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * 
 */

#import <Foundation/Foundation.h>
#import "FHIRType.h"

@interface FHIRCode : FHIRType

//value of this code for direct influence
@property (nonatomic, retain) NSString *value; //contains the value of the code

//Public Methods
- (NSObject *)generateAndReturnDictionary; //returns and NSDictionary containing all the elements of this code object
- (void)setValueCode:(NSDictionary *)dictionary; //sets this code object from an NSdictionary

@end
