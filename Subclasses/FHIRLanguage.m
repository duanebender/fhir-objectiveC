//
//  Language.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRLanguage.h"

@implementation FHIRLanguage

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
        _language = [[FHIRCodeableConcept alloc] init];
        _mode = [[FHIRCodeableConcept alloc] init];
        _proficiencyLevel = [[FHIRCodeableConcept alloc] init];
        _preference = [[FHIRBool alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _languageDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [_language generateAndReturnDictionary], @"language",
                                            [_mode generateAndReturnDictionary], @"mode",
                                            [_proficiencyLevel generateAndReturnDictionary], @"proficiency",
                                            [_preference generateAndReturnDictionary], @"preference",
                                            nil];
    _languageDictionary.resourceName = @"Language";
    [_languageDictionary cleanUpDictionaryValues];
    return _languageDictionary.dataForResource;
}

- (void)languageParser:(NSDictionary *)dictionary
{
    [_language codeableConceptParser:[dictionary objectForKey:@"language"]];
    [_mode codeableConceptParser:[dictionary objectForKey:@"mode"]];
    [_proficiencyLevel codeableConceptParser:[dictionary objectForKey:@"proficiency"]];
    [_preference setValueBool:[dictionary objectForKey:@"preference"]];
}

@end
