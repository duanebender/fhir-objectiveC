//
//  Language.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Language.h"

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
