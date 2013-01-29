//
//  Coding.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"

//A reference to a code defined by a terminology system
@interface Coding : Type
{

@private
    Uri system; //The identification of the system that defines the meaning of the symbol in the code. Can be a simple list of enumerations, a list of codes with meanings or all the way to a complex semantic web such as SNOMED-CT, whether classification, terminology, or ontology
    Code code; //A symbol in syntax defined by the system. The symbol may be a predefined code or an expression in a syntax defined by the coding system
    NSString *delay; //A representation of the meaning of the code in the system, following the rules laid out by the system.
    
}

+ (Uri)getSystem;
+ (void) setSystem:(Uri *)value;
+ (Code)getCode;
+ (void)setCode:(Code *)value;
+ (NSString *)getDisplay;
+ (void)setDisplay:(NSString *)value;

@end
