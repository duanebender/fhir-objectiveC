//
//  CodeableConcept.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
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

@end

