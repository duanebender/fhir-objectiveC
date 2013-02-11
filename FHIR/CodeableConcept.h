//
//  CodeableConcept.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"
#import "Coding.h"
#import "String_.h"


// A concept that may be defined by a formal reference to a terminology or ontology or may be provided by text
@interface CodeableConcept : Type

- (NSArray *)getCoding; //returns an array filled with "Coding" objects
- (String_ *)getText; //return text field written by sender
- (void)setText:(String_ *)value; //set the text field about the concept
- (NSString *)getPrimary; //??
- (void)setPrimary:(NSString *)value; //??

@property (nonatomic, retain) NSArray *coding; //A reference to a code defined by a terminology system. Contains "coding" objects only.
@property (nonatomic, retain) String_ *text; //A human language representation of the concept as seen/selected/uttered by the user who entered the data and/or which represents the intended meaning of the user or concept
@property (nonatomic, retain) NSString *primary; //Indicates which of the codes in the codings was chosen by a user, if one was chosen directly

@end

