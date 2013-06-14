//
//  HumanId.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * An identifier that humans use. This is different from a system identifier because identifiers that humans use are regularly changed or retired due to human intervention and error. Note that a human identifier may be a system identifier on some master system but becomes a human identifier elsewhere due to how it is exchanged between humans. Driver's license numbers are a good example of this. Also, because human mediated identifiers are often invoked as implicit links to external business processes, such identifiers are often associated with multiple different resources.
 */

#import <Foundation/Foundation.h>
#import "FHIRResourceReference.h"
#import "FHIRIdentifier.h"
#import "FHIRPeriod.h"

//Type definitions for the Use value
typedef enum IdentifierUse
{
    IdentifierUseUsual = 1, // the identifier recommended for display and use in real-world interactions
    IdentifierUseOfficial, // the identifier considered to be most trusted for the identification of this item
    IdentifierUseTemp //A temporary identifier
}IdentifierUse;

@interface FHIRHumanId : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *humanIdDictionary; //dictionary of all HumanId resources

//following properties are individual parts of the HumanId Object that can be influenced Individually
@property (nonatomic) NSInteger use; //Identifies the use for this identifier, if known
@property (nonatomic, retain) FHIRString *useSV; //use value parser value
@property (nonatomic, retain) FHIRString *label; //A label for the identifier that can be displayed to a human so they can recognise the identifier
@property (nonatomic,retain)  FHIRIdentifier *identifier; //The identifier itself, should be Identifier?
@property (nonatomic, retain) FHIRPeriod *period; //Time period during which identifier was valid for use
@property (nonatomic, retain) FHIRResourceReference *assigner; //Organisation that issued/manages the identifier

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of HumanId containing all it's elements
- (void)humanIdParser:(NSDictionary *)dictionary; //set humanid from an NSdictionary

@end
