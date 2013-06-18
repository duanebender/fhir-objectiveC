//
//  Demographics.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A description of an individual who is involved in healthcare processes. The individual may be a patient, a provider of care services, or related to a patient in some way or other.
 */

#import <Foundation/Foundation.h>
#import "FHIRCodeableConcept.h"
#import "FHIRBool.h"
#import "FHIRHumanName.h"
#import "FHIRContact.h"
#import "FHIRAddress.h"
#import "FHIRLanguage.h"

@interface FHIRDemographics : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *demographicsDictionary; //dictionary of resources in Demographics

//following properties are individual parts of the Demographics Object that can be influenced Individually
@property (nonatomic, strong) NSMutableArray *identifier; //An identifier for this individual.
@property (nonatomic, strong) NSMutableArray *name; //A name associated with the individual. Array of "HumanName" in case name has changed over time.
@property (nonatomic, strong) NSMutableArray *telecom; //A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted. Array of "Contact" in case multiple forms of contact.
@property (nonatomic, strong) FHIRCoding *gender; //Administrative Gender - the gender that the patient is considered to have for administration / record keeping purposes
@property (nonatomic, strong) NSDate *birthDate; //The birth date for the individual, to the degre of precision now
@property (nonatomic, strong) FHIRBool *deceased; //Indicates if the individual is deceased or not
@property (nonatomic, strong) NSMutableArray *address; //One or more addresses for the individual. An array of Addresses.
@property (nonatomic, strong) NSMutableArray *photo; //THIS ARRAY CONTAINS "ResourceReference(Picture)" OBJECTS ONLY. Image of the person.
@property (nonatomic, strong) FHIRCodeableConcept *maritalStatus; //This field contains a patient's marital (civil) status.
@property (nonatomic, strong) NSMutableArray *language; //A language spoken by the person, with proficiency. Array contains Languages only

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSdictionary containing all elements of Demographics
- (void)demographicsParser:(NSDictionary *)dictionary; //set this demographics object from an NSdictionary

@end