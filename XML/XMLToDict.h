//
//  XMLToDict.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-04.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Turns XML files into their correct FHIR Objects (Ex. Patient.xml creates a Patient Object)
 */

#import <Foundation/Foundation.h>
#import "FHIRPatient.h"
#import "XMLReader.h"
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

@interface XMLToDict : NSObject <NSXMLParserDelegate>

- (NSObject *)convertXmlToDictionary:(NSString *)urlString; //takes an xml file and turns it into it's cooresponding FHIR Object

@end
