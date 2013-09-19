//
//  FHIRContactEntity.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-17.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Contact for the organization for a certain purpose.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRHumanName.h"
#import "FHIRCodeableConcept.h"
#import "FHIRAddress.h"
#import "FHIRContact.h"

@interface FHIRContactEntity : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *contactEntityDictionary; //dictionary of all contactEntity resources

//following properties are individual parts of the contactEntity Object that can be influenced Individually
@property (nonatomic, strong) FHIRCodeableConcept *type; //Indicates a purpose for which the contact can be reached.
@property (nonatomic, strong) FHIRHumanName *name; //A name associated with the contact.
@property (nonatomic, strong) NSMutableArray *telecom; //CONTAINS "Contact" OBJECTS ONLY. A contact detail (e.g. a telephone number or an email address) by which the party may be contacted.
@property (nonatomic, strong) FHIRAddress *address; //Visiting or postal addresses for the contact.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of contactEntity containing all it's elements
- (void)contactEntityParser:(NSDictionary *)dictionary; //set contactEntity from an NSdictionary

@end
