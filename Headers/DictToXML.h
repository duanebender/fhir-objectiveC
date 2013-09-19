//
//  DictToXML.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Turns your FHIR objects into an XML File
 */

#import <Foundation/Foundation.h>
#import "FHIRResourceDictionary.h"
#import "FHIRPatient.h"
#import "XMLWriter.h"
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

@interface DictToXML : NSObject

@property (nonatomic, retain) NSString *xmlString; //String to be printed out to the xml file
@property (nonatomic, retain) NSString *currentResource; //current resource type being used

- (void)generateXml:(NSObject *)xml urlPath:(NSString *)urlString; //this method takes in your FHIR object and turns it into an xml file send to the location represented by the urlString

@end
