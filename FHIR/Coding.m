//
//  Coding.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Coding.h"

@implementation Coding

@synthesize system = _system; //The identification of the system that defines the meaning of the symbol in the code. Can be a simple list of enumerations, a list of codes with meanings or all the way to a complex semantic web such as SNOMED-CT, whether classification, terminology, or ontology
@synthesize code = _code; //A symbol in syntax defined by the system. The symbol may be a predefined code or an expression in a syntax defined by the coding system
@synthesize display = _display; //A representation of the meaning of the code in the system, following the rules laid out by the system.

@end
