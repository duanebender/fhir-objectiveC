//
//  HumanId.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "HumanId.h"

@implementation HumanId

@synthesize use = _use;

- (NSInteger)fromCode:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return 0;
    else if ([codeString caseInsensitiveCompare:@"usual"] == TRUE) return usual;
    else if ([codeString caseInsensitiveCompare:@"official"] == TRUE) return official;
    else if ([codeString caseInsensitiveCompare:@"temp"] == TRUE) return temp;
    else [NSException raise:@"Unknown Identifier" format:@"code %@", codeString];
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
