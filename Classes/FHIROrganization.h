//
//  Organization.h
//  FHIR
//
//  Created by Adam Sippel on 2013-05-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A formally or informally recognized grouping of people or organizations formed for the purpose of achieving some form of collective action. Includes companies, institutions, corporations, departments, community groups, healthcare practice groups, etc.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRCodeableConcept.h"
#import "FHIRContact.h"
#import "FHIRBool.h"
#import "FHIRResource.h"
#import "FHIRText.h"
#import "FHIRAddress.h"

@interface FHIROrganization : FHIRResource

@property (nonatomic, retain) FHIRResourceDictionary *organizationDictionary; //a dictionary containing all resources in this organization object

//following properties are individual parts of the Organization Object that can be influenced Individually
@property (nonatomic, retain) NSMutableArray *identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. Identification for the organization
@property (nonatomic, retain) NSMutableArray *name; //THIS ARRAY IS FILLED WITH "String" OBJECTS ONLY. Name of the organization
@property (nonatomic, retain) FHIRCodeableConcept *type; //the type of organization
@property (nonatomic, retain) NSMutableArray *address; //organization address details
@property (nonatomic, retain) NSMutableArray *telecom; //THIS ARRAY IS FILLED WITH "Contact" OBJECTS ONLY. Contact information about this organization
@property (nonatomic, retain) FHIRBool *active; //active status of the organization
@property (nonatomic, retain) FHIRResource *partOf; //holds resource type, text, name, and extensions
@property (nonatomic, retain) FHIRText *genText; //text holder for extra generated text

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case Organization
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from organization in an NSdictionary format

- (void)organizationParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an organization object

@end
