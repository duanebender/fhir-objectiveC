//
//  HumanName.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "HumanName.h"

@implementation HumanName

@synthesize use = _use;

- (NSInteger)fromCode:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return 0;
    else if ([codeString caseInsensitiveCompare:@"usual"] == TRUE) return usual;
    else if ([codeString caseInsensitiveCompare:@"official"] == TRUE) return official;
    else if ([codeString caseInsensitiveCompare:@"temp"] == TRUE) return temp;
    else if ([codeString caseInsensitiveCompare:@"nickname"] == TRUE) return nickname;
    else if ([codeString caseInsensitiveCompare:@"annonymous"] == TRUE) return annonymous;
    else if ([codeString caseInsensitiveCompare:@"old"] == TRUE) return old;
    else if ([codeString caseInsensitiveCompare:@"maiden"] == TRUE) return maiden;
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
        case nickname:
            return @"nickname";
            break;
        case annonymous:
            return @"annonymous";
            break;
        case old:
            return @"old";
            break;
        case maiden:
            return @"maiden";
            break;
            
        default:
            return @"?";
    }
}

- (NameUse *)getUse
{
    return self.use;
}

- (void)setUse:(NameUse *)value
{
    self.use = value;
}

- (String_ *)getText
{
    return self.text;
}

- (void)setText:(String_ *)value
{
    self.text = value;
}

- (NSMutableArray *)getFamily
{
    return self.family;
}

- (NSMutableArray *)getGiven
{
    return self.given;
}

- (NSMutableArray *)getPrefix
{
    return self.prefix;
}

- (NSMutableArray *)getSuffix
{
    return self.suffix;
}

- (Period *)getPeriod
{
    return self.period;
}

- (void)setPeriod:(Period *)value
{
    self.period = value;
}

@end
