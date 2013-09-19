//
//  DictToJSON.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FHIRResourceDictionary.h"
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

@interface DictToJSON : NSObject

@property (nonatomic, retain) NSString *jsonString;

- (void)generateJson:(NSObject *)jsonObject urlPath:(NSString *)urlString;

@end
