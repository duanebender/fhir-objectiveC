//
//  Coding.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A reference to a code defined by a terminology system
 */

#import <Foundation/Foundation.h>
#import "FHIRUri.h"
#import "FHIRCode.h"
#import "FHIRString.h"

@interface FHIRCoding : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *codingDictionary; //hold all coding resources

//following properties are individual parts of the Coding Object that can be influenced Individually
@property (nonatomic, retain) FHIRUri *system; //The identification of the system that defines the meaning of the symbol in the code. Can be a simple list of enumerations, a list of codes with meanings or all the way to a complex semantic web such as SNOMED-CT, whether classification, terminology, or ontology
@property (nonatomic, retain) FHIRCode *code; //A symbol in syntax defined by the system. The symbol may be a predefined code or an expression in a syntax defined by the coding system
@property (nonatomic, retain) FHIRString *display; //A representation of the meaning of the code in the system, following the rules laid out by the system.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //return an NSDictionary containing all elements of this Coding Object
- (void)codingParser:(NSDictionary *)dictionary; //sets this coding object from an NSdictionary

@end
