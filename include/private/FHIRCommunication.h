//
//  Communication.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Contains language information
 */

#import <Foundation/Foundation.h>
#import "FHIRCodeableConcept.h"
#import "FHIRBool.h"

@interface FHIRCommunication : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *languageDictionary; //holds all language resources

//following properties are individual parts of the Identifier Object that can be influenced Individually
@property (nonatomic, retain) FHIRCodeableConcept *language; //The ISO-639-1 alpha 2 code in lower case for the language, optionally followed by a hyphen and the ISO-3166-1 alpha 2 code for the region in upper case. E.g. "en" for English, or "en-US" for American English versus "en-EN" for England English
@property (nonatomic, retain) FHIRCodeableConcept *mode; //A value representing the person's method of expression of this language. Examples: expressed spoken, expressed written, expressed signed, received spoken, received written, received signed
@property (nonatomic, retain) FHIRCodeableConcept *proficiencyLevel; //A code that describes how well the language is spoken
@property (nonatomic) FHIRBool *preference; //Indicates whether or not the Person prefers this language (over other languages he masters up a certain level)

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this Language Object
- (void)communicationParser:(NSDictionary *)dictionary; //set this language object from an NSdictionary

@end
