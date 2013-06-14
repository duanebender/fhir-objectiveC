//
//  CodeableConcept.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A concept that may be defined by a formal reference to a terminology or ontology or may be provided by text
 */

#import <Foundation/Foundation.h>
#import "FHIRCoding.h"

@interface FHIRCodeableConcept : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *codeableConceptDictionary; //dictionary of all resources for formatting

//following properties are individual parts of the CodeableConcept Object that can be influenced Individually
@property (nonatomic, retain) NSMutableArray *coding; //A reference to a code defined by a terminology system. Contains "coding" objects only.
@property (nonatomic, retain) FHIRString *text; //A human language representation of the concept as seen/selected/uttered by the user who entered the data and/or which represents the intended meaning of the user or concept
@property (nonatomic, retain) FHIRString *primary; //Indicates which of the codes in the codings was chosen by a user, if one was chosen directly

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this CodeableConcept Object
- (void)codeableConceptParser:(NSDictionary *)dictionary; //sets this CodeableConcept Object from an NSDictionary

@end

