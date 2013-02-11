//
//  Language.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeableConcept.h"

@interface Language : Element

- (CodeableConcept *)getLanguage;
- (void)setLanguage:(CodeableConcept *)value;
- (CodeableConcept *)getMode;
- (void)setMode:(CodeableConcept *)value;
- (CodeableConcept *)getProficiencyLevel;
- (void)setProficiencyLevel:(CodeableConcept *)value;
- (BOOL *)getPreference;
- (void)setPreference:(BOOL *)value;

@property (nonatomic, retain) CodeableConcept *language; //The ISO-639-1 alpha 2 code in lower case for the language, optionally followed by a hyphen and the ISO-3166-1 alpha 2 code for the region in upper case. E.g. "en" for English, or "en-US" for American English versus "en-EN" for England English
@property (nonatomic, retain) CodeableConcept *mode; //A value representing the person's method of expression of this language. Examples: expressed spoken, expressed written, expressed signed, received spoken, received written, received signed
@property (nonatomic, retain) CodeableConcept *proficiencyLevel; //A code that describes how well the language is spoken
@property (nonatomic) BOOL *preference; //Indicates whether or not the Person prefers this language (over other languages he masters up a certain level)

@end
