//
//  Coding.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Coding.h"

@interface Coding()

@property (nonatomic, retain) Uri *system; //The identification of the system that defines the meaning of the symbol in the code. Can be a simple list of enumerations, a list of codes with meanings or all the way to a complex semantic web such as SNOMED-CT, whether classification, terminology, or ontology
@property (nonatomic, retain) Code *code; //A symbol in syntax defined by the system. The symbol may be a predefined code or an expression in a syntax defined by the coding system
@property (nonatomic, retain) String_ *display; //A representation of the meaning of the code in the system, following the rules laid out by the system.

@end

@implementation Coding

- (Uri *)getSystem
{
    return self.system;
}

+ (void)setSystem:(Uri *)value
{
    self.system = value;
}

- (Code *)getCode
{
    return self.code;
}

+ (void)setCode:(Code *)value
{
    self.code = value;
}

- (String_ *)getDisplay
{
    return self.display;
}

+ (void)setDisplay:(String_ *)value
{
    self.display = value;
}

@end
