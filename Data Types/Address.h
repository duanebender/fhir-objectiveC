//
//  Address.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-14.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"
#import "String.h"
#import "Period.h"

typedef enum AddressUse
{
    AddressUseHome = 1, // The contents of the narrative are entirely generated from the structured data in the resource.
    AddressUseWork, //The contents of the narrative are entirely generated from the structured data in the resource and some of the content is generated from extensions
    AddressUseTemp, //The contents of the narrative contain additional information not found in the structured data
    AddressUseOld //the contents of the narrative are some equivalent of "No human readable text provided for this resource"
}AddressUse;

@interface Address : Type

@property (nonatomic, retain) FHIRResourceDictionary *addressDictionary; //dictionary of all resources for address

@property (nonatomic) NSInteger use; //Identifies the intended purpose of this address
@property (nonatomic, retain) String *text; //a full text representation of the address
@property (nonatomic, retain) NSMutableArray *part; //Part of an address line. Contains Strings only.
@property (nonatomic, retain) NSMutableArray *line; //A line of an address (typically used for street names & numbers, unit details, delivery hints, etc.). Contains String's only.
@property (nonatomic, retain) String *city; //The name of the city, town, village, or other community or delivery centre.
@property (nonatomic, retain) String *state; //Sub-unit of a country with limited sovereignty in a federally organized country. A code may be used if codes are in common use (i.e. US 2 letter state codes).
@property (nonatomic, retain) String *zip; //A postal code designating a region defined by the postal service.
@property (nonatomic, retain) String *country; //Country. ISO 3166 3 letter codes can be used in place of a full country name.
@property (nonatomic, retain) String *dpid; //A value that uniquely identifies the postal address. (Often used in barcodes).
@property (nonatomic, retain) Period *period; //Time period when address was/is in use.

- (void)setValueUse:(NSString *)codeString; //set AddressUse Using a string
- (NSString *)returnStringUse; //get AddressUse as a String

- (NSDictionary *)generateAndReturnAddressDictionary; //returns resource ready to be formatted
- (void)addressParser:(NSDictionary *)dictionary; //set address from dictionary

@end
