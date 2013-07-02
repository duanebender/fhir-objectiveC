//
//  JSONToDict.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A script to turn json files into their corrisponding FHIR Object
 */

#import <Foundation/Foundation.h>
#import "FHIRPatient.h"
#import "FHIROrganization.h"
#import "FHIRAdverseReaction.h"
#import "FHIRAlert.h"
#import "FHIRAllergyIntolerance.h"
#import "FHIRCarePlan.h"
#import "FHIRMedication.h"
#import "FHIRCoverage.h"
#import "FHIRMedicationAdministration.h"
#import "FHIRMedicationDispense.h"
#import "FHIRMedicationPrescription.h"
#import "FHIRMedicationStatement.h"

@interface JSONToDict : NSObject

- (NSObject *)convertJsonToDictionary:(NSString *)urlString; //takes a json file and creates a corrisponding object (ex. Patient.json will make a Patient Object

@end
