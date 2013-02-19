//
//  Language.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Language.h"

@implementation Language

@synthesize languageDictionary = _languageDictionary;

@synthesize language = _language; //The ISO-639-1 alpha 2 code in lower case for the language, optionally followed by a hyphen and the ISO-3166-1 alpha 2 code for the region in upper case. E.g. "en" for English, or "en-US" for American English versus "en-EN" for England English
@synthesize mode = _mode; //A value representing the person's method of expression of this language. Examples: expressed spoken, expressed written, expressed signed, received spoken, received written, received signed
@synthesize proficiencyLevel = _proficiencyLevel; //A code that describes how well the language is spoken
@synthesize preference = _preference; //Indicates whether or not the Person prefers this language (over other languages he masters up a certain level)

- (id)init
{
    self = [super init];
    if (self) {
        _languageDictionary = [[FHIRResourceDictionary alloc] init];
        _language = [[CodeableConcept alloc] init];
        _mode = [[CodeableConcept alloc] init];
        _proficiencyLevel = [[CodeableConcept alloc] init];
        _preference = [[Bool alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnLanguageDictionary
{
    _languageDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [_language generateAndReturnCodeableConceptDictionary], @"language",
                                            [_mode generateAndReturnCodeableConceptDictionary], @"mode",
                                            [_proficiencyLevel generateAndReturnCodeableConceptDictionary], @"proficiency",
                                            [_preference generateAndReturnDictionary], @"preference",
                                            nil];
    _languageDictionary.resourceName = @"Language";
    return _languageDictionary.dataForResource;
}

@end