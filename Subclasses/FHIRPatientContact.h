//
//  FHIRPatientContact.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-17.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A contact party (e.g. guardian, partner, friend) for the patient.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRHumanName.h"
#import "FHIRAddress.h"
#import "FHIRCodeableConcept.h"
#import "FHIRContact.h"

@interface FHIRPatientContact : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *patientContactDictionary; //dictionary of all patientContact resources

//following properties are individual parts of the PatientContact Object that can be influenced Individually
@property (nonatomic, strong) NSMutableArray *relationship; //THIS ARRAY IS FILLED WITH "PatientContact" OBJECTS ONLY. The nature of the relationship between the patient and the contactperson.
@property (nonatomic, strong) FHIRHumanName *name; //A name associated with the person.
@property (nonatomic, strong) NSMutableArray *telecom; //THIS ARRAY CONTAINS "Contact" OBJECTS ONLY. A contact detail for the person, e.g. a telephone number or an email address.
@property (nonatomic, strong) FHIRAddress *address; //One or more addresses for the person.
@property (nonatomic, strong) FHIRCodeableConcept *gender; //Administrative Gender - the gender that the person is considered to have for administration and record keeping purposes.
@property (nonatomic, strong) FHIRResourceReference *organization; //Details about the contact person. (Organization)

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of patientContact containing all it's elements
- (void)patientContactParser:(NSDictionary *)dictionary; //set patientContact from an NSdictionary

@end
