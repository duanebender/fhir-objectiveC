//
//  Identifier.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * An unique identifier for a specific object
 */

#import <Foundation/Foundation.h>
#import "FHIRUri.h"
#import "FHIRString.h"

@interface FHIRIdentifier : FHIRType

//following properties are individual parts of the Identifier Object that can be influenced Individually
@property (nonatomic, retain) FHIRUri *system; //Establishes the namespace in which set of possible id values is unique.
@property (nonatomic, retain) FHIRString *idNumber; //The portion of the identifier typically displayed to the user and which is unique within the context of the system.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary containing all the elements of this Identifier Object
- (void)identifierParser:(NSDictionary *)dictionary; //set this identifier object from an NSdictionary

@end
