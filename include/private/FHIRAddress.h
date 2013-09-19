//
//  Address.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-14.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A collection of all the address information from city to country, etc.
 */

#import <Foundation/Foundation.h>
#import "FHIRType.h"
#import "FHIRString.h"
#import "FHIRPeriod.h"

//definitions of each Use value
typedef enum AddressUse
{
    AddressUseHome = 1, // The contents of the narrative are entirely generated from the structured data in the resource.
    AddressUseWork, //The contents of the narrative are entirely generated from the structured data in the resource and some of the content is generated from extensions
    AddressUseTemp, //The contents of the narrative contain additional information not found in the structured data
    AddressUseOld //the contents of the narrative are some equivalent of "No human readable text provided for this resource"
}AddressUse;

@interface FHIRAddress : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *addressDictionary; //dictionary of all resources for address

//following properties are individual parts of the Address Object that can be influenced Individually
@property (nonatomic) NSInteger use; //Identifies the intended purpose of this address
@property (nonatomic, retain) FHIRString *useSV; //string value of use
@property (nonatomic, retain) FHIRString *text; //a full text representation of the address
@property (nonatomic, retain) NSMutableArray *part; //Part of an address line. Contains Strings only.
@property (nonatomic, retain) NSMutableArray *line; //A line of an address (typically used for street names & numbers, unit details, delivery hints, etc.). Contains String's only.
@property (nonatomic, retain) FHIRString *city; //The name of the city, town, village, or other community or delivery centre.
@property (nonatomic, retain) FHIRString *state; //Sub-unit of a country with limited sovereignty in a federally organized country. A code may be used if codes are in common use (i.e. US 2 letter state codes).
@property (nonatomic, retain) FHIRString *zip; //A postal code designating a region defined by the postal service.
@property (nonatomic, retain) FHIRString *country; //Country. ISO 3166 3 letter codes can be used in place of a full country name.
@property (nonatomic, retain) FHIRString *dpid; //A value that uniquely identifies the postal address. (Often used in barcodes).
@property (nonatomic, retain) FHIRPeriod *period; //Time period when address was/is in use.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this Address Object
- (void)addressParser:(NSDictionary *)dictionary; //sets this address object from an NSdictionary

@end
