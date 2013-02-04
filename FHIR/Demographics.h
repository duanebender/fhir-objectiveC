//
//  Demographics.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

/**
 * A description of an individual who is involved in healthcare processes. The individual may be a patient, a provider of care services, or related to a patient in some way or other.
 */

#import <Foundation/Foundation.h>
#import "Type.h"
#import "Element.h"
#import "CodeableConcept.h"

@interface Demographics : Type

- (NSMutableArray *)getName; //return an array of names <HumanName>
- (NSMutableArray *)getTelecom; //return an array of contacts <contact>
- (Coding *)getGender;
- (void)setGender:(Coding *)value;
- (NSDate *)getBirthDate;
- (void)setBirthDate:(NSDate *)value;
- (BOOL *)getDeceased;
- (void)setDeceased:(BOOL *)value;
- (NSMutableArray *)getAddress; //return an array of addresses <address>
- (CodeableConcept *)getMaritalStatus;
- (void)setMaritalStatus:(CodeableConcept *)value;
- (NSMutableArray *)getLanguage; //return an array of languages <language>

@end

@interface Language : Element

- (CodeableConcept *)getLanguage;
- (void)setLanguage:(CodeableConcept *)value;
- (CodeableConcept *)getMode;
- (void)setMode:(CodeableConcept *)value;
- (CodeableConcept *)getProficiencyLevel;
- (void)setProficiencyLevel:(CodeableConcept *)value;
- (BOOL *)getPreference;
- (void)setPreference:(BOOL *)value;

@end