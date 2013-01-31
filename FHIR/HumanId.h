//
//  HumanId.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

/**
 * An identifier that humans use. This is different from a system identifier because identifiers that humans use are regularly changed or retired due to human intervention and error. Note that a human identifier may be a system identifier on some master system but becomes a human identifier elsewhere due to how it is exchanged between humans. Driver's license numbers are a good example of this. Also, because human mediated identifiers are often invoked as implicit links to external business processes, such identifiers are often associated with multiple different resources.
 */

#import <Foundation/Foundation.h>
#import "Type.h"
#import "String_.h"
#import "ResourceReference.h"
#import "Identifier.h"
#import "Period.h"

typedef enum
{
    usual, // the identifier recommended for display and use in real-world interactions
    official, // the identifier considered to be most trusted for the identification of this item
    temp //A temporary identifier
}IdentifierUse;

@interface HumanId : Type

- (IdentifierUse *)getUse;
- (void)setUse:(IdentifierUse *)value;
- (String_ *)getLabel;
- (void)setLabel:(String_ *)value;
- (Identifier *)getIdentifier;
- (void)setIdentifier:(Identifier *)value;
- (Period *)getPeriod;
- (void)setPeriod:(Period *)value;
- (ResourceReference *)getAssigner;
- (void)setAssigner:(ResourceReference *)value;

@end
