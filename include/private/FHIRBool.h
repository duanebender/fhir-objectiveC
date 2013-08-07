//
//  Bool.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A standard Boolean object
 */

#import <Foundation/Foundation.h>
#import "FHIRType.h"

@interface FHIRBool : FHIRType

@property (nonatomic) BOOL value; //a bool value of true or false
@property (nonatomic) NSString *original; //holds the original string value if the bool is to change

- (NSObject *)generateAndReturnDictionary; //returns bool ready to be formatted
- (void)setValueBool:(NSDictionary *)dictionary; //sets the bool from dictionary

@end
