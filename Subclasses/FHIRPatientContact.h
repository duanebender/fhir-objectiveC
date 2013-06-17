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

#import <FHIR/FHIR.h>
#import "FHIRExistanceChecker.h"

@interface FHIRPatientContact : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *patientContactDictionary; //dictionary of all patientContact resources

//following properties are individual parts of the PatientContact Object that can be influenced Individually
@property (nonatomic, strong) NSMutableArray *relationship; //THIS ARRAY IS FILLED WITH "PatientContact" OBJECTS ONLY. The nature of the relationship between the patient and the contactperson.
@property (nonatomic, strong) FHIRResourceReference *organization; //Details about the contact person. (Organization)

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of patientContact containing all it's elements
- (void)patientContactParser:(NSDictionary *)dictionary; //set patientContact from an NSdictionary

@end
