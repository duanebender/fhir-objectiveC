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


// A concept that may be defined by a formal reference to a terminology or ontology or may be provided by text
@interface CodeableConcept : Type
{
    
@private
    NSArray *coding; //A reference to a code defined by a terminology system <Coding>
    NSString *text; //A human language representation of the concept as seen/selected/uttered by the user who entered the data and/or which represents the intended meaning of the user or concept
    NSString *primary; //Indicates which of the codes in the codings was chosen by a user, if one was chosen directly
   
}

+ (NSArray *)getCoding; //NOT SURE IF IMPLEMENTED PROPERLY <Coding>
+ (NSString *)getText;
+ (void)setText:(NSString *)value;
+ (NSString *)getPrimary;
+ (void)setPrimary:(NSString *)value;

@end

