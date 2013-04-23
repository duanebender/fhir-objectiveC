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
#import "ResourceReference.h"
#import "Identifier.h"
#import "Period.h"

typedef enum IdentifierUse
{
    IdentifierUseUsual = 1, // the identifier recommended for display and use in real-world interactions
    IdentifierUseOfficial, // the identifier considered to be most trusted for the identification of this item
    IdentifierUseTemp //A temporary identifier
}IdentifierUse;

@interface HumanId : Type

@property (nonatomic, retain) FHIRResourceDictionary *humanIdDictionary; //dictionary of all HumanId resources

@property (nonatomic) NSInteger use; //Identifies the use for this identifier, if known
@property (nonatomic, retain) String *useSV; //use value parser value
@property (nonatomic, retain) String *label; //A label for the identifier that can be displayed to a human so they can recognise the identifier
@property (nonatomic,retain)  Identifier *identifier; //The identifier itself, should be Identifier?
@property (nonatomic, retain) Period *period; //Time period during which identifier was valid for use
@property (nonatomic, retain) ResourceReference *assigner; //Organisation that issued/manages the identifier

//- (void)setValueUse:(NSString *)codeString; //set IdentifierUse Using a string
//- (NSString *)returnStringUse; //get IdentifierUse as a String

- (NSDictionary *)generateAndReturnDictionary; //returns resource ready to be formatted
- (void)humanIdParser:(NSDictionary *)dictionary; //set humanid from dictionary

@end
