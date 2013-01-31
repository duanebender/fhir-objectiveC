//
//  HumanId.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "HumanId.h"

@interface HumanId()
{
    IdentifierUse use;
}
@property (nonatomic) IdentifierUse *use; //Identifies the use for this identifier, if known
@property (nonatomic, retain) String_ *label; //A label for the identifier that can be displayed to a human so they can recognise the identifier
@property (nonatomic,retain) Identifier *identifier; //The identifier itself
@property (nonatomic, retain) Period *period; //Time period during which identifier was valid for use
@property (nonatomic, retain) ResourceReference *assigner; //Organisation that issued/manages the identifier

@end

@implementation HumanId

- (IdentifierUse *)fromCode:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return NULL;
    else if ([codeString caseInsensitiveCompare:@"usual"] == TRUE) return usual;
    else if ([codeString caseInsensitiveCompare:@"official"] == TRUE) return official;
    else if ([codeString caseInsensitiveCompare:@"temp"] == TRUE) return temp;
    else [NSException raise:@"Unknown Narrative Status" format:@"code %@", codeString];
};

- (NSString *)toCode
{
    switch (use)
    {
        case usual:
            return @"usual";
            break;
        case official:
            return @"official";
            break;
        case temp:
            return @"temp";
            break;
            
        default:
            return @"?";
    }
}

- (IdentifierUse *)getUse
{
    return self.use;
}

- (void)setUse:(IdentifierUse *)value
{
    self.use = value;
}

- (String_ *)getLabel
{
    return self.label;
}

- (void)setLabel:(String_ *)value
{
    self.label = value;
}

- (Identifier *)getIdentifier
{
    return self.identifier;
}

- (void)setIdentifier:(Identifier *)value
{
    self.identifier = value;
}

- (Period *)getPeriod
{
    return self.period;
}

- (void)setPeriod:(Period *)value
{
    self.period = value;
}

- (ResourceReference *)getAssigner
{
    return self.assigner;
}

- (void)setAssigner:(ResourceReference *)value
{
    self.assigner = value;
}

@end
