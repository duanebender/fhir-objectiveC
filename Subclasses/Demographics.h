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
#import "CodeableConcept.h"
#import "Bool.h"
#import "HumanName.h"
#import "Contact.h"
#import "Address.h"
#import "Language.h"

@interface Demographics : Type

@property (nonatomic, retain) FHIRResourceDictionary *demographicsDictionary; //dictionary of resources in Demographics

//following properties are individual parts of the Demographics Object that can be influenced Individually
@property (nonatomic, retain) NSMutableArray *name; //A name associated with the individual. Array of "HumanName" in case name has changed over time.
@property (nonatomic, retain) NSMutableArray *telecom; //A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted. Array of "Contact" in case multiple forms of contact. 
@property (nonatomic, retain) Coding *gender; //Administrative Gender - the gender that the patient is considered to have for administration / record keeping purposes
@property (nonatomic, retain) String *birthDate; //The birth date for the individual, to the degre of precision now
@property (nonatomic) Bool *deceased; //Indicates if the individual is deceased or not
@property (nonatomic, retain) NSMutableArray *address; //One or more addresses for the individual. An array of Addresses.
@property (nonatomic, retain) CodeableConcept *maritalStatus; //This field contains a patient's marital (civil) status.
@property (nonatomic, retain) NSMutableArray *language; //A language spoken by the person, with proficiency. Array contains Languages only

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSdictionary containing all elements of Demographics
- (void)demographicsParser:(NSDictionary *)dictionary; //set this demographics object from an NSdictionary

@end