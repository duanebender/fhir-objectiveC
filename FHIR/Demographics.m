//
//  Demographics.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Demographics.h"

@interface Demographics()

@property (nonatomic, retain) NSMutableArray *name; //A name associated with the individual.
@property (nonatomic, retain) NSMutableArray *telecom; //A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.
@property (nonatomic, retain) Coding *gender; //Administrative Gender - the gender that the patient is considered to have for administration / record keeping purposes
@property (nonatomic, retain) NSDate *birthDate; //The birth date for the individual, to the degre of precision now
@property (nonatomic) BOOL *deceased; //Indicates if the individual is deceased or not
@property (nonatomic, retain) NSMutableArray *address; //One or more addresses for the individual
@property (nonatomic, retain) CodeableConcept *maritalStatus; //This field contains a patient's marital (civil) status.
@property (nonatomic, retain) NSMutableArray *language; //A language spoken by the person, with proficiency

@end

@interface Language()

@property (nonatomic, retain) CodeableConcept *language; //The ISO-639-1 alpha 2 code in lower case for the language, optionally followed by a hyphen and the ISO-3166-1 alpha 2 code for the region in upper case. E.g. "en" for English, or "en-US" for American English versus "en-EN" for England English
@property (nonatomic, retain) CodeableConcept *mode; //A value representing the person's method of expression of this language. Examples: expressed spoken, expressed written, expressed signed, received spoken, received written, received signed
@property (nonatomic, retain) CodeableConcept *proficiencyLevel; //A code that describes how well the language is spoken
@property (nonatomic) BOOL *preference; //Indicates whether or not the Person prefers this language (over other languages he masters up a certain level)

@end

@implementation Demographics

- (NSMutableArray *)getName
{
    return self.name;
}

- (NSMutableArray *)getTelecom
{
    return self.telecom;
}

- (Coding *)getGender
{
    return self.gender;
}

- (void)setGender:(Coding *)value
{
    self.gender = value;
}

- (NSDate *)getBirthDate
{
    return self.birthDate;
}

- (void)setBirthDate:(NSDate *)value
{
    self.birthDate = value;
}

- (BOOL *)getDeceased
{
    return self.deceased;
}

- (void)setDeceased:(BOOL *)value
{
    self.deceased = value;
}

- (NSMutableArray *)getAddress
{
    return self.address;
}

- (CodeableConcept *)getMaritalStatus
{
    return self.maritalStatus;
}

- (void)setMaritalStatus:(CodeableConcept *)value
{
    self.maritalStatus = value;
}

- (NSMutableArray *)getLanguage
{
    return self.language;
}

@end

@implementation Language

- (CodeableConcept *)getLanguage
{
    return self.language;
}

- (void)setLanguage:(CodeableConcept *)value
{
    self.language = value;
}

- (CodeableConcept *)getMode
{
    return self.mode;
}

- (void)setMode:(CodeableConcept *)value
{
    self.mode = value;
}

- (CodeableConcept *)getProficiencyLevel
{
    return self.proficiencyLevel;
}

- (void)setProficiencyLevel:(CodeableConcept *)value
{
    self.proficiencyLevel = value;
}

- (BOOL *)getPreference;
{
    return self.preference;
}

- (void)setPreference:(BOOL *)value
{
    self.preference = value;
}

@end
