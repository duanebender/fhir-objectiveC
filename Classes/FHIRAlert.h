//
//  Alert.h
//  FHIR
//
//  Created by Adam Sippel on 2013-05-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Prospective warnings of things that should be taken notice of when providing care to the patient.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"
#import "FHIRCodeableConcept.h"

@interface FHIRAlert : FHIRResource

@property (nonatomic, retain) FHIRResourceDictionary *alertDictionary; //a dictionary containing all resources in this alert object
@property (nonatomic, retain) FHIRResource *resourceTypeValue; //holds resource type, text, name, and extensions of this resource

//following properties are individual parts of the Alert Object that can be influenced Individually
@property (nonatomic, retain) FHIRCodeableConcept *category; //Allows an alert to be divided int different categories like clinical, administartive etc.
@property (nonatomic, retain) FHIRCode *status; //Supports basic workflow
@property (nonatomic, retain) FHIRResourceReference *subject; //The person who this alert concerns (Patient)
@property (nonatomic, retain) FHIRResourceReference *author; //The person or device that created the alert (Practitioner/Patient/Device)
@property (nonatomic, retain) FHIRString *note; //The textual component of the alert to display to the user

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case Alert
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from alert in an NSdictionary format

- (void)alertParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an alert object

@end
